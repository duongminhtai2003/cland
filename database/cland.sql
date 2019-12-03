-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 03, 2019 lúc 07:48 AM
-- Phiên bản máy phục vụ: 10.4.8-MariaDB
-- Phiên bản PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cland`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(27, 'Nhà đất bán'),
(28, 'Nhà đất cho thuê'),
(29, 'Dự án'),
(30, 'Cần thuê - Cần mua'),
(31, 'Tin tức'),
(32, 'Xây dựng - Kiến trúc'),
(33, 'Thời sự');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `fullname` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `lid` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `fullname`, `lid`, `content`, `date_create`) VALUES
(42, 'Duong Minh Tai', 7, 'adasd', '2019-10-21 16:06:59'),
(43, 'Duong Minh Tai', 7, 'adasd', '2019-10-21 16:06:59'),
(53, 'Duong Minh Tai', 11, 'ib\n', '2019-10-23 11:46:52'),
(54, 'Duong Minh Tai', 26, 'inbox', '2019-10-23 13:08:16'),
(55, 'Dương mInh Tài', 26, 'fkskdasjdlk', '2019-11-07 01:44:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `fullname`, `email`, `subject`, `content`) VALUES
(1, 'Nguyễn Thị Hạnh', 'hanh@gmail.com', 'Phòng A1', 'Để bảo vệ giàn khoan, Trung Quốc đã điều thêm 17 tàu các loại so với hôm trước,\n		        sẵn sàng đâm va vào tàu Việt Nam.'),
(2, 'Phan Quốc Bảo', 'quocbao@gmail.com', 'Phòng A2', 'World Cup 2014 chưa đi hết lượt đầu vòng bảng nhưng các trọng tài đẳng cấp FIFA đã có tới bốn trận bị chỉ trích dữ dội.'),
(10, 'Dương mInh Tài', 'thanh@gmail.com', 'TIn thức', 'ádlasnlkdas'),
(11, 'Nguyễn quốc thành', 'thanh@gmail.com', 'ko', 'asjdnajksdna'),
(12, 'Dương mInh Tài', 'thanh@gmail.com', 'asdas', 'asdas'),
(13, 'Dương mInh Tài', 'thanh@gmail.com', 'TIn thức', 'dasdas'),
(14, 'Dương mInh Tài', 'aadasd', 'asdas', 'asdsa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lands`
--

CREATE TABLE `lands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cid` int(10) UNSIGNED NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_views` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lands`
--

INSERT INTO `lands` (`id`, `name`, `description`, `date_create`, `cid`, `picture`, `area`, `address`, `count_views`) VALUES
(5, 'Bán đất xây dựng khách sạn đường Lâm Hoành 0918444053 ', 'Cần bán khu đất xây khách sạn tại đường Lâm Hoành, Quận Sơn Trà, TP Đà Nẵng.<br/>Diện tích: 695 m2.<br/>Vị trí nằm trong khu tập trung tổ hợp nhà hàng, khách sạn, dịch vụ du lịch tốt nhất của biển Đà Nẵng. <br/>Khu đất rộng, thích hợp xây khách sạn, vị trí đắc địa, tập trung nhiều khách sạn lớn.<br/>Giá bán: 75 triệu/m2.<br/>Giá bán chính chủ. Liên hệ: 0918444053.', '2019-10-12 08:11:59', 4, '323446-56086155616900.jpg', 456, 'Đường Lâm Hoành - Quận Sơn Trà - Đà Nẵng', 400),
(11, 'NHÀ PHỐ KINH DOANH 75M2 XÂY 5 TẦNG, 2 MẶT TIỀN ĐƯỜNG RỘNG 12M, GIÁ 15 TỈ, TRẢ SAU 3 NĂM, 0858418333', 'DỰ ÁN THE MANOR CENTRAL PARK\r\n\r\nLH xem nhà trực tiếp: 0858418333 - 0936075688\r\n\r\n1. Chính sách siêu ưu đãi tháng 10/2019.\r\n- Tặng 1 xe Mercedes GLC 200 2019 trị giá 1,6 tỉ cho 30 khách hàng đầu tiên.\r\n- Tặng 2 - 4 cây vàng 9999.\r\n- Hỗ trợ lãi suất 0% và ân hạn nợ gốc 36 tháng. Miễn phí trả nợ trước hạn.\r\n- Chiết khấu 12% giá trị căn hộ.\r\n- Tặng thẻ hội viên khách sạn 5 sao JW. Marriott.\r\n\r\nĐây là dự án có quy mô lớn nhất thủ đô Hà Nội - với quỹ đất 89.7 ha hiếm hoi còn lại trong nội đô, nằm cạnh lá phổi xanh 100ha - công viên Chu Văn An lớn nhất Hà Nội, nơi hội tụ đầy đủ các yếu tố tiềm năng tăng giá, khiến nhà đầu tư không thể bỏ qua:\r\n2. Tổng quan dự án\r\n2.1. Vị trí\r\nDự án nằm tiếp giáp với 3 tuyến đường huyết mạch của Thành phố.\r\n- Đường Nguyễn Xiển (Vành Đai 3).\r\n- Đường BT Chu Văn An (Nguyễn Xiển - Xa La) rộng 53m đã xong, Theo Quy hoạch đây sẽ là đường hướng tâm nối lên Tôn Thất Tùng.\r\n- Đại Lộ Hoàng Mai - Tuyến đường nối từ Nguyễn Trãi, đi qua khu đô thị Tây Nam Kim Giang, The Manor Central Park nối tới Linh Đàm song song với Nguyễn Xiển. Đây sẽ là tuyến đường giảm tải cho đường vÀnh Đai 3 hiện tại.\r\n\r\n2.2. Phiên bản nâng cấp của 36 phố phường.\r\n- \"Trái tim\" của dự án - công viên trung tâm rộng 6.6ha bao gồm khu vườn hoa, đường dạo bộ, quảng trường countdown, khu thể thao phức hợp.\r\n- \"Linh hồn\" của dự án - phố đi bộ dài 800m , rộng 19m: Là nơi sẽ diễn ra các hoạt động, lễ hội theo chủ đề hàng tuần.\r\n- Điểm bắn pháo hoa vào mỗi dịp lễ lớn của đất nước.\r\nNơi đây hứa hẹn sẽ là biểu tượng mới của Thủ Đô mà bất cứ ai cũng muốn một lần ghé thăm. Trở thành mảnh đất màu mỡ cho các nhà đầu tư.\r\n\r\nThông tin chi tiết, hẹn lịch xem nhà anh chị vui lòng liên hệ: 0858418333 - 0936075688', '2019-10-23 11:28:51', 27, '20191023180421-8afd_wm-938056658790100.jpg', 75, 'Bán nhà mặt phố tại The Manor Central Park - Quận Hoàng Mai - Hà Nội', 0),
(12, 'CHUYÊN CĂN HỘ MASTERI THẢO ĐIỀN GIÁ RẺ NHẤT THỊ TRƯỜNG, HỖ TRỢ VAY 80%. LH 0936 721 723 MR. HOÀI', 'Thông tin mô tả\r\nHỗ trợ xem nhà miễn phí 24/7!\r\nLiên hệ ngay để được hướng dẫn chọn căn nhà vừa ý nhất: 0936.721.723 Mr. Hoài (24/7).\r\nỞ đâu giá rẻ, Mr Hoài có giá rẻ hơn.\r\nTôi cam kết: Giá rẻ hơn thị trường, trả sát giá chủ nhà. Miễn sao khách hàng ưng ý, tôi sẽ đưa mức giá thấp nhất.\r\nHỗ trợ vay ngân hàng lên đến 80% giá trị căn hộ.\r\nVị trí nhà nào Mr. Hoài cũng có, đảm bảo giá thấp nhất thị trường.\r\nChìa khóa có sẵn do khách gửi, hỗ trợ xem nhà 24/7 miễn phí.\r\nĐặc biệt: Hỗ trợ hồ sơ trọn gói.\r\nLưu ý: Giá dưới đây là giá 100% căn hộ, đã bao gồm tất cả các loại thuế, phí. Khách mua sẽ không trả bất kỳ chi phí nào thêm.\r\nDưới đây là một số căn cơ bản, còn rất nhiều căn chưa viết hết.\r\nNhiều penthouse giá 13 tỷ.\r\nNhiều duplex giá 8 tỷ.\r\nCác căn hộ tại chung cư Masteri Thảo Điền.\r\nĐây là vài thông tin cơ bản.\r\nChi tiết căn hộ liên hệ: 0936.721.723 Mr. Hoài (24/7).\r\n\r\nHiện tại đang bán các căn hộ từ tầng 5 tới tầng 40.\r\n* Loại 1 phòng ngủ:\r\nVị trí: Tòa T1, T2, T3, T4, t5 giá 3 tỷ full nội thất, đang có hợp đồng thuê.\r\nTầm nhìn: View hồ bơi, sân vườn nội bộ (rất đẹp), công viên, sông Sài Gòn.\r\n\r\n* Loại 2 phòng ngủ:\r\nCác căn điển hình, đang giữ chìa khóa.\r\nT1: Căn 07, 08 view TP, căn 04, 05 giá 3.2 tỷ.\r\nT2: Căn 03, 04 view sông. Căn góc 07 và 08 giá 3.7 - 4 tỷ full nội thất.\r\nT3: Căn 03, 04 view sông. Căn góc 08 và 09 giá 3.7 - 4 tỷ.\r\nT4: Căn góc 06, 08. Căn 04 view sông giá 3.6 - 4 tỷ, căn 07, 10 view hồ bơi giá 3.4 - 3.6 tỷ.\r\nT5: Căn 04 và 05 tầng trung view sông giá từ 4 tỷ, căn 11, 12 view hồ bơi City, căn 07,08 tầng cao view City đẹp, căn 02 view City, sông đẹp.\r\nNgoài ra còn có các vị trí: Block A, B, tòa T1, T2, T3, T4, T5, căn 2, 4, 8, 10, 11, 12. Giá từ 3.4 tỷ.\r\nTầm nhìn: View sông Sài Gòn, Thảo Điền, sân vườn nội bộ, hồ bơi, trung tâm thương mại, Bitexco.\r\n\r\n* Loại 3 phòng ngủ:\r\nT1: Căn 03 và 06 giá từ 4.5 tỷ.\r\nT2: Căn 05 view sông giá từ 5 tỷ.\r\nT3: Căn 05 view sông trực diện, ban công rộng rất đẹp giá từ 5 tỷ.\r\nT4: Căn 03 và 05 view sông trực diện rất đẹp giá từ 5.2 tỷ.\r\nT5: Căn 03, 05, 09,10 view sông, City rất đẹp giá từ 5.3 tỷ.\r\nTầm nhìn: View sông Sài Gòn, Thảo Điền, sân vườn nội bộ, hồ bơi, trung tâm thương mại, Bitexco.\r\n\r\n* Lựa chọn Masteri Thảo Điền và lựa chọn dịch vụ tư vấn của Mr Hoài, quý anh chị sẽ được hưởng các ưu đãi đặc biệt:\r\n- Giá còn thương lượng.\r\n- Đảm bảo thủ tục nhanh chóng, dễ dàng, hỗ trợ thủ tục cho khách hàng suốt đời.\r\n- Còn nhiều căn giá tốt các tòa T1, T2, T3, T4, T5 đa dạng cho khách hàng quan tâm.\r\n- Hỗ trợ xem nhà 24/7.\r\n\r\n* Lý do quý khách nên chọn Masteri Thảo Điền là nơi ở và đầu tư sinh lợi:\r\n- Vị trí đẹp, thuận lợi giao thông.\r\n- Khu dân cư văn minh, cao cấp, an ninh 24/7.\r\n- Các tiện ích đầy đủ: Khu vui chơi, hồ bơi, BBQ ngoài trời, mua sắm, ăn uống.\r\n- Dễ dàng sinh lời, tuyến Metro Bến Thành Suối Tiên đang xây dựng.\r\n\r\nLiên hệ ngay để được hướng dẫn chọn căn nhà vừa ý nhất: 0936.721.723 Mr. Hoài (24/7).\r\nĐặc biệt: Nhận ký gửi căn hộ cho thuê, chuyển nhượng với mức phí ưu đãi.', '2019-10-23 11:29:56', 27, '20190928092114-3579-938121466673200.jpg', 70, 'Khu vực: Bán căn hộ chung cư tại Masteri Thảo Điền - Quận 2 - Hồ Chí Minh', 0),
(13, 'KHU VILLA DÀNH CHO GIỚI SIÊU GIÀU NGAY LÒNG HỒ CHÍ MINH, CHỈ TỪ 3 TỶ, SỞ HỮU 1000M2, LH: 0777896778', 'Thông tin mô tả\r\nKhu vực: Bán đất nền dự án tại Saigon Garden Riverside Village - Quận 9 - Hồ Chí Minh\r\nGiá: 22 tỷ Diện tích: 1000m\r\nThông tin mô tả\r\nSaigon Garden Lần đầu tiên xuất hiện tại Việt Nam.\r\nChủ đầu tư: Khai Huy Quan (Công Ty Thành Viên Của Tập Đoàn Hưng Thịnh).\r\nĐơn vị phân phối độc quyền: Property X (Công ty thành viên của Tập đoàn Hưng Thịnh) Bất Động Sản cho mọi nhà đã từng đảm nhận nhiều dự án đất nền biệt thự như: Sentosa Villas, Saigon Mystery Villas, Bien Hoa New City.\r\nTổng thầu xây dựng: Hung Thinh Incons đã thực hiện nhiều công trình như Quy Nhơn Melody, Saigon Mystery Villas, Cam Ranh Mystery Villas,..\r\nVị trí: Phường Long Phước, Quận 9.\r\nQuy mô: 30 ha.\r\nLoại hình: 168 lô biệt thự vườn diện tích từ 1.000 m2/ lô.\r\nPháp lý: Sổ hồng sở hữu lâu dài.\r\nThời gian bàn giao (dự kiến): 2023.\r\nQuy hoạch hạ tầng hiện hữu, cây xanh, đường nhựa. Đặc biệt, 2 mặt giáp sông Đồng Nai.\r\nTiện ích nội khu cao cấp: Khu Compound khép kín, kênh cảnh quan, sân Tennis và sân chơi trẻ em, bến du thuyền, clubhouse & hồ bơi tràn bờ, công viên cây xanh,.\r\nSaigon Garden Riverside nơi an cư và đầu tư lí tưởng.\r\nPKD: 0777896778', '2019-10-23 11:30:41', 27, '20191023173934-b94e_wm-938167101432500.jpg', 1000, 'Khu vực: Bán đất nền dự án tại Saigon Garden Riverside Village - Quận 9 - Hồ Chí Minh', 0),
(14, 'CHỦ NHÀ SIÊU DỄ THƯƠNG CẦN CHO THUÊ 5 CĂN HỘ VINHOMES 1PN, 2PN, 3PN, 4PN (GIÁ TỐT NHẤT)', 'Thông tin mô tả\r\nChủ nhà siêu dễ thương cần cho thuê 5 căn hộ Vinhomes - 1PN, 2PN, 3PN, 4PN (giá tốt nhất).\r\n\r\nLH: 0938.533.299 (Zalo Viber).\r\n\r\n* 1 phòng ngủ: Diện tích 36m2, 48m2, 53m2, 56m2.\r\n\r\nGiá: 13 triệu/tháng - 18 triệu/tháng.\r\n\r\n* 2 phòng ngủ: Diện tích 70m2, 76m2 - 80m2, 90m2.\r\n\r\nGiá: 15 triệu/tháng - 26 triệu/tháng.\r\n\r\n* 3 phòng ngủ: Diện tích 114m2, 120m2, 135m2.\r\n\r\nGiá: 17tr/th - 29 triệu/tháng.\r\n\r\n* 4 phòng ngủ: 140m2 - 187m2.\r\n\r\nGiá: 28 triệu/tháng - 38 triệu/tháng.\r\n\r\nLH: 0938.533.299.\r\n\r\n\r\n- Văn phòng ngay trong dự án.\r\n- Chúng tôi hỗ trợ đưa đón bạn xem nhà và dọn nhà mới.\r\n- Chúng tôi cam kết hỗ trợ tận tâm để bạn tìm được một ngôi nhà như ý, giải đáp mọi thủ tục, thắc mắc liên quan đến hợp đồng thuê nhà.\r\nCảm ơn anh/chị đã xem tin!', '2019-10-23 11:31:34', 28, '20191023153607-a268_wm-938219849157900.jpg', 79, 'Khu vực: Cho thuê căn hộ chung cư tại Vinhomes Central Park - Quận Bình Thạnh - Hồ Chí Minh', 0),
(15, 'CHO THUÊ SUN AVENUE CĂN 1PN DT 51M2 GIÁ 10TR; CĂN 2PN NHỎ GIÁ 12TR; CĂN 3PN GIÁ 14TR. LH 0972443344', 'Thông tin mô tả\r\nChuyên cho thuê căn hộ cao cấp Novaland.\r\n\r\nCăn hộ The Sun Avenue 28 Mai Chí Thọ quận 2. Cách hầm Thủ Thiêm Q1 chỉ 5 phút đi xe.\r\n\r\n* Đặc biệt có căn 1PN full nội thất giá 10tr/tháng.\r\n\r\nCăn 2PN giá 12tr/tháng.\r\n\r\n* Bảng giá thuê tháng 10/2019 căn hộ The Sun Avenue.\r\n\r\nCăn hộ cho thuê:\r\n+ Căn hộ 1 + 1PN - 1WC: Diện tích 56m2. Nội thất cơ bản 10tr/tháng. Full nội thất 13tr/tháng.\r\n\r\n+ Căn hộ 2PN - 2WC. Diện tích 75m2 nội thất cơ bản 13tr/tháng. Full nội thất 14tr/tháng.\r\n+ Căn hộ 3PN - 2WC. Diện tích 90m2 nội thất cơ bản 13 tr/tháng. Full nội thất 17tr/tháng.\r\n\r\nOfficetel cho thuê:\r\n+ Lô officetel 32m2 giá cho thuê 7tr/tháng bao phí quản lý. Hoàn thiện cơ bản có gắn máy lạnh và rèm.\r\n+ Lô officetel 38m2 giá cho thuê 8tr/tháng bao phí quản lý. Hoàn thiện cơ bản có gắn máy lạnh và rèm.\r\n+ Lô officetel 44m2 giá cho thuê 10tr/tháng bao phí quản lý. Hoàn thiện cơ bản có gắn máy lạnh và rèm.\r\n+ Lô officetel 51m2 giá cho thuê 10tr/tháng bao phí quản lý. Hoàn thiện cơ bản có gắn máy lạnh và rèm.\r\n\r\nShophouse:\r\n+ Diện tích 35m2 - 40m2 giá 20 triệu/tháng.\r\n+ Diện tích 50m2 - 60m2 - giá 25 triệu/tháng.\r\n+ Diện tích 70m2 - 80m2 - giá 30 triệu tháng.\r\n* Đặc biệt có căn diện tích 60m2 giá chỉ 20tr/tháng.\r\nChúng tôi cung cấp những dịch vụ miễn phí sau để phục vụ khách hàng một cách tốt nhất:\r\n- Miễn phí dịch vụ lau dọn nhà.\r\n- Miễn phí dịch vụ đăng ký tạm trú, tạm vắng.\r\n- Hỗ trợ vận chuyển nhà.\r\n- Hỗ trợ dịch vụ lắp đặt cáp quang, Internet và các dịch vụ thiết yếu khác (nếu khách hàng có nhu cầu).\r\n- Hỗ trợ dịch vụ tư vấn thiết kế.\r\n- Hỗ trợ tư vấn và xem nhà miễn phí.\r\n\r\n* Một số thông tin bạn cần biết trước khi thuê Căn hộ The Sun Avenue:\r\n- Phí gửi xe máy: 60,000 vnđ/tháng (chưa VAT).\r\n- Phí gửi xe hơi: 1.200,000 vnđ/tháng (chưa VAT).\r\n- Điện, nước (tính theo giá nhà nước).\r\n- Thẻ từ (sử dụng cho từng tầng và tầng tiện ích).\r\n- Dịch vụ: Hồ bơi tràn, gym (đang miễn phí).\r\n\r\nLiên hệ ngay Ms. Loan: 0972443344 để xem nhà.\r\n\r\nXem chi tiết thông tin The Sun Avenue tại:\r\nhttps://thongtincanhotphcm.com/cap-nhat-gio-hang-the-sun-avenue-quy-iii/\r\n\r\nManagement almost apartment in District 2 - The Sun Avenue.\r\nWe are committed to bringing rental and selling services to the best prices in the market.\r\nPlease contact: 0972 44 33 44 (Ms. Loan) or add zalo/viber by this phone number to take a real photo and detail information.\r\n\r\n* Studio: 35 - 50m2.\r\n- Rent from: 10 - 12 million/month (Blank apartment: Have air - condition, curtain).\r\n- Rent from: 12 - 14 million/month (Full Furniture).\r\n\r\n* 1 bedroom: Area: 50 - 56m2.\r\n- Rent from 13 - 15 million/month.\r\n\r\n* 2 bedrooms: Area 73m2 - 76m2.\r\n- Rental price: 15 - 17 million/month.\r\n\r\n* 3 bedrooms: Area 90m2 - 109m2. Corner apartment, nice view.\r\n- Rent from: 17 - 22 million/month.\r\n\r\nFacilities:\r\n- Swimming pool 5th floor.\r\n- Gym room, spa, kindergarten, community living room.\r\n- Playground, Shophouse.\r\n- High speed.', '2019-10-23 11:32:23', 28, '20190920113323-40dc_wm-938268801928900.jpg', 51, 'Khu vực: Cho thuê căn hộ chung cư tại The Sun Avenue - Quận 2 - Hồ Chí Minh', 0),
(16, '23/10/2019, VĂN PHÒNG CHO THUÊ Q.1, 20M2 - 2000M2, 250 NGHÌN/M2/THÁNG, 18009279, 0902738229 (ZALO)', 'Thông tin mô tả\r\nCập nhật ngày 23 - 10 - 2019 với danh sách 300 cao ốc văn phòng cho thuê Quận 1.\r\n\r\n- Hotline: 0902738229.\r\n\r\nĐường: Nguyễn Huệ, Lê Duẩn, Tôn Đức Thắng, Hàm Nghi, Nam Kỳ Khởi Nghĩa, Hai Bà Trưng...\r\n\r\nDiện tích: 20m2 - 30m2 - 50m2 - 70m2 - 100m2 - 150m2 - 200m2 - 300m2 - 500m2 - 700m2 - 1.000m2 - 3.000m2.\r\n\r\nGiá thuê: 250 nghìn/m2/tháng - 800 nghìn/m2/tháng, tùy vị trí.\r\n\r\nDịch vụ và tiện ích.\r\n- Máy lạnh.\r\n- Thang máy.\r\n- Quản lý và vận hành tòa nhà.\r\n- Bảo vệ 24/24.\r\n- Vệ sinh.\r\n- Máy phát điện.\r\n- Hầm giữ xe.\r\n- Sảnh lễ tân.\r\n- Hệ thống mạng điện thoại và internet.\r\n- Gần ngân hàng, khu văn phòng công ty.\r\n- Cơm trưa, cafe văn phòng 20m.\r\n- Đầy đủ các dịch vụ của 1 cao ốc văn phòng.\r\n\r\nTất cả dịch vụ hoàn toàn miễn phí.\r\nHotline: 18009279 - Miễn cước gọi.\r\nMr. Thành - 0902.738.229 - Zalo, Viber.\r\nSố 1, Nguyễn Huệ, Quận 1, TP. HCM.', '2019-10-23 11:33:04', 28, '20160127171948-08a5-938309879204800.jpg', 50, 'Khu vực: Cho thuê văn phòng tại Đường Nguyễn Huệ - Quận 1 - Hồ Chí Minh', 0),
(17, 'Lộc Phát Residence', 'Thông tin tổng quan dự án Lộc Phát Residence\r\nLộc Phát Residence là dự án đất nền có quy mô 5ha nằm trên địa bàn phường Thuận Giao, thị xã Thuận An, tỉnh Bình Dương. Dự án nằm tại vị trí đắt giá, ngay mặt tiền trục đường lớn, gần nhiều khu công nghiệp nên được thừa hưởng chuỗi tiện ích hạ tầng giao thông, hạ tầng xã hội.\r\n\r\nMật độ xanh tại dự án khá lớn và được phân bổ hợp lý. Chủ đầu tư cũng chú trọng phát triển hạ tầng nội khu với đường nhựa lộ giới rộng, hệ thống thoát nước, vỉa hè cây xanh bóng mát, điện chiếu sáng...\r\n\r\nLộc Phát Residence gồm các sản phẩm đất nền có diện tích đa dạng, từ 60-150m2, đáp ứng mọi nhu cầu của khách hàng và cả các nhà đầu tư.\r\n\r\n- Tên dự án: Lộc Phát Residence\r\n- Chủ đầu tư: Công ty TNHH Bất động sản Phú Hồng Thịnh\r\n- Đơn vị phát triển dự án: Công ty CP Đầu Tư và Dịch Vụ Đất Xanh Miền Nam\r\n- Vị trí: Mặt tiền đường 22/12, phường Thuận Giao, thị xã Thuận An, tỉnh Bình Dương\r\n- Quy mô: 5ha\r\n+ Đất ở: 24.682,54m2\r\n+ Diện tích khu phức hợp: 3.500,23m2\r\n+ Đất cây xanh: 2.567,15m2\r\n+ Đất giáo dục: 912,63m2\r\n+ Đất giao thông: 23.832,28m2\r\n- Số lượng: 478 nền\r\n- Diện tích nền: 60-150m2\r\n- Pháp lý: Sổ hồng riêng từng lô, thổ cư 100%\r\n\r\nSản phẩm đất nền phân lô:\r\n\r\n- Số lượng: 454 nền\r\n- Diện tích: 61,3m2 - 108m2\r\n- Lộ giới: 12m - 14m - 15m\r\n- Diện tích được рhân bổ hợp lý, xen kẽ là các сụm công viên\r\n- Đường nội khu trải nhựa rộng rãi\r\n- Hệ thống điện, cáp viễn thông ngầm\r\n \r\nShophouse thương mại:\r\n\r\n- Số lượng: 24 căn\r\n- Diện tích: 120-240m2\r\n- Lộ giới: 32m', '2019-10-23 11:34:00', 29, '20190211093732-1d0b-938366215706500.jpg', 50000, 'Đường 22/12, Phường Thuận Giao, Thuận An, Bình Dương', 0),
(18, 'Khu dân cư Khanh Cát', 'Thông tin tổng quan dự án Khu dân cư Khanh Cát\r\nKhu dân cư Khanh Cát do Doanh nghiệp tư nhân Khanh Cát làm chủ đầu tư với quy mô 18 ngôi biệt thự được thiết kế theo phong cách kiến trúc Pháp cổ điển, sang trọng. Dự án tọa lạc trên khu đất quy hoạch có diện tích 11,599.3m2 nằm đối diện với đồi thông và những khu du lịch cảnh quan thiên nhiên nổi tiếng của Đà Lạt như Vườn Dâu Hiệp Lực, Thung Lũng tình yêu.\r\n\r\nĐược biết, quỹ đất xây dựng nhà ở của dự án chỉ chiếm 40% diện tích toàn khu, phần còn lại chủ đầu tư sẽ dành cho khuôn viên cây canh, tiểu cảnh, sân bãi cùng hệ thống tiện ích phục vụ cho cư dân. Với vị trí hoàn hảo, tiện lợi về giao thông cùng việc sở hữu một cảnh quanh sống yên bình nhưng không kém phần đẳng cấp, KDC Khanh Cát thực sự là một chốn an cư - đầu tư tuyệt vời tại TP. Đà Lạt thơ mộng.\r\n\r\n- Tên dự án: Khu dân cư Khanh Cát\r\n- Chủ đầu tư và phân phối: DNTN Khanh Cát\r\n- Địa chỉ: Đường Vòng Lâm Viên Đà Lạt, phường 8, TP. Đà Lạt, tỉnh Lâm Đồng\r\n- Quy mô: 18 đất nền biệt thự, biệt thự\r\n- Tổng diện tích: 11,599.3m2\r\n- Diện tích xây dựng: 4,614.4m2\r\n- Tỷ lệ xây dựng: 40%\r\n- Các loại diện tích: 250-260m2/nền\r\n- Thời gian khởi công: 2017\r\n- Dự kiến hoàn thành:\r\n+ 2019 (Giai Đoạn 1)\r\n+ 2020 (Giai Đoạn 2)\r\n- Pháp Lý: Sổ hồng riêng từng nền (Đã có sẵn và giao ngay khi hoàn thành hợp đồng)', '2019-10-23 11:34:49', 29, '20181219165534-b6d4-938414916787100.jpg', 4641, 'Phường 8, Đà Lạt, Lâm Đồng', 0),
(19, 'Khu đô thị Hoàng Cát Center', 'Thông tin tổng quan dự án Khu đô thị Hoàng Cát Center\r\nKhu đô thị Hoàng Cát Center được đầu tư bởi Công ty TNHH xây dựng & phát triển địa ốc Hoàng Cát Bình Dương theo mô hình khu dân cư kiểu mẫu tại huyện Chơn Thành, tỉnh Bình Phước. Dự án nằm trong quần thể du lịch sinh thái Phước Hòa và khu phức hợp Becamex có quy mô lên đến 3.200ha. Với pháp lý minh bạch, sổ hồng riêng từng nền cùng diện tích đa dạng, giá bán hợp lý, KĐT Hoàng Cát Center sẽ là lựa chọn an cư hấp dẫn cho cư dân địa phương.\r\n\r\n- Tên dự án: Khu đô thị Hoàng Cát Center\r\n- Chủ đầu tư: Công ty TNHH xây dựng & phát triển địa ốc Hoàng Cát Bình Dương\r\n- Đơn vị phân phối: Địa Ốc Hoàng Cát\r\n- Vị trí: xã Minh Thành, huyện Chơn Thành, tỉnh Bình Phước\r\n- Tổng diện tích khu đất: 24ha\r\n- Mật độ xây dựng: 60%\r\n- Hạ tầng (công viên, cây xanh, cảnh quan, công trình tiện ích): 40%\r\n- Các loại diện tích: 5x40m, 7x40m, 10x40m, 20x25m', '2019-10-23 11:35:28', 29, '20181219154753-df72-938453871500300.jpg', 240000, 'Đường Quốc Lộ 13, Xã Minh Thành, Chơn Thành, Bình Phước', 0),
(20, 'Cần thuê gấp căn hộ Vinhomes Nguyễn Chí Thanh hoặc Platinum Residences Nguyễn Công Hoan', 'Thông tin mô tả\r\nCần thuê gấp căn hộ Vinhomes Nguyễn Chí Thanh hoặc Platinum Residences Nguyễn Công Hoan.\r\n\r\nTôi cần thuê gấp căn hộ 2PN tại Vinhomes Nguyễn Chí Thanh hoặc Platinum Residences Nguyễn Công Hoan.\r\nLiên hệ: Chị Hà, mobile 0969066626.', '2019-10-23 11:36:57', 30, '20191023173934-b94e_wm-938542989364900.jpg', 5031, 'Khu vực: Cần thuê căn hộ chung cư tại Quận Ba Đình, Quận Đống Đa - Hà Nội', 0),
(21, 'Cần mua đất Mỹ Phước 3 Bến Cát, BD - tất cả các lô L, J, K, G, H, I, F giá cao nhất, 0938.057.118', 'Thông tin mô tả\r\nCần mua đất Mỹ Phước 3 Bến Cát, BD - tất cả các lô L, J, K, G, H, I, F giá cao nhất. LH 0938.057.118\r\n\r\nGọi ngay: 0938.057.118.\r\n\r\nDiện tích cần mua từ 100m2 đến 900m2.\r\n\r\nDo nhu cầu gấp nên tôi quyết định nhanh, đặc biệt từ chính chủ bán.\r\n\r\nCần mua đất Mỹ Phước 3 Bình Dương, các lô L, J, K, H, I, F, G.\r\n\r\nƯu tiên mua gấp đất mặt tiền đường lớn như DL12, DL14, DJ5, DK5A, NE2, DE1, NE4, NE3, và các đường lớn nhỏ khác.\r\n\r\nCần mua đất Mỹ Phước 3, Mua gấp các Lô I3, lô I7, lô I28, lô I65, lô I67, lô I51, lô I29, ô I43, lô I17, lô I21, Lô I30, lô I42, lô I18, lô I19, lô I20, lô I69.\r\n\r\nMua cả cả đất còn hợp đồng với chủ đầu tư Becamex.\r\n\r\nVà mua nhanh các lô L55, lô L57, lô L45, lô L16, lô L17, lô L18, lô L30, lô L32 lô L20, lô L22, lô L23, lô L24, lô L36 và tất cả các lô L khác.\r\n\r\nYêu cầu chính chủ bán, pháp lý rõ ràng.\r\n\r\nChúng tôi chuyên mua đất Mỹ Phước 3, không hạn chế số lượng. Mua tất cả các vị trí.\r\n\r\nCam kết mua giá cao nhất thị trường, thanh toán tiền trong ngày.\r\n\r\nHỗ trợ toàn bộ chi phí sang tên, kể cả thuế thu nhập cá nhân.\r\n\r\nQuý khách có nhu cầu bán vui lòng liên hệ:\r\n\r\nĐiện thoại: 0938.057.118 MS Hảo (24/7).', '2019-10-23 11:37:34', 30, '20191018145953-d52a_wm-938579998604500.jpg', 900, 'Khu vực: Mua đất nền dự án tại Khu đô thị Mỹ Phước 3 - Thị xã Bến Cát - Bình Dương', 0),
(22, 'Chủ tịch Hoàng Long VUS cùng các tập đoàn cổ đông ngân hàng cần thuê nhà nguyên căn, tòa nhà TPHCM', 'Thông tin mô tả\r\nMr. Quân chủ tịch Hoàng Long Vus (người đứng ra thuê trực tiếp đặt bút kí hợp đồng thuê nhà) cùng các cổ đông các Ngân hàng vừa họp gấp về tiêu chí phát triển mạng lưới ngân hàng và chuỗi 72 thương hiệu lớn trên TP. HCM bao gồm VietinBank, Techcombank, Agribank, Sacombank vv và chuỗi thương hiệu con nhiều ngành như nhà thuốc, ngân hàng, Hight Land CF, ViVa, văn phòng bảo hiểm, trung tâm Anh ngữ, Trường Học, thực phẩm chức năng, Bách Hóa Xanh, Điện Máy Xanh, siêu thị Chợ Lớn, spa, Cháo Ếch, siêu thị mini...\r\nTập đoàn Hoàng Long VUS chúng tôi cần thuê nhà khoảng 400 điểm cho năm 2019 - 2020 làm phòng giao dịch và chi nhánh cho 7 ngân hàng. 300 điểm giao dịch cho 72 thương hiệu phía trên ở tất cả các quận TP. HCM (Quận 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, Phú Nhuận, Thủ Đức, Bình Thạnh, Tân Bình, Tân Phú... Toàn đất nước Việt Nam).\r\nƯu đãi cực lớn cho chủ nhà BDS có nhà thuê.\r\nChủ nhà BDS có cho công ty chúng tôi thuê sẽ hỗ trợ chủ nhà thêm 50% số tiền thuê nhà cộng thêm. Nếu đã làm việc với tập đoàn Hoàng Long Vus thì chủ nhà hoàn toàn tin tưởng và chúng tôi mong muốn chủ nhà không nên ký gửi nhiều đối tác khác vì công ty chúng tôi là công ty mẹ toàn quyền quyết định không thông qua nhiều giai đoạn.\r\nTôi là người quyết định trực tiếp chính chủ thuê nhà, đặt bút kí hợp đồng. Ông Quân chủ tịch quyết định điều hành Hoàng Long VUS xét duyệt nhanh chóng.\r\nĐặc biệt những mặt bằng của các thương hiệu con và các ngân hàng chuẩn bị hết hợp đồng từ 2 - 3 tháng chúng tôi rất quan tâm và sẵn sàng cọc giữ chỗ trước.\r\n\r\nDiện tích cần thuê tiêu chuẩn của tập đoàn Hoàng Long Vus (Viết tắt từ Hoàng Long Việt Mỹ) cùng các ngân hàng.\r\n- Bề ngang tối thiểu là 4m (phù hợp nhất là 6m - 12m).\r\n- Chiều dài tối thiểu là 12m (phù hợp nhất là trên 15m).\r\nVị trí yêu cầu:\r\nNhà cho thuê nằm ngay các trục đường chính, khu đông dân cư, đông người qua lại, kinh doanh sầm uất, ưu tiên các vị trí gần chợ, gần trung tâm thương mại, khu phố tây, trục đường du lịch, khu vực văn phòng, có nhiều ngân hàng khác ưu tiên nhà góc 2 mặt tiền các trục đường chính, hẻm xe hơi hoặc đường nội bộ đều được.\r\n\r\nGiá thuê các mặt bằng mở chuỗi của các thương hiệu.\r\n- Áp dụng với diện tích nhỏ giá dưới: 200 triệu/tháng.\r\n- Áp dụng với diện tích lớn giá dưới: 800 triệu/tháng.\r\n* Đối với các vị trí căn góc 2, 3 mặt tiền, gần vòng xoay chúng tôi có thể thuê với giá trên 400 triệu hoặc 800 triệu.\r\nChủ nhà bất động sản có nhà cho thuê vui lòng liên hệ ngay với tôi qua:\r\nHotline: Ông Quân 090.267.9991 Chủ tịch Hoàng Long VUS (zalo 24/7. Viber 24/7).\r\n- Hoàng Long Vus thương hiệu lớn nhất bậc nhất đứng đầu quản lý chuỗi 72 thương hiệu lớn nhất và 7 ngân hàng TP Hồ Chí Minh.\r\nChủ nhà bất động sản.\r\nGửi hình ảnh và địa chỉ trực tiếp qua zalo / viber để xét duyệt nhanh hơn (công ty hoạt động 24/7).\r\nTầng 26 tòa tháp Lotter Tower Hai Bà Trưng, P Tân Định, Quận 1, Hồ Chí Minh.', '2019-10-23 11:38:19', 30, '20191006183434-c8f6_wm-938624921387400.jpg', 900, 'Khu vực: Cần thuê nhà mặt phố tại Quận 1, Quận 10, Quận 11, Quận 3, Quận 5 - Hồ Chí Minh', 0),
(23, 'Dự án \"đất vàng\" khu tứ giác Bến Thành đổi chủ', 'Chủ tịch UBND TP.HCM vừa có kết luận liên quan đến dự án Khu tứ giác Bến Thành, phường Nguyễn Thái Bình, quận 1.\r\nVăn phòng UBND TP.HCM vừa có thông báo kết luận của Chủ tịch UBND TP.HCM Nguyễn Thành Phong về tiến độ thực hiện một số dự án đầu tư trên địa bàn TP.\r\n\r\nTheo đó, liên quan đến dự án Khu tứ giác Bến Thành, phường Nguyễn Thái Bình, quận 1, Chủ tịch UBND TP.HCM Nguyễn Thành Phong chấp thuận điều chỉnh thời gian, tiến độ thực hiện dự án từ năm 2019 thành năm 2024.\r\n\r\nChủ tịch UBND TP.HCM giao Sở Xây dựng hướng dẫn Công ty TNHH Tập đoàn Bitexco các thủ tục chuyển nhượng dự án cho Công ty TNHH Saigon Glory (Công ty con của Công ty TNHH Tập đoàn Bitexco); tham mưu, đề xuất ủy UBND TP.HCM theo đúng quy định hiện hành.\r\n\r\nGiao Sở Quy hoạch - Kiến trúc rà soát chỉ tiêu quy hoạch kiến trúc, chức năng dự án; tham mưu, đề xuất UBND TP.HCM về điều chỉnh chức năng officetel của dự án (theo đề nghị của nhà đầu tư) theo đúng quy định hiện hành.', '2019-10-23 11:39:07', 31, '20191023164640-7a07-938672417621000.jpg', 1561564, 'Khu tứ giác Bến Thành, phường Nguyễn Thái Bình, quận 1.', 0),
(24, 'Golden Future City tạo “sóng” trên thị trường Bình Dương', 'Với quy mô hơn 8 ha, dự án khu đô thị Golden Future City đang tạo “sóng” trên thị trường bất động sản Bình Dương bởi vị trí chiến lược và khả năng gia tăng giá trị trong tương lai.\r\nTâm điểm đầu tư\r\n\r\nKhu đô thị Golden Future City tọa lạc ngay cửa ngõ vào khu công nghiệp đô thị Bàu Bàng, liền kề quốc lộ 13, trung tâm thị trấn Lai Uyên. Đây là tâm điểm kết nối kinh tế hoàn hảo ở cửa ngõ phía Bắc tỉnh Bình Dương với TP.HCM, Đồng Nai, Bình Phước và các tỉnh Tây Nguyên.\r\n\r\nỞ vị trí này, Golden Future City không chỉ đơn thuần là chốn an cư lý tưởng mà còn giàu tiềm năng khai thác thương mại. Bởi xung quanh dự án đã hình thành tương đối đầy đủ các tiện ích như trung tâm hành chính huyện Bàu Bàng, chợ Bàu Bàng, phòng khám đa khoa, ngân hàng, trung tâm thể dục thể thao và khu công nghiệp đô thị Bàu Bàng rộng 3.200 ha. Do đó, cư dân Golden Future City có thể phát triển nhiều ngành nghề kinh doanh ngay tại nhà như nhà hàng, khách sạn, quán cà phê, cửa hàng thời trang,… để tối đa hóa lợi nhuận.\r\n\r\nĐặc biệt, những nhà đầu tư nhạy bén còn cho rằng Golden Future City rất giàu tiềm năng tăng giá do Bàu Bàng đang có sự chuyển mình mạnh mẽ, hạ tầng giao thông cũng được đầu tư đồng bộ, nhằm tạo sự liên kết giữa Bình Dương với các trung tâm kinh tế của vùng kinh tế trọng điểm phía Nam. Có thể kể đến như đường Mỹ Phước – Bàu Bàng, đường tạo lực Bắc Tân Uyên – Phú Giáo – Bàu Bàng, cao tốc TP.HCM – Thành phố Thủ Dầu Một – Chơn Thành, cao tốc TP.HCM – Lộc Ninh,… Khi tất cả các công trình này đưa vào hoạt động sẽ tạo động lực rất lớn giúp cho kinh tế - xã hội và nhất là bất động sản Bàu Bàng bùng nổ.', '2019-10-23 11:40:18', 31, '20191022103506-5f3e-938731584444800.jpg', 3000, 'khu công nghiệp đô thị Bàu Bàng, liền kề quốc lộ 13, trung tâm thị trấn Lai Uyên.', 0),
(25, 'Một công ty của Samsung được tăng hạn ngạch miễn thuế tôn màu', 'Cụ thể, ngày 31/5, Bộ Công thương ban hành quyết định cho phép Công ty TNHH Điện tử Samsung HCMC CE Complex được bổ sung lượng miễn trừ áp dụng biện pháp tự vệ đối với 2.974 tấn tôn màu PCM, VCM. Thời gian áp dụng từ ngày 12/4 đến 31/12. Mã HS của các sản phẩm này như sau: 7210.70.11, 7210.70.19, 7212.40.12, 7212.40.19.\r\n\r\nĐược biết, PCM và VCM là hai loại tôn màu được nhập khẩu vào Việt Nam để phục vụ sản xuất tủ lạnh và máy giặt. Theo quy định, Samsung HCMC CE Complex sẽ được hoàn lại tiền thuế tự vệ đã nộp, thời gian từ ngày 12/4 đến nay.\r\n\r\nTrước đó, ngày 12/4, Công ty Samsung gửi đơn đề nghị lên Cục Phòng vệ thương mại, yêu cầu bổ sung hạn ngạch miễn trừ áp dụng biện pháp tự vệ đối với sản phẩm tôn màu chất lượng cao năm 2019 của công ty.\r\n\r\nCông ty này từng được Bộ Công Thương miễn trừ áp dụng biện pháp tự vệ vào ngày 1/2 khi nhập khẩu tôn màu chất lượng cao trong năm 2019. Lượng miễn trừ được duyệt khi đó là 7.213 tấn.', '2019-10-23 11:41:02', 32, '20190603154917-7e4d-938788111791400.jpg', 632, 'Công ty TNHH Điện tử Samsung HCMC CE Complex', 0),
(26, 'Nhôm nhập khẩu từ Trung Quốc bị áp thuế từ 2,46% đến 35,59%', 'Ngày 29/5 vừa qua, quyết định áp thuế chống bán phá giá tạm thời đối với một số sản phẩm nhôm, hợp kim hoặc không hợp kim, ở dạng thanh, que và hình nhập khẩu từ Trung Quốc chính thức được Bộ Công thương công bố. Mức thuế áp dụng với các sản phẩm này dao động từ 2,46% đến 35,58%.\r\nĐược biết, các sản phẩm bị áp dụng biện pháp chống bán phá giá tạm thời trong quyết định trên có các mã HS là: 7604.10.10, 7604.10.90, 7604.21.90, 7604.29.10, 7604.29.90. Đây đều là sản phẩm xuất xứ từ Trung Quốc nhập khẩu vào Việt Nam.\r\n\r\nHiệu lực áp dụng biện pháp chống bán phá giá tạm thời này kéo dài trong 120 ngày, kể từ ngày 5/6.\r\n\r\nTrước khi hoàn thành kết luận điều tra chính thức về vụ việc, Bộ Công Thương sẽ tiến hành thẩm tra, xác minh lại các thông tin được cung cấp bởi các bên liên quan. Bên cạnh đó, trước khi đưa ra kết luận cuối cùng về vụ việc, Bộ Công Thương cũng sẽ tổ chức tham vấn công khai. Tại đây, các bên được trao đổi trực tiếp, cung cấp thông tin cũng như bày tỏ quan điểm về sự việc.', '2019-10-23 12:22:35', 32, '20191018145953-d52a_wm-938842379320100.jpg', 3256, 'Bộ Công Thương.', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable` int(11) NOT NULL DEFAULT 1,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `password`, `enable`, `role_id`) VALUES
(2, 'mod', 'VinaEnter Edu', '$2a$10$0XLbx6P3t4aTSryZ5DFzie17AaJ7g/WB67J3nqn/YwcvX3dOG.eaq', 1, 2),
(4, 'minhtai', 'Duong Minh Tai', '$2a$10$39jLwAlZ9fFtOr3lsU8ybuxJE4BjdKT0Kc/rZuVC9qDqw6it9FX6i', 1, 2),
(11, 'sytranvan', 'Trần Văn Sỹ', '$2a$10$SgcXY4mkisKrKZ5Kv4G/cOra1rf63iSsna8Qbiw1mFWWjox//cvKG', 1, 2),
(13, 'admin123', 'Duong Minh Tai', '$2a$10$PoAMQaM7JFXHl32JqxLJW.B.fe2ybgfJY.PSziQZaJXqnnHsNQTSC', 1, 2),
(14, 'admin', 'admin', '$2a$10$4gYG.FpYxgc3gc09eyFRnu7yWzyb6nO2CVLaiNsp4w4pkPc0LlNu2', 1, 1),
(15, 'admin12345', 'Duong Minh Tai', '$2a$10$9owm2mUAK6oVy8XiksMud.lfH7wAbfo9yNnkAijlVpdoSTMRCt.Ee', 1, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lands`
--
ALTER TABLE `lands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `lands`
--
ALTER TABLE `lands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
