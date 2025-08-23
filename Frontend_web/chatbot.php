<?php
// Khởi động session để quản lý người dùng
session_start();

// Thông tin kết nối database
const DB_HOST = 'localhost';
const DB_USER = 'root';
const DB_PASS = '';
const DB_NAME = 'newborn_shop1';

// API Key cho Gemini 2.0 Flash (thay bằng API Key thực tế của bạn)
const GEMINI_API_KEY = 'YOUR_GEMINI_API_KEY';

/**
 * Kết nối tới database
 * @return mysqli Kết nối database
 * @throws Exception Nếu kết nối thất bại
 */
function connectDatabase() {
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    if ($conn->connect_error) {
        throw new Exception('Kết nối database thất bại: ' . $conn->connect_error);
    }
    $conn->set_charset('utf8mb4');
    return $conn;
}

/**
 * Tạo bảng chatbot_messages nếu chưa tồn tại
 * @param mysqli $conn Kết nối database
 */
function createMessagesTable($conn) {
    $query = "
        CREATE TABLE IF NOT EXISTS chatbot_messages (
            id INT AUTO_INCREMENT PRIMARY KEY,
            user_id INT NULL,
            message TEXT NOT NULL,
            is_bot TINYINT(1) DEFAULT 0,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            INDEX idx_user_id (user_id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci";
    $conn->query($query);
}

/**
 * Tìm kiếm thông tin trong tất cả các bảng database
 * @param string $message Tin nhắn từ người dùng
 * @param mysqli $conn Kết nối database
 * @param int|null $user_id ID người dùng (nếu có)
 * @return array Mảng chứa phản hồi và flag cần gọi API
 */
function searchDatabase($message, $conn, $user_id) {
    $message = strtolower(trim($message));
    $keywords = [
        'xin chào' => 'greeting',
        'hello' => 'greeting',
        'chào' => 'greeting',
        'sản phẩm' => 'sanpham',
        'giá' => 'sanpham',
        'mua' => 'sanpham',
        'hàng' => 'sanpham',
        'bé mặc' => 'sanpham',
        'bé ngủ' => 'sanpham',
        'bé chơi' => 'sanpham',
        'bé ăn uống' => 'sanpham',
        'bé vệ sinh' => 'sanpham',
        'bé ra ngoài' => 'sanpham',
        'giỏ hàng' => 'gio_hang',
        'đơn hàng' => 'thanhtoan',
        'chi tiết đơn' => 'chitiet_hoadon',
        'tài khoản' => 'users',
        'người dùng' => 'users'
    ];

    $response = "";
    $needsApi = stripos($message, 'cách sử dụng') !== false || 
                stripos($message, 'hướng dẫn') !== false || 
                stripos($message, 'thông tin thêm') !== false ||
                stripos($message, 'mẹo') !== false ||
                stripos($message, 'cách chăm sóc') !== false;

    // Kiểm tra từ khóa
    $table = null;
    foreach ($keywords as $keyword => $tbl) {
        if (stripos($message, $keyword) !== false) {
            $table = $tbl;
            break;
        }
    }

    if ($table === 'greeting') {
        $response = "Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n";
        return ['response' => $response, 'needsApi' => false];
    }

    if ($table) {
        switch ($table) {
            case 'sanpham':
                $stmt = $conn->prepare("
                    SELECT ten_san_pham, gia, loai_san_pham, mo_ta, so_luong 
                    FROM sanpham 
                    WHERE LOWER(ten_san_pham) LIKE ? OR LOWER(loai_san_pham) LIKE ?
                    LIMIT 5
                ");
                $searchTerm = "%$message%";
                $stmt->bind_param('ss', $searchTerm, $searchTerm);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $response = "Dưới đây là các sản phẩm phù hợp:\n\n";
                    while ($row = $result->fetch_assoc()) {
                        $response .= sprintf(
                            "- **%s** (Loại: %s)\n  - Giá: %s VNĐ\n  - Mô tả: %s\n  - Số lượng còn lại: %d\n\n",
                            htmlspecialchars($row['ten_san_pham']),
                            htmlspecialchars($row['loai_san_pham']),
                            number_format($row['gia'], 0, ',', '.'),
                            htmlspecialchars($row['mo_ta']),
                            $row['so_luong']
                        );
                    }
                } else {
                    $response = "Không tìm thấy sản phẩm phù hợp trong cửa hàng:\n\n- Vui lòng thử từ khóa khác.\n";
                }
                $stmt->close();
                break;

            case 'gio_hang':
                if (!$user_id) {
                    $response = "Vui lòng đăng nhập để xem giỏ hàng:\n\n- Đăng nhập để tiếp tục.\n";
                    break;
                }
                $stmt = $conn->prepare("
                    SELECT s.ten_san_pham, g.so_luong, s.gia, (g.so_luong * s.gia) AS thanh_tien
                    FROM gio_hang g
                    INNER JOIN sanpham s ON g.san_pham_id = s.id
                    WHERE g.user_id = ?
                ");
                $stmt->bind_param('i', $user_id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $response = "Giỏ hàng của bạn:\n\n";
                    $total = 0;
                    while ($row = $result->fetch_assoc()) {
                        $response .= sprintf(
                            "- **%s**\n  - Số lượng: %d\n  - Giá đơn vị: %s VNĐ\n  - Thành tiền: %s VNĐ\n\n",
                            htmlspecialchars($row['ten_san_pham']),
                            $row['so_luong'],
                            number_format($row['gia'], 0, ',', '.'),
                            number_format($row['thanh_tien'], 0, ',', '.')
                        );
                        $total += $row['thanh_tien'];
                    }
                    $response .= sprintf("- **Tổng cộng**: %s VNĐ\n\n", number_format($total, 0, ',', '.'));
                } else {
                    $response = "Giỏ hàng của bạn đang trống:\n\n- Hãy thêm sản phẩm để mua sắm!\n";
                }
                $stmt->close();
                break;

            case 'thanhtoan':
                if (!$user_id) {
                    $response = "Vui lòng đăng nhập để xem đơn hàng:\n\n- Đăng nhập để tiếp tục.\n";
                    break;
                }
                $stmt = $conn->prepare("
                    SELECT id, hoTen, email, soDienThoai, diaChi, ngayThanhToan, tongTien
                    FROM thanhtoan
                    WHERE user_id = ?
                    ORDER BY ngayThanhToan DESC
                    LIMIT 5
                ");
                $stmt->bind_param('i', $user_id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $response = "Các đơn hàng gần đây của bạn:\n\n";
                    while ($row = $result->fetch_assoc()) {
                        $response .= sprintf(
                            "- **Đơn hàng ID: %d**\n  - Tên: %s\n  - Email: %s\n  - Số điện thoại: %s\n  - Địa chỉ: %s\n  - Ngày đặt: %s\n  - Tổng tiền: %s VNĐ\n\n",
                            $row['id'],
                            htmlspecialchars($row['hoTen']),
                            htmlspecialchars($row['email']),
                            htmlspecialchars($row['soDienThoai']),
                            htmlspecialchars($row['diaChi']),
                            $row['ngayThanhToan'],
                            number_format($row['tongTien'], 0, ',', '.')
                        );
                    }
                } else {
                    $response = "Bạn chưa có đơn hàng nào:\n\n- Hãy mua sắm để tạo đơn hàng!\n";
                }
                $stmt->close();
                break;

            case 'chitiet_hoadon':
                preg_match('/\d+/', $message, $matches);
                $hoa_don_id = isset($matches[0]) ? (int)$matches[0] : 0;

                if (!$user_id || !$hoa_don_id) {
                    $response = "Vui lòng cung cấp ID đơn hàng và đăng nhập:\n\n- Đăng nhập để xem chi tiết đơn hàng.\n- Cung cấp ID hợp lệ (ví dụ: 'chi tiết đơn 42').\n";
                    break;
                }
                $stmt = $conn->prepare("
                    SELECT s.ten_san_pham, c.soLuong, c.giaTien, c.thanhTien
                    FROM chitiet_hoadon c
                    INNER JOIN sanpham s ON c.san_pham_id = s.id
                    INNER JOIN thanhtoan t ON c.hoa_don_id = t.id
                    WHERE c.hoa_don_id = ? AND t.user_id = ?
                ");
                $stmt->bind_param('ii', $hoa_don_id, $user_id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $response = "Chi tiết đơn hàng ID $hoa_don_id:\n\n";
                    while ($row = $result->fetch_assoc()) {
                        $response .= sprintf(
                            "- **%s**\n  - Số lượng: %d\n  - Giá đơn vị: %s VNĐ\n  - Thành tiền: %s VNĐ\n\n",
                            htmlspecialchars($row['ten_san_pham']),
                            $row['soLuong'],
                            number_format($row['giaTien'], 0, ',', '.'),
                            number_format($row['thanhTien'], 0, ',', '.')
                        );
                    }
                } else {
                    $response = "Không tìm thấy chi tiết đơn hàng ID $hoa_don_id:\n\n- Vui lòng kiểm tra lại ID đơn hàng.\n";
                }
                $stmt->close();
                break;

            case 'users':
                if (!$user_id) {
                    $response = "Vui lòng đăng nhập để xem thông tin tài khoản:\n\n- Đăng nhập để tiếp tục.\n";
                    break;
                }
                $stmt = $conn->prepare("
                    SELECT name, phone, email, address, created_at
                    FROM users
                    WHERE id = ?
                ");
                $stmt->bind_param('i', $user_id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $response = "Thông tin tài khoản của bạn:\n\n";
                    $response .= sprintf(
                        "- **Tên**: %s\n- **Số điện thoại**: %s\n- **Email**: %s\n- **Địa chỉ**: %s\n- **Ngày tạo**: %s\n\n",
                        htmlspecialchars($row['name']),
                        htmlspecialchars($row['phone']),
                        htmlspecialchars($row['email']),
                        htmlspecialchars($row['address']),
                        $row['created_at']
                    );
                } else {
                    $response = "Không tìm thấy thông tin tài khoản:\n\n- Vui lòng kiểm tra lại.\n";
                }
                $stmt->close();
                break;
        }
    }

    // Nếu không có phản hồi từ database hoặc không khớp với từ khóa, chuyển sang API
    if (!$response && !$table) {
        return ['response' => '', 'needsApi' => true];
    }
    return ['response' => $response, 'needsApi' => $needsApi];
}

/**
 * Gọi Gemini 2.0 Flash API với yêu cầu định dạng phản hồi rõ ràng
 * @param string $message Tin nhắn từ người dùng
 * @param string|null $context Phản hồi từ database (nếu có)
 * @return string Phản hồi từ API
 * @throws Exception Nếu gọi API thất bại
 */
function callGeminiAPI($message, $context = null) {
    if (empty(GEMINI_API_KEY)) {
        throw new Exception('API Key không được thiết lập. Vui lòng kiểm tra và cập nhật trong mã.');
    }

    $url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';
    $prompt = "Bạn là trợ lý mua sắm cho cửa hàng Nous, chuyên cung cấp sản phẩm cho trẻ sơ sinh. Hãy trả lời câu hỏi sau một cách thân thiện, chuyên nghiệp, và chuyên sâu, định dạng câu trả lời thành danh sách có dấu đầu dòng (-), mỗi ý xuống dòng rõ ràng. Nếu câu hỏi không liên quan trực tiếp đến cửa hàng, hãy cung cấp thông tin hữu ích và chính xác nhất có thể dựa trên kiến thức chung:\n\n";
    if ($context) {
        $prompt .= "Dựa trên thông tin sau từ cửa hàng:\n$context\nHãy trả lời: $message";
    } else {
        $prompt .= $message;
    }

    $data = [
        'contents' => [
            [
                'parts' => [
                    ['text' => $prompt]
                ]
            ]
        ]
    ];

    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_HTTPHEADER => [
            'Content-Type: application/json',
            'X-goog-api-key: ' . GEMINI_API_KEY
        ],
        CURLOPT_POSTFIELDS => json_encode($data),
        CURLOPT_TIMEOUT => 10
    ]);

    $response = curl_exec($ch);
    if (curl_errno($ch)) {
        throw new Exception('Lỗi cURL khi gọi Gemini API: ' . curl_error($ch));
    }
    curl_close($ch);

    $responseData = json_decode($response, true);
    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Lỗi giải mã JSON từ Gemini API: ' . json_last_error_msg());
    }
    if (!isset($responseData['candidates'][0]['content']['parts'][0]['text'])) {
        throw new Exception('Không nhận được phản hồi hợp lệ từ Gemini API. Kiểm tra API Key, giới hạn sử dụng, hoặc kết nối mạng.');
    }

    return $responseData['candidates'][0]['content']['parts'][0]['text'];
}

/**
 * Lưu tin nhắn vào database
 * @param mysqli $conn Kết nối database
 * @param int|null $user_id ID người dùng
 * @param string $message Tin nhắn
 * @param bool $isBot Có phải tin nhắn của bot không
 */
function saveMessage($conn, $user_id, $message, $isBot = false) {
    $stmt = $conn->prepare("INSERT INTO chatbot_messages (user_id, message, is_bot) VALUES (?, ?, ?)");
    $isBotInt = (int)$isBot;
    $stmt->bind_param('isi', $user_id, $message, $isBotInt);
    $stmt->execute();
    $stmt->close();
}

// Xử lý yêu cầu chính
try {
    $conn = connectDatabase();
    createMessagesTable($conn);

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $input = json_decode(file_get_contents('php://input'), true);
        $message = trim($input['message'] ?? '');

        if (empty($message)) {
            echo json_encode(['success' => false, 'message' => "Tin nhắn không được để trống:\n\n- Vui lòng nhập câu hỏi hoặc yêu cầu."]);
            exit;
        }

        $user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;

        // Lưu tin nhắn người dùng
        saveMessage($conn, $user_id, $message);

        // Tìm kiếm trong database
        $dbResult = searchDatabase($message, $conn, $user_id);
        $bot_response = $dbResult['response'];

        // Gọi Gemini API nếu cần hoặc không có phản hồi từ database
        if ($dbResult['needsApi'] || !$bot_response) {
            try {
                error_log("Gọi Gemini API cho câu hỏi: $message tại " . date('Y-m-d H:i:s'));
                $api_response = callGeminiAPI($message, $bot_response);
                if ($bot_response) {
                    $bot_response .= "\nThông tin bổ sung từ nguồn ngoài:\n\n" . $api_response;
                } else {
                    $bot_response = $api_response;
                }
            } catch (Exception $e) {
                $error_msg = "Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- " . $e->getMessage() . "\n- Vui lòng kiểm tra API Key, kết nối mạng, hoặc thử lại sau.";
                $bot_response = $bot_response ?: $error_msg;
                error_log('Gemini API error: ' . $e->getMessage() . ' tại ' . date('Y-m-d H:i:s'));
            }
        }

        // Lưu phản hồi của bot
        saveMessage($conn, $user_id, $bot_response, true);

        echo json_encode(['success' => true, 'message' => $bot_response]);
    } elseif ($_SERVER['REQUEST_METHOD'] === 'GET') {
        // Lấy lịch sử trò chuyện
        $user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;
        $stmt = $conn->prepare("
            SELECT message, is_bot 
            FROM chatbot_messages 
            WHERE user_id = ? OR user_id IS NULL 
            ORDER BY created_at ASC 
            LIMIT 50
        ");
        $stmt->bind_param('i', $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        $messages = [];
        while ($row = $result->fetch_assoc()) {
            $messages[] = [
                'message' => $row['message'],
                'is_bot' => (bool)$row['is_bot']
            ];
        }

        echo json_encode($messages);
        $stmt->close();
    }

    $conn->close();
} catch (Exception $e) {
    error_log('Chatbot error: ' . $e->getMessage() . ' tại ' . date('Y-m-d H:i:s'));
    echo json_encode(['success' => false, 'message' => "Lỗi hệ thống:\n\n- " . $e->getMessage() . "\n- Vui lòng thử lại sau."]);
}
?>