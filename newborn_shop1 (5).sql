-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 23, 2025 lúc 06:23 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `newborn_shop1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chatbot_messages`
--

CREATE TABLE `chatbot_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `is_bot` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chatbot_messages`
--

INSERT INTO `chatbot_messages` (`id`, `user_id`, `message`, `is_bot`, `created_at`) VALUES
(27, 55, 'xin chào', 0, '2025-08-20 18:47:04'),
(28, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 18:47:04'),
(29, 55, 'xin chào', 0, '2025-08-20 18:50:37'),
(30, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 18:50:38'),
(31, 55, 'bé mặc', 0, '2025-08-20 18:50:49'),
(32, 55, 'Dưới đây là các sản phẩm phù hợp:\n\n- **bé mặc 4** (Loại: Bé mặc)\n  - Giá: 120.000 VNĐ\n  - Mô tả: Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.\n  - Số lượng còn lại: 22\n\n- **bé mặc 6** (Loại: Bé mặc)\n  - Giá: 210.000 VNĐ\n  - Mô tả: Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.\n  - Số lượng còn lại: 1111\n\n- **bé mặc 7** (Loại: Bé mặc)\n  - Giá: 230.000 VNĐ\n  - Mô tả: Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.\n  - Số lượng còn lại: 22\n\n- **bé mặc 8** (Loại: Bé mặc)\n  - Giá: 240.000 VNĐ\n  - Mô tả: Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.\n  - Số lượng còn lại: 4\n\n- **Áo khoác bomber màu ghi in họa tiết** (Loại: Bé mặc)\n  - Giá: 215.000 VNĐ\n  - Mô tả: Họa tiết trên nền xám đơn giản, dễ dàng phối với các item hoàn thiện set đồ tinh tươm \n  - Số lượng còn lại: 1111\n\n', 1, '2025-08-20 18:50:49'),
(33, 55, 'mu là clb nào', 0, '2025-08-20 18:51:14'),
(34, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 18:51:16'),
(35, 55, 'xin chào', 0, '2025-08-20 18:54:22'),
(36, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 18:54:23'),
(37, 55, 'so sánh các loại sữa', 0, '2025-08-20 18:55:39'),
(38, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 18:55:40'),
(39, 55, 'xin chào', 0, '2025-08-20 18:55:49'),
(40, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 18:55:50'),
(41, 55, 'xin chào', 0, '2025-08-20 18:56:42'),
(42, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-20 18:56:42'),
(43, 55, 'khách hàng mật khẩu là gì', 0, '2025-08-20 18:56:59'),
(44, 55, 'Không tìm thấy sản phẩm phù hợp trong cửa hàng:\n\n- Vui lòng thử từ khóa khác.\n', 1, '2025-08-20 18:56:59'),
(45, 55, 'có bao nhiêu loại sữa trong cửa hàng', 0, '2025-08-20 18:57:10'),
(46, 55, 'Không tìm thấy sản phẩm phù hợp trong cửa hàng:\n\n- Vui lòng thử từ khóa khác.\n', 1, '2025-08-20 18:57:10'),
(47, 55, 'áo khoác bomber giá bao nhieu', 0, '2025-08-20 18:57:35'),
(48, 55, 'Không tìm thấy sản phẩm phù hợp trong cửa hàng:\n\n- Vui lòng thử từ khóa khác.\n', 1, '2025-08-20 18:57:35'),
(49, 55, 'bé ngủ 6', 0, '2025-08-20 18:58:03'),
(50, 55, 'Dưới đây là các sản phẩm phù hợp:\n\n- **bé ngủ 6** (Loại: Bé ngủ)\n  - Giá: 213.123 VNĐ\n  - Mô tả: Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.\n  - Số lượng còn lại: 22\n\n', 1, '2025-08-20 18:58:03'),
(51, 55, 'tạm biêtrj', 0, '2025-08-20 18:58:28'),
(52, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 18:58:29'),
(53, 55, 'tạm biệt', 0, '2025-08-20 18:58:32'),
(54, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 18:58:33'),
(55, 55, 'cách chăm sóc trẻ sơ sinh', 0, '2025-08-20 18:59:01'),
(56, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 18:59:03'),
(57, 55, 'người dùng', 0, '2025-08-20 19:00:04'),
(58, 55, 'Thông tin tài khoản của bạn:\n\n- **Tên**: Nguyễn Đức Huy\n- **Số điện thoại**: 0339865545\n- **Email**: kh1@gmail.com\n- **Địa chỉ**: Hà Nội\n- **Ngày tạo**: 2025-08-13 23:59:33\n\n', 1, '2025-08-20 19:00:04'),
(59, 55, 'tài khoản', 0, '2025-08-20 19:00:30'),
(60, 55, 'Thông tin tài khoản của bạn:\n\n- **Tên**: Nguyễn Đức Huy\n- **Số điện thoại**: 0339865545\n- **Email**: kh1@gmail.com\n- **Địa chỉ**: Hà Nội\n- **Ngày tạo**: 2025-08-13 23:59:33\n\n', 1, '2025-08-20 19:00:30'),
(61, 55, 'giỏ hàng', 0, '2025-08-20 19:00:40'),
(62, 55, 'Không tìm thấy sản phẩm phù hợp trong cửa hàng:\n\n- Vui lòng thử từ khóa khác.\n', 1, '2025-08-20 19:00:40'),
(63, 55, 'so sánh bé ngủ 5 và bé ngủ 5', 0, '2025-08-20 19:01:05'),
(64, 55, 'Không tìm thấy sản phẩm phù hợp trong cửa hàng:\n\n- Vui lòng thử từ khóa khác.\n', 1, '2025-08-20 19:01:05'),
(65, 55, 'xin chào', 0, '2025-08-20 19:03:25'),
(66, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-20 19:03:25'),
(67, 55, 'tạm biệt', 0, '2025-08-20 19:03:34'),
(68, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 19:03:34'),
(69, 55, 'helo', 0, '2025-08-20 19:03:42'),
(70, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 19:03:44'),
(71, 55, 'mu là câu lạc bộ nào', 0, '2025-08-20 19:03:52'),
(72, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 19:03:54'),
(73, 55, 'cách sử dụng bé mặc 4', 0, '2025-08-20 19:04:21'),
(74, 55, 'Không tìm thấy sản phẩm phù hợp trong cửa hàng:\n\n- Vui lòng thử từ khóa khác.\n', 1, '2025-08-20 19:04:22'),
(75, 55, 'xin chào', 0, '2025-08-20 19:08:10'),
(76, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-20 19:08:10'),
(77, 55, 'mu là câu lạc bộ nào', 0, '2025-08-20 19:08:20'),
(78, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 19:08:20'),
(79, 55, 'bé ngủ 2', 0, '2025-08-20 19:08:27'),
(80, 55, 'Dưới đây là các sản phẩm phù hợp:\n\n- **bé ngủ 2** (Loại: Bé ngủ)\n  - Giá: 222.222 VNĐ\n  - Mô tả: Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.\n  - Số lượng còn lại: 3\n\n', 1, '2025-08-20 19:08:27'),
(81, 55, 'thông tin', 0, '2025-08-20 19:08:44'),
(82, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 19:08:45'),
(83, 55, 'sữa optimum gold', 0, '2025-08-20 19:10:33'),
(84, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Vui lòng thử lại sau.\n- Kiểm tra kết nối mạng hoặc liên hệ hỗ trợ.', 1, '2025-08-20 19:10:33'),
(85, 55, 'xin chào', 0, '2025-08-20 19:10:57'),
(86, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-20 19:10:57'),
(87, 55, 'xin chào', 0, '2025-08-20 19:12:50'),
(88, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-20 19:12:50'),
(89, 55, 'hello', 0, '2025-08-20 19:12:53'),
(90, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-20 19:12:53'),
(91, 55, 'mu là câu lạc bộ nào', 0, '2025-08-20 19:13:04'),
(92, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Không nhận được phản hồi hợp lệ từ Gemini API. Kiểm tra API Key hoặc giới hạn sử dụng.\n- Vui lòng kiểm tra API Key, kết nối mạng, hoặc thử lại sau.', 1, '2025-08-20 19:13:05'),
(93, 55, 'xin chào', 0, '2025-08-20 19:15:38'),
(94, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-20 19:15:38'),
(95, 55, 'mu là câu lạc bộ nào', 0, '2025-08-20 19:15:43'),
(96, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Không nhận được phản hồi hợp lệ từ Gemini API. Kiểm tra API Key hoặc giới hạn sử dụng.\n- Vui lòng kiểm tra API Key, kết nối mạng, hoặc thử lại sau.', 1, '2025-08-20 19:15:45'),
(97, 55, 'xin chào', 0, '2025-08-20 19:19:47'),
(98, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-20 19:19:47'),
(99, 55, 'mu là câu lạc bộ nào', 0, '2025-08-20 19:19:57'),
(100, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Không nhận được phản hồi hợp lệ từ Gemini API. Kiểm tra API Key, giới hạn sử dụng, hoặc kết nối mạng.\n- Vui lòng kiểm tra API Key, kết nối mạng, hoặc thử lại sau.', 1, '2025-08-20 19:19:59'),
(101, 55, 'bé ăn uống', 0, '2025-08-20 19:20:17'),
(102, 55, 'Dưới đây là các sản phẩm phù hợp:\n\n- **sữa optimum gold** (Loại: Bé ăn uống)\n  - Giá: 150.000 VNĐ\n  - Mô tả: sữa ngon cho bé\n  - Số lượng còn lại: 1111\n\n', 1, '2025-08-20 19:20:17'),
(103, NULL, 'xin chào', 0, '2025-08-20 19:28:38'),
(104, NULL, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-20 19:28:38'),
(105, NULL, 'thông tin người dùng', 0, '2025-08-20 19:28:48'),
(106, NULL, 'Vui lòng đăng nhập để xem thông tin tài khoản:\n\n- Đăng nhập để tiếp tục.\n', 1, '2025-08-20 19:28:48'),
(107, NULL, 'bé chơi', 0, '2025-08-20 19:29:03'),
(108, NULL, 'Dưới đây là các sản phẩm phù hợp:\n\n- **đồ chơi** (Loại: Bé chơi)\n  - Giá: 100.000 VNĐ\n  - Mô tả: abcdefghijk\n  - Số lượng còn lại: 1111\n\n', 1, '2025-08-20 19:29:03'),
(109, 55, 'xin chào', 0, '2025-08-21 07:07:17'),
(110, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-21 07:07:17'),
(111, 55, 'tôi mệt quá', 0, '2025-08-21 07:07:23'),
(112, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Không nhận được phản hồi hợp lệ từ Gemini API. Kiểm tra API Key, giới hạn sử dụng, hoặc kết nối mạng.\n- Vui lòng kiểm tra API Key, kết nối mạng, hoặc thử lại sau.', 1, '2025-08-21 07:07:24'),
(113, 55, 'mu là câu lạc bộ nào', 0, '2025-08-21 07:07:35'),
(114, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Không nhận được phản hồi hợp lệ từ Gemini API. Kiểm tra API Key, giới hạn sử dụng, hoặc kết nối mạng.\n- Vui lòng kiểm tra API Key, kết nối mạng, hoặc thử lại sau.', 1, '2025-08-21 07:07:35'),
(115, NULL, 'bé ăn', 0, '2025-08-21 08:32:38'),
(116, NULL, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Không nhận được phản hồi hợp lệ từ Gemini API. Kiểm tra API Key, giới hạn sử dụng, hoặc kết nối mạng.\n- Vui lòng kiểm tra API Key, kết nối mạng, hoặc thử lại sau.', 1, '2025-08-21 08:32:39'),
(117, NULL, 'bé ăn uống', 0, '2025-08-21 08:32:48'),
(118, NULL, 'Dưới đây là các sản phẩm phù hợp:\n\n- **sữa optimum gold** (Loại: Bé ăn uống)\n  - Giá: 150.000 VNĐ\n  - Mô tả: sữa ngon cho bé\n  - Số lượng còn lại: 1111\n\n- ** Bột ăn dặm Ridielac Gold Gạo Trái cây ** (Loại: Bé ăn uống)\n  - Giá: 400.000 VNĐ\n  - Mô tả: Công thức cân đối tỷ lệ 4 nhóm chất thiết yếu (đạm, béo, bột đường, vitamin &amp; khoáng chất), đảm bảo nhu cầu dinh dưỡng cho trẻ trong giai đoạn ăn dặm.\r\nBổ sung 1 tỷ lợi khuẩn hỗ trợ tiêu hóa khỏe, cùng đa dạng hương vị mặn, ngọt hợp khẩu vị trẻ em Việt, cho bé đổi món mỗi ngày.\n  - Số lượng còn lại: 1111\n\n- ** Bột ăn dặm Ridielac Gold Heo Cà rốt ** (Loại: Bé ăn uống)\n  - Giá: 500.000 VNĐ\n  - Mô tả: Công thức cân đối tỷ lệ 4 nhóm chất thiết yếu (đạm, béo, bột đường, vitamin &amp; khoáng chất), đảm bảo nhu cầu dinh dưỡng cho trẻ trong giai đoạn ăn dặm. Bổ sung 1 tỷ lợi khuẩn hỗ trợ tiêu hóa khỏe, cùng đa dạng hương vị mặn, ngọt hợp khẩu vị trẻ em Việt, cho bé đổi món mỗi ngày.\n  - Số lượng còn lại: 1111\n\n- **Bột ăn dặm Ridielac Gold Yến mạch Sữa** (Loại: Bé ăn uống)\n  - Giá: 350.000 VNĐ\n  - Mô tả: Công thức cân đối tỷ lệ 4 nhóm chất thiết yếu (đạm, béo, bột đường, vitamin &amp; khoáng chất), đảm bảo nhu cầu dinh dưỡng cho trẻ trong giai đoạn ăn dặm.\r\nBổ sung 1 tỷ lợi khuẩn hỗ trợ tiêu hóa khỏe, cùng đa dạng hương vị mặn, ngọt hợp khẩu vị trẻ em Việt, cho bé đổi món mỗi ngày.\n  - Số lượng còn lại: 1111\n\n', 1, '2025-08-21 08:32:48'),
(119, NULL, 'xin chào', 0, '2025-08-22 01:45:08'),
(120, NULL, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-22 01:45:08'),
(121, NULL, 'mu là clb nào', 0, '2025-08-22 01:45:18'),
(122, NULL, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Không nhận được phản hồi hợp lệ từ Gemini API. Kiểm tra API Key, giới hạn sử dụng, hoặc kết nối mạng.\n- Vui lòng kiểm tra API Key, kết nối mạng, hoặc thử lại sau.', 1, '2025-08-22 01:45:19'),
(123, 55, 'xin chào', 0, '2025-08-22 03:49:39'),
(124, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-22 03:49:39'),
(125, 55, '1 + 1 bằng mấy', 0, '2025-08-22 03:49:55'),
(126, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Không nhận được phản hồi hợp lệ từ Gemini API. Kiểm tra API Key, giới hạn sử dụng, hoặc kết nối mạng.\n- Vui lòng kiểm tra API Key, kết nối mạng, hoặc thử lại sau.', 1, '2025-08-22 03:49:55'),
(127, 55, 'xin chào', 0, '2025-08-22 08:32:25'),
(128, 55, 'Chào bạn!\n\n- Rất vui được hỗ trợ bạn tại cửa hàng Nous.\n- Bạn cần tìm sản phẩm, xem giỏ hàng, hay thông tin gì khác? 😊\n', 1, '2025-08-22 08:32:25'),
(129, 55, 'mu là clb nào', 0, '2025-08-22 08:32:30'),
(130, 55, 'Xin lỗi, tôi gặp lỗi khi xử lý yêu cầu của bạn:\n\n- Không nhận được phản hồi hợp lệ từ Gemini API. Kiểm tra API Key, giới hạn sử dụng, hoặc kết nối mạng.\n- Vui lòng kiểm tra API Key, kết nối mạng, hoặc thử lại sau.', 1, '2025-08-22 08:32:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiet_hoadon`
--

CREATE TABLE `chitiet_hoadon` (
  `id` int(11) NOT NULL,
  `hoa_don_id` int(11) NOT NULL,
  `san_pham_id` int(11) NOT NULL,
  `soLuong` int(11) NOT NULL,
  `giaTien` decimal(10,2) NOT NULL,
  `thanhTien` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiet_hoadon`
--

INSERT INTO `chitiet_hoadon` (`id`, `hoa_don_id`, `san_pham_id`, `soLuong`, `giaTien`, `thanhTien`) VALUES
(52, 52, 62, 1, 215000.00, 215000.00),
(53, 52, 36, 1, 200000.00, 200000.00),
(54, 52, 41, 1, 213123.00, 213123.00),
(55, 55, 62, 100, 215000.00, 21500000.00),
(56, 55, 66, 164, 500000.00, 82000000.00),
(57, 56, 33, 1, 210000.00, 210000.00),
(58, 57, 62, 1, 215000.00, 215000.00),
(59, 58, 66, 201, 500000.00, 99999999.99),
(60, 59, 62, 1, 215000.00, 215000.00),
(61, 61, 33, 2, 210000.00, 420000.00),
(62, 62, 33, 1, 210000.00, 210000.00),
(63, 63, 33, 1, 210000.00, 210000.00),
(64, 66, 32, 1, 120000.00, 120000.00),
(65, 66, 34, 1, 230000.00, 230000.00),
(66, 67, 66, 60, 500000.00, 30000000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `san_pham_id` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `ngay_them` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `gia` decimal(10,2) NOT NULL,
  `loai_san_pham` varchar(100) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `so_luong` int(11) NOT NULL,
  `anh_san_pham` varchar(255) DEFAULT NULL,
  `san_pham_noi_bat` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `ten_san_pham`, `gia`, `loai_san_pham`, `mo_ta`, `so_luong`, `anh_san_pham`, `san_pham_noi_bat`) VALUES
(32, 'bé mặc 4', 120000.00, 'Bé mặc', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 22, 'uploads/NB5.webp', 0),
(33, 'bé mặc 6', 210000.00, 'Bé mặc', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 1111, 'uploads/NB6.webp', 0),
(34, 'bé mặc 7', 230000.00, 'Bé mặc', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 22, 'uploads/7_be_mac.webp', 0),
(35, 'bé mặc 8', 240000.00, 'Bé mặc', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 4, 'uploads/8_be_mac.webp', 0),
(36, 'bé ngủ 1', 200000.00, 'Bé ngủ', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 2, 'uploads/1_sheeping.webp', 0),
(37, 'bé ngủ 2', 222222.00, 'Bé ngủ', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 3, 'uploads/2_sleeping.webp', 0),
(38, 'bé ngủ 3', 230000.00, 'Bé ngủ', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 2, 'uploads/3_sleeping.webp', 0),
(39, 'bé ngủ 4', 231000.00, 'Bé ngủ', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 2, 'uploads/4_sleeping.webp', 0),
(40, 'bé ngủ 5', 240000.00, 'Bé ngủ', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 23, 'uploads/5_sleeping.webp', 0),
(41, 'bé ngủ 6', 213123.00, 'Bé ngủ', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 22, 'uploads/6_sleeping.webp', 0),
(43, 'bé ngủ 8', 213332.00, 'Bé ngủ', 'Mang lại sự thoải mái để lớn khôn luôn là\r\nhành trình hạnh phúc.\r\nThế giới mà con trẻ nhìn thấy khác với những gì người lớn thấy.\r\nNó rộng lớn, mới lạ và đầy bất ngờ.', 2, 'uploads/8_sleeping.png', 0),
(62, 'Áo khoác bomber màu ghi in họa tiết', 215000.00, 'Bé mặc', 'Họa tiết trên nền xám đơn giản, dễ dàng phối với các item hoàn thiện set đồ tinh tươm ', 1111, 'Uploads/aokhoac.jpg', 1),
(63, 'bé chơi 1', 100000.00, 'Bé chơi', 'abcdefghijk', 1111, 'uploads/bechoi.webp', 0),
(64, 'sữa optimum gold', 150000.00, 'Bé ăn uống', 'sữa ngon cho bé', 1111, 'uploads/loai-sua-bot-tot-nhat-cho-tre-so-sinh.jpg', 0),
(65, 'bỉm bobby', 50000.00, 'Bé vệ sinh', 'đồ vệ sinh cho bé', 1111, 'uploads/tre-so-sinh-dung-mieng-lot-hay-ta-dan.jpg', 0),
(66, 'bé ra ngoài 1', 500000.00, 'Bé ra ngoài', 'xe đẩy em bé đi chơi', 1111, 'uploads/Xe-day-em-be-Chilux-nau.png', 0),
(67, 'bé chơi 2', 50000.00, 'Bé chơi', 'abcdedkjhfzs', 100, 'uploads/do-choi-go---luc-lac-meo.jpg', 0),
(68, 'bé chơi 3', 100000.00, 'Bé chơi', 'dfgsdkjhfgs', 3, 'uploads/do-choi-cho-tre-so-sinh-1752111477.jpg', 0),
(69, 'bé chơi 4', 30000.00, 'Bé chơi', 'dfsulghsdedfd', 1111, 'uploads/rt667-3.jpg', 0),
(70, ' Bột ăn dặm Ridielac Gold Gạo Trái cây ', 400000.00, 'Bé ăn uống', 'Công thức cân đối tỷ lệ 4 nhóm chất thiết yếu (đạm, béo, bột đường, vitamin & khoáng chất), đảm bảo nhu cầu dinh dưỡng cho trẻ trong giai đoạn ăn dặm.\r\nBổ sung 1 tỷ lợi khuẩn hỗ trợ tiêu hóa khỏe, cùng đa dạng hương vị mặn, ngọt hợp khẩu vị trẻ em Việt, cho bé đổi món mỗi ngày.', 1111, 'uploads/BAD_GAO_TRAI_CAY_1_giay_2dfd5342ed_98557d9ab9.png', 0),
(71, ' Bột ăn dặm Ridielac Gold Heo Cà rốt ', 500000.00, 'Bé ăn uống', 'Công thức cân đối tỷ lệ 4 nhóm chất thiết yếu (đạm, béo, bột đường, vitamin & khoáng chất), đảm bảo nhu cầu dinh dưỡng cho trẻ trong giai đoạn ăn dặm. Bổ sung 1 tỷ lợi khuẩn hỗ trợ tiêu hóa khỏe, cùng đa dạng hương vị mặn, ngọt hợp khẩu vị trẻ em Việt, cho bé đổi món mỗi ngày.', 1111, 'uploads/BAD_HEO_CA_ROT_1_thiec_49181848ae_06fd3673dc.png', 0),
(72, 'Bột ăn dặm Ridielac Gold Yến mạch Sữa', 350000.00, 'Bé ăn uống', 'Công thức cân đối tỷ lệ 4 nhóm chất thiết yếu (đạm, béo, bột đường, vitamin & khoáng chất), đảm bảo nhu cầu dinh dưỡng cho trẻ trong giai đoạn ăn dặm.\r\nBổ sung 1 tỷ lợi khuẩn hỗ trợ tiêu hóa khỏe, cùng đa dạng hương vị mặn, ngọt hợp khẩu vị trẻ em Việt, cho bé đổi món mỗi ngày.', 1111, 'uploads/BAD_YEN_MACH_SUA_1_thiec_5e7cd17768_454e6d2a28.png', 0),
(73, 'Tã Moony', 30000.00, 'Bé vệ sinh', 'fgusdyfgid', 1111, 'uploads/pkg-mny-mn-nb-710-710.png', 0),
(74, 'Tã Huggies', 100000.00, 'Bé vệ sinh', 'fdgfdgdfgfdg', 1111, 'uploads/top-6-san-pham-ta-dan-cho-tre-so-sinh-duoi-1-thang-tuoi-1-min.png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtoan`
--

CREATE TABLE `thanhtoan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hoTen` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `soDienThoai` varchar(15) NOT NULL,
  `diaChi` varchar(255) NOT NULL,
  `ngayThanhToan` datetime NOT NULL,
  `tongTien` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhtoan`
--

INSERT INTO `thanhtoan` (`id`, `user_id`, `hoTen`, `email`, `soDienThoai`, `diaChi`, `ngayThanhToan`, `tongTien`) VALUES
(52, 55, 'nguyễn đức huy', 'huybom12604@gmail.com', '0339865545', 'hà nội', '2025-08-14 00:00:13', 628123.00),
(55, 55, 'Vương Ngọc Ánh', 'vuongngocanh1309@gmail.com', '0123456789', 'hà nội', '2025-08-18 14:18:22', 99999999.99),
(56, 55, 'nguyễn đức huy', 'nguyenhuyzuka@gmail.com', '0339865545', 'hà nội', '2025-08-18 14:27:56', 210000.00),
(57, 55, 'Vương Ngọc Ánh', 'vuongngocanh1309@gmail.com', '0123456789', 'hà nội', '2025-08-18 14:29:30', 215000.00),
(58, 55, 'nguyễn đức huy', 'nguyenhuyzuka@gmail.com', '0339865545', 'hà nội', '2025-08-18 14:35:22', 99999999.99),
(59, 55, 'nguyễn đức huy', 'huybom12604@gmail.com', '0339865545', 'hà nội', '2025-08-18 14:42:20', 215000.00),
(61, 55, 'nguyễn đức huy', 'nguyenhuyzuka@gmail.com', '0339865545', 'hà nội', '2025-08-18 14:44:46', 420000.00),
(62, 55, 'nguyễn đức huy', 'huybom12064@gmail.com', '0339865545', 'hà nội', '2025-08-18 14:48:39', 210000.00),
(63, 55, 'nguyễn đức huy', 'nguyenhuyzuka@gmail.com', '0339865545', 'hà nội', '2025-08-18 14:51:03', 210000.00),
(66, 55, 'nguyễn đức huy', 'tham201276@gmail.com', '0339865545', 'hà nội', '2025-08-21 02:48:40', 350000.00),
(67, 55, 'Mai Hương', 'yen883669@gmail.com', '0123456789', 'hà nội', '2025-08-21 14:22:56', 30000000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','khachhang','nhanvien') NOT NULL DEFAULT 'khachhang',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `address`, `password`, `role`, `created_at`) VALUES
(31, 'admin', '1231231232', 'admin123@gmail.com', 'Hà nội', '$2y$10$6X9OStq8VnQE05j.c/AGVOYm3LtKe.TojlE6PXg94nORDPQw097qi', 'admin', '2025-04-26 08:38:02'),
(47, 'Nguyễn Đức Huy', '0339865545', 'nguyenhuy12064@gmail.com', 'Hà Nội', '$2y$10$9vLacRiNnpUjwPDGhv8sye4UOFmOoFokccMMlIxnTWvCHG2dpHrOK', 'admin', '2025-08-08 19:17:40'),
(53, 'Nguyễn Đức Huy', '0339865545', 'nv1@gmail.com', 'Hà Nội', '$2y$10$trwDGsPEVZK5RUDQY8RAS.CX334lbI/KkTbF.tR5W6xA60esOie7C', 'nhanvien', '2025-08-13 06:12:31'),
(55, 'Nguyễn Đức Huy', '0339865545', 'kh1@gmail.com', 'Hà Nội', '$2y$10$pOofVN4nNQjiki0PL9JNI.eyrUdEThQZ6G7eM/fy1AFxXZIEzhZDy', 'khachhang', '2025-08-13 16:59:33');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chatbot_messages`
--
ALTER TABLE `chatbot_messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitiet_hoadon`
--
ALTER TABLE `chitiet_hoadon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hoa_don_id` (`hoa_don_id`),
  ADD KEY `chitiet_hoadon_ibfk_2` (`san_pham_id`);

--
-- Chỉ mục cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `san_pham_id` (`san_pham_id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chatbot_messages`
--
ALTER TABLE `chatbot_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT cho bảng `chitiet_hoadon`
--
ALTER TABLE `chitiet_hoadon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiet_hoadon`
--
ALTER TABLE `chitiet_hoadon`
  ADD CONSTRAINT `chitiet_hoadon_ibfk_1` FOREIGN KEY (`hoa_don_id`) REFERENCES `thanhtoan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chitiet_hoadon_ibfk_2` FOREIGN KEY (`san_pham_id`) REFERENCES `sanpham` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD CONSTRAINT `gio_hang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gio_hang_ibfk_2` FOREIGN KEY (`san_pham_id`) REFERENCES `sanpham` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD CONSTRAINT `thanhtoan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
