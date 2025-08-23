<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "newborn_shop1";

// Kết nối CSDL
$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Kiểm tra ID
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo "ID người dùng không hợp lệ.";
    exit;
}

$user_id = intval($_GET['id']);

// ----------------------
// XÓA DỮ LIỆU LIÊN QUAN
// ----------------------

// 1. Xóa chi tiết hóa đơn của các hóa đơn thuộc user
$conn->query("
    DELETE chitiet_hoadon 
    FROM chitiet_hoadon 
    INNER JOIN thanhtoan ON chitiet_hoadon.hoa_don_id = thanhtoan.id 
    WHERE thanhtoan.user_id = $user_id
");

// 2. Xóa các hóa đơn của user
$conn->query("DELETE FROM thanhtoan WHERE user_id = $user_id");

// 3. Xóa giỏ hàng của user (nếu có)
$conn->query("DELETE FROM gio_hang WHERE user_id = $user_id");

// ----------------------
// XÓA NGƯỜI DÙNG
// ----------------------
$delete_query = "DELETE FROM users WHERE id = ?";
$stmt = $conn->prepare($delete_query);
$stmt->bind_param("i", $user_id);

if ($stmt->execute()) {
    echo "Người dùng đã được xóa thành công!";
} else {
    echo "Lỗi khi xóa người dùng: " . $stmt->error;
}

// Chuyển hướng về trang quản lý khách hàng
header("Location: ../Frontend_web/ql_khchhang.php");
exit;
?>
