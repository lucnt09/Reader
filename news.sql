-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 04, 2024 at 07:11 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Bóng Đá', '2024-09-23 20:19:21', '2024-09-23 20:19:21'),
(2, 'Giải Trí', '2024-09-25 01:36:28', '2024-09-25 01:54:59'),
(3, 'Xã Hội', '2024-09-25 01:50:42', '2024-09-25 01:50:42'),
(4, 'Đời Sống', '2024-09-25 01:50:49', '2024-09-25 01:50:49'),
(5, 'Chính Trị', '2024-09-25 01:50:56', '2024-09-25 01:50:56'),
(6, 'Thể Thao', '2024-09-25 01:52:05', '2024-09-25 01:52:05'),
(7, 'Làm Đẹp', '2024-09-25 01:52:19', '2024-09-25 01:52:19'),
(8, 'Kinh Tế', '2024-09-25 01:52:30', '2024-09-25 01:52:30'),
(9, 'Công Nghệ', '2024-09-25 01:52:35', '2024-09-25 01:52:35'),
(10, 'Thế Giới', '2024-09-25 01:53:06', '2024-09-25 01:53:06'),
(11, 'Văn Hóa', '2024-09-25 01:53:18', '2024-09-25 01:53:18'),
(12, 'Giáo Dục', '2024-09-25 01:53:30', '2024-09-25 01:53:30'),
(13, 'Pháp Luật', '2024-09-25 01:53:38', '2024-09-25 01:53:38'),
(14, 'Du Lịch', '2024-09-25 01:55:46', '2024-09-25 01:55:46'),
(15, 'Âm Nhạc', '2024-09-25 01:55:52', '2024-09-25 01:55:52'),
(16, 'Thời Trang', '2024-09-25 01:56:24', '2024-09-25 01:56:24'),
(17, 'Podcasts', '2024-09-25 01:57:57', '2024-09-25 01:57:57'),
(18, 'Tâm Sự', '2024-09-25 01:58:13', '2024-09-25 01:58:13');

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

CREATE TABLE `category_post` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_post_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `post_id`, `image_path`, `created_at`, `updated_at`) VALUES
(17, 19, 'galleries/xEgmWRSUmG2NTt9Fyhvkzgszpp1aBzZvMnaRtjd2.jpg', '2024-09-30 00:21:29', '2024-09-30 00:21:29'),
(18, 19, 'galleries/zJtHttMCb2qjeb0gvqEiZA6hBOg3gESPaa4suwHv.jpg', '2024-09-30 00:30:07', '2024-09-30 00:30:07'),
(19, 25, 'galleries/YL7bfp4FaXcZVjKr03dUnyVYhDlfqDVLiZwZctP2.jpg', '2024-09-30 00:34:49', '2024-09-30 00:34:49'),
(20, 25, 'galleries/RefTyz7O5QixpPzhc0b6jOkXQBjuzC1TpBX5seOI.jpg', '2024-09-30 00:34:49', '2024-09-30 00:34:49'),
(21, 27, 'galleries/Osgjjv3APVMCZvWBd8BDvMQw1PVE6ARImTooQMQK.jpg', '2024-09-30 00:37:05', '2024-09-30 00:37:05'),
(22, 27, 'galleries/dX7HMeSXJwUuZwZM0bl6XeGMht77MrYmfnaXTtbA.jpg', '2024-09-30 00:37:05', '2024-09-30 00:37:05'),
(23, 18, 'galleries/tAXa9LuVwjnuvfGzLZ5pbpV7HBH1djhXGr4SsfA9.jpg', '2024-09-30 00:39:00', '2024-09-30 00:39:00'),
(24, 18, 'galleries/7EADlmbzIWWKFS9b5bkYK14m3Ygj5bE1GgJyIuEy.jpg', '2024-09-30 00:39:00', '2024-09-30 00:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(19, '2014_10_12_100000_create_password_resets_table', 1),
(20, '2019_08_19_000000_create_failed_jobs_table', 1),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(22, '2024_07_17_070835_create_categories_table', 1),
(23, '2024_07_17_071208_create_posts_table', 1),
(24, '2024_07_18_064917_create_category_post_table', 1),
(25, '2024_09_27_014619_create_tags_table', 2),
(26, '2024_09_27_014628_create_post_tag_table', 2),
(27, '2024_09_30_013322_add_views_to_posts_table', 3),
(28, '2024_09_30_063554_create_galleries_table', 4),
(29, '2024_09_30_065053_create_galleries_table', 5),
(30, '2024_10_03_013825_create_user_posts_table', 6),
(31, '2024_10_03_014002_create_comments_table', 6),
(32, '2024_10_03_042804_add_image_to_user_posts_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('abc@gmail.com', '$2y$12$af2r//6VCzYi/5JqhH5cU.tGcPjoYRJ7969oaNkEYwcmbYZWeYOma', '2024-10-01 19:21:37'),
('dzrain0@gmail.com', '$2y$12$O/o6ukNb4myzwtHaY9KrxuNVQU0TFbL5Xv1/0QXzHgebLb.e5Jc/i', '2024-10-01 19:18:31'),
('lucntph40014@fpt.edu.vn', '$2y$12$NRg4W32VnITmZMt50z1Yy.tgSGX1HjTZgXGn5ZDpBZWiCDm73Sl8q', '2024-10-01 19:18:45');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `describe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `views` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `describe`, `content`, `image`, `category_id`, `created_at`, `updated_at`, `views`) VALUES
(18, 'Đội bóng cũ của HLV Ten Hag đòi làm tổn thương Man United', 'HLV của FC Twente, Joseph Oosting tin rằng họ có thể gây tổn thương cho thầy trò HLV Ten Hag nhưng cũng biết sẽ không có cơ hội nào để gây sốc tại Europa League trừ khi họ đang ở đỉnh cao phong độ.', 'Europa League với diện mạo mới sẽ diễn ra tại sân Old Trafford vào rạng sáng 26-9, lúc 2 giờ (giờ Việt Nam) khi HLV Ten Hag dẫn dắt Quỷ đỏ đối đầu với CLB mà ông đã tạo dựng nên tên tuổi. Man United được đánh giá cao hơn về khả năng đánh bại đội xếp thứ ba tại giải Hà Lan mùa trước, nhưng ông thầy Oosting của Twente cảm thấy có thể giành được kết quả trước đội bóng Ngoại hạng Anh này.\r\n\r\nHLV Joseph Oosting chia sẻ: \"Tôi luôn tin vào cơ hội. Nếu dám chơi, chúng tôi sẽ tạo ra chiến thắng. Twente có thể gây tổn thương cho Manchester. Nói thì dễ hơn làm, nhưng chắc chắn là chúng tôi có ý chí. Twente đã chơi những trận đấu với Red Bull (Salzburg, ở vòng loại Champions League) nên không ngần ngại bất cứ đối thủ nào.\r\n\r\nTôi nghĩ, chuyến làm khách Man United với mọi thứ đều diễn ra với tốc độ cao nhất, dù tấn công hay trong phòng thủ. Twente phải là những người giỏi nhất và tôi đang cần điều đó ở các học trò. Tôi nghĩ chúng tôi cũng có nhiều tiến bộ trong thời gian qua. Twente tôn trọng Manchester United, nhưng chúng tôi cũng có niềm tin và ý chí mạnh mẽ để chiến thắng trận đấu này”.\r\n\r\nHLV Ten Hag khi còn làm thủ quân FC Twente. Ảnh: GETTY.\r\n\r\nBên kia chiến tuyến, HLV Ten Hag đã chia sẻ cảm xúc trước trận đấu với đội bóng cũ FC Twente trong trận mở màn vòng bảng UEFA Europa League. Cần biết HLV Ten Hag từng có ba giai đoạn khoác áo Twente trong sự nghiệp cầu thủ - từ năm 1989-1990, 1992-1994 và 1996-2002. Ông cũng đã giành Cúp KNVB vào năm 2001.\r\n\r\nGiờ đây, HLV Ten Hag cùng các học trò MU sẽ tiếp đón đội bóng Hà Lan trên cương vị cầm quân Quỷ đỏ. Khi được hỏi về cảm xúc khi đối đầu với Twente, HLV Ten Hag bộc bạch: \"Tôi muốn đối đầu với một đội khác hơn. Thật không dễ chịu khi phải làm tổn thương CLB mà mình yêu quý. Trong tất cả các đội, Twente là CLB tôi theo dõi nhiều nhất.\r\n\r\nTôi xem Twente chơi bóng như một người hâm mộ, một cổ động viên, không phải là một nhà phân tích. Đó là cách hoàn toàn khác khi xem họ thi đấu. Twente đã mang lại cho tôi rất nhiều, tôi từng qua', 'posts/rHpstgugRBM3ZWH7hOacdGvKMI2GhLO9lrukSgJU.webp', 1, '2024-09-25 01:17:43', '2024-09-30 00:39:17', 13),
(19, 'Nhan sắc Jang Won Young thay đổi ra sao mà được netizen hết lời khen ngợi?', 'TPO - Jang Won Young từng khiến dư luận Hàn Quốc xôn xao khi xuất hiện với thân hình gầy gò, cho thấy tình trạng sức khỏe đáng báo động. Tuy nhiên, trong concert mới diễn ra, nữ idol sinh năm 2004 ghi điểm nhờ diện mạo mới tràn đầy sức sống.', 'Jang Won Young từng nhiều lần khiến người hâm mộ lo lắng khi xuất hiện tại các sự kiện âm nhạc, thời trang với thân hình \"gầy trơ xương\". Trang phục biểu diễn cho thấy từ chân, cánh tay của nữ idol sinh năm 2004 đều gầy rộc đến mức báo động. Trong một số đoạn trình diễn vũ đạo, khung xương sườn của nữ idol lộ rõ khiến khán giả không khỏi lo lắng cho tình trạng sức khỏe của cô.\r\n\r\nNhan sắc Jang Won Young thay đổi ra sao mà được netizen hết lời khen ngợi? ảnh 13\r\nNhan sắc Jang Won Young thay đổi ra sao mà được netizen hết lời khen ngợi? ảnh 14\r\nNhan sắc Jang Won Young thay đổi ra sao mà được netizen hết lời khen ngợi? ảnh 15\r\nThông tin từng được công bố từ năm 2022 cho biết Jang Won Young cao 1m73, nặng 47kg. Theo đó, chỉ số BMI của cô là 15,7, bị đánh giá là gầy, suy dinh dưỡng báo động ở mức độ 3. Một số khán giả cho rằng nữ idol không có thời gian nghỉ ngơi hợp lý do lịch trình công việc dày đặc. Won Young cũng bị đồn đoán là có chế độ ăn kiêng hà khắc khi khán giả phát hiện cô có dấu hiệu rụng tóc (biểu hiện của ăn kiêng sai cách).\r\n\r\nNhan sắc Jang Won Young thay đổi ra sao mà được netizen hết lời khen ngợi? ảnh 16\r\nNhan sắc Jang Won Young thay đổi ra sao mà được netizen hết lời khen ngợi? ảnh 17\r\nNhan sắc Jang Won Young thay đổi ra sao mà được netizen hết lời khen ngợi? ảnh 18\r\nDư luận xứ Hàn bày tỏ quan ngại trước vóc dáng gầy gò của Jang Won Young nói riêng, loạt idol thế hệ thứ tư nói chung. Các ý kiến cho rằng thực trạng các ngôi sao thần tượng ngày càng gầy đi có tác động tiêu cực đến tiêu chuẩn sắc đẹp của giới trẻ xứ Hàn. Trên các diễn đàn trực tuyến, giới trẻ xứ củ sâm cho biết họ gặp áp lực về ngoại hình khi thấy người nổi tiếng ngày một mảnh mai hơn và điều đó đang được \"bình thường hóa\".', 'posts/cQRHXM05gsLi960utzXHkKL1DsPqvSZXXpPhTNNr.jpg', 2, '2024-09-25 01:39:51', '2024-10-01 19:59:24', 46),
(25, 'IU - Nữ ca sĩ đầu tiên tổ chức concert tại sân vận động lớn nhất Hàn Quốc', 'Concert mang tính lịch sử của IU không chỉ thu hút người hâm mộ mà còn có sự tham gia của nhiều ngôi sao Kpop nổi tiếng.', 'Cuối tuần qua, IU đã tổ chức thành công concert HEREH World Tour tại sân vận động World Cup Seoul (Hàn Quốc). Điều này khiến IU làm nên lịch sử khi trở thành nữ ca sĩ đầu tiên tổ chức concert tại sân vận động lớn nhất Hàn Quốc. Tính tổng thể concert solo, IU là nghệ sĩ thứ ba biểu diễn tại địa điểm lớn này sau G-Dragon và Lim Young Woong.\r\n\r\nĐây là sân vận động mang tính biểu tượng của Seoul, có sức chứa hơn 66.000 chỗ ngồi. Địa điểm này là một trong năm địa điểm sân vận động bóng đá lớn nhất châu Á và rất hiếm khi tổ chức những buổi hoà nhạc Kpop. Những ngôi sao từng tổ chức concert riêng tại đây là Seo Taiji and Boys, BIGBANG, SEVENTEEN,...\r\n\r\nADVERTISING\r\niTVC from Admicro\r\nBuổi hoà nhạc của IU không chỉ thu hút sự chú ý của những người hâm mộ mà còn nhận được sự ủng hộ của nhiều ngôi sao Kpop khác bao gồm V, j-hope - thành viên BTS, G-Dragon, LE SSERAFIM, StayC, RIIZE,...\r\n\r\nNgay sau khi thông tin được đăng tải, những người hâm mộ đã lên tiếng chúc mừng thành tích mới của ngôi sao sinh năm 1993. Nhiều người nhận định IU chính là ca sĩ quốc dân khi nhận được sự ủng hộ và đánh giá tích cực của khán giả ở mọi lứa tuổi tại Hàn Quốc.', 'posts/2vOm5yEm6QKSoMfTFz3rx3qLP3CXYkcMs8l7x2cB.jpg', 2, '2024-09-26 19:50:01', '2024-10-01 01:51:27', 4),
(27, 'Ba cung đường đi bộ ngắm mùa thu tại Nhật', 'Cung đường Nakasendo, núi Takao, mạng lưới hành hương Kumano Kodo là các gợi ý dành cho du khách thích hòa mình vào thiên nhiên Nhật Bản mùa thu.', 'Ba cung đường dành cho du khách vừa muốn đi bộ đường dài vừa ngắm lá vàng lá đỏ mùa thu ở Nhật Bản dưới đây được Cơ quan Xúc tiến du lịch Nhật Bản (JNTO) đánh giá dễ đi. Các cung đường này đa dạng về địa hình, vừa có những đoạn dễ cho người mới bắt đầu vừa có đoạn khó dành cho tín đồ đam mê mạo hiểm.\r\n\r\nCung đường Nakasendo, tỉnh Gifu và tỉnh Nagano\r\n\r\nNakasendo là một trong 5 tuyến đường chính được xây dựng trong thời kỳ Edo, kết nối Edo (Tokyo ngày nay) với Kyoto. Một trong những đoạn phổ biến, thu hút nhiều du khách trải nghiệm nhất của Nakasendo, cung đường nằm giữa hai thị trấn Tsumago, tỉnh Nagano và Magome, tỉnh Gifu. Đoạn này dài gần 8 km, trong đó đường mòn qua núi dài khoảng 7 km. Đây là cung bằng phẳng, đi lại dễ dàng với người mới bắt đầu.\r\n\r\nCung đường Nakasendo đi qua thị trấn Tsumago với các ngôi nhà gỗ truyền thống hai bên đường. Ảnh: Lonely Planet\r\nCung đường Nakasendo đi qua thị trấn Tsumago với các ngôi nhà gỗ truyền thống hai bên đường. Ảnh: Lonely Planet\r\n\r\nThị trấn Tsumago là di tích lịch sử cấp quốc gia, nổi bật với các khu nhà truyền thống nằm san sát nhau trên đoạn đường dài 800 m. Các dãy nhà ngày nay được dùng làm nhà hàng, cửa hàng bán đồ lưu niệm.\r\n\r\nĐi qua Tsumago, du khách sẽ đến ngôi làng Otsumago, cũng là một khu vực được bảo tồn với nhiều nhà trọ truyền thống nằm rải rác. Sau khi đi qua làng, băng qua một con đường lát đá cuội thoai thoải và cây cầu bắc qua suối, du khách tiếp tục đi vào đường mòn trên núi.\r\n\r\nCon đường xuyên rừng trên núi được bao quanh bởi cây cối và đến đèo Magome sẽ có quán trà để khách dừng chân nghỉ ngơi. Du khách kết thúc hành trình tại thị trấn Magome. Từ đài quan sát, du khách có thể ngắm nhìn toàn cảnh núi Ena. Magome có nhiều cửa hàng lưu niệm, nhà hàng nằm trong các ngôi nhà gỗ truyền thống, tạo cảm giác như du khách đang quay ngược thời gian để về lại thời kỳ Edo.\r\n\r\nThời gian hiking lý tưởng: cuối tháng 6 đến tháng 11.\r\n\r\nThời gian đi bộ: khoảng 3 tiếng.\r\n\r\nĐánh giá mức độ khó của cung đường:\r\n\r\nKỹ năng: ★☆☆☆☆\r\nThể lực: ★☆☆☆☆\r\nTrang bị: ★★☆☆☆\r\n\r\nĐi bộ đường dài trên núi Takao, Tokyo\r\n\r\nTakao là một trong những ngọn núi hút khách nhất Nhật Bản nhờ địa hình thấp, đỉnh núi cao 599 m, dễ tiếp cận và cách trung tâm Tokyo khoảng 50 phút di chuyển bằng tàu. Núi có 9 tuyến đường mòn phù hợp với nhiều cấp độ, kỹ năng khác nhau, phục vụ những người mới bắt đầu và dân leo núi chuyên nghiệp.\r\n\r\nNúi Takao mùa thu. Ảnh: Living Nomads\r\nNúi Takao mùa thu. Ảnh: Living Nomads\r\n\r\n4 cung đường đi bộ nổi tiếng trên núi là đường mòn số 1,3,6 và đường mòn Inariyama Trong đó, đường mòn số một phổ biến nhất vì dễ đi, phù hợp cho người mới bắt đầu. Tuyến khó đi là đường mòn Inariyama. Các cung này có độ dài 3-4 km.\r\n\r\nVào những ngày trời quang đãng, từ đài quan sát trên đỉnh núi, du khách có thể ngắm toàn cảnh thành phố Tokyo và núi Phú Sĩ phía xa. Kết thúc chuyến đi, du khách có thể ghé thăm suối nước nóng Gokurakuyu Keio Takaosan cạnh ga Takaosanguchi và ngâm mình thư giãn.\r\n\r\nThời gian đi bộ lý tưởng: tháng 9 đến cuối tháng 11', 'posts/F3ZFBtX6891mxbAtHcQ6kDgSCas30oZOEQkqTz1a.jpg', 14, '2024-09-27 02:45:44', '2024-09-30 00:37:11', 10);

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(19, 4),
(19, 5),
(25, 5),
(25, 7),
(25, 8),
(18, 16),
(18, 18),
(27, 20),
(27, 21),
(27, 22);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(4, 'Jang Won-young', '2024-09-26 19:36:00', '2024-09-26 19:36:00'),
(5, 'kpop', '2024-09-26 19:36:00', '2024-09-26 19:36:00'),
(7, 'iu', '2024-09-26 19:51:45', '2024-09-26 19:51:45'),
(8, 'concert', '2024-09-26 19:51:45', '2024-09-26 19:51:45'),
(16, 'bóng đá', '2024-09-26 20:00:01', '2024-09-26 20:00:01'),
(18, 'MU', '2024-09-26 20:02:56', '2024-09-26 20:02:56'),
(20, 'nhat ban', '2024-09-27 02:45:44', '2024-09-27 02:45:44'),
(21, 'du lich', '2024-09-27 02:45:44', '2024-09-27 02:45:44'),
(22, 'mua thu', '2024-09-27 02:45:44', '2024-09-27 02:45:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('admin','member') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Marcus Harris', 'osborne.bayer@example.net', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', 'SPJFakz2Dy', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(2, 'Katharina Rutherford', 'muller.lisandro@example.com', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', 'xf690E26jy', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(3, 'Deangelo Littel', 'brittany27@example.org', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', 'cFjloGKRe5', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(4, 'Kimberly Littel', 'alessia.block@example.org', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', 'VM2DbrnnaS', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(5, 'Helmer Jacobi I', 'velma79@example.org', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', 'neZv0MRqnw', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(6, 'Dr. Evan Stokes', 'stehr.francisco@example.net', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', 'XpfCRGdA1q', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(7, 'Pascale Borer', 'dalton.grant@example.net', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', '7jmfNX17cV', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(8, 'Destany Hermann', 'dubuque.mertie@example.com', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', 'gqcb5geOiW', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(9, 'Ms. Berneice Ritchie Sr.', 'torphy.friedrich@example.net', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', '7nMkx44TB4', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(10, 'Jayne Fadel', 'lavinia16@example.com', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', 'Ty4wAYGzE5', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(11, 'Test User', 'test@example.com', '2024-09-23 20:16:49', '$2y$12$X0KrwOvfH.ipCpUDhiXcp.BWEBSAJhF6Nlj3nOsNz/r9bhlOmoIiy', 'member', '9PXKCnnJLr7HsGk6yPxr8zF0dz0fxgwLsYhUAfQCwbJiI9erUXf1qJqYQVv0', '2024-09-23 20:16:49', '2024-09-23 20:16:49'),
(12, 'Princess', 'abc@gmail.com', NULL, '$2y$12$2KVt.dd98GzmuzadMcrYquReaNeGZZW3QdQsEsr/D1s5i/a4T.AcO', 'admin', NULL, '2024-09-23 20:17:20', '2024-09-23 20:17:20'),
(13, 'aaaaaaaa', 'aaa@gmail.com', NULL, '$2y$12$afLhn/4.wcbvTo/z8UvtMOx4MJ2PwtxNBwiqqPS7nLU6KoyjepJXW', 'member', NULL, '2024-09-23 20:37:41', '2024-09-23 20:37:41'),
(14, 'Nguyen Tien Luc', 'lucifer@gmail.com', NULL, '$2y$12$VGS0yac5IS2oo76wQIKnvOumJHRDUQkmx7D0rilBfmI9n27/MMG5W', 'member', NULL, '2024-09-29 18:43:48', '2024-09-29 18:43:48'),
(15, 'Lucifer', 'dzrain0@gmail.com', NULL, '$2y$12$RcIogw2uEuNFk9kuZKBCVOtB39ENXHqJgIjtwWJThDx/OQbCR1MTO', 'member', NULL, '2024-09-29 19:20:47', '2024-09-29 19:20:47'),
(16, 'abc', 'lucntph40014@fpt.edu.vn', NULL, '$2y$12$vBQn/7G1sTZxxt9RB0O.6.31vbQpFdgRPYSiqvETwwepObsiczBl2', 'member', NULL, '2024-09-29 19:22:22', '2024-09-29 19:22:22'),
(17, 'aaaaaaa', 'abc123@gmail.com', NULL, '$2y$12$TuJvdvAEn975tFN6A8yQ5OT2voZuNIpLfZj0h.ISV3Dj.bNNJWVMq', 'member', NULL, '2024-10-01 01:00:01', '2024-10-01 01:00:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_posts`
--

CREATE TABLE `user_posts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Chờ duyệt','Đã duyệt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chờ duyệt',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_posts`
--

INSERT INTO `user_posts` (`id`, `user_id`, `title`, `content`, `status`, `created_at`, `updated_at`, `image`) VALUES
(18, 12, 'yg6t5h', 'h6thy55555555', 'Đã duyệt', '2024-10-03 18:41:55', '2024-10-03 18:47:18', 'userpost/ZKTmhrXtnUdKhGYJeaeWqdaVxpOkNiB2tI1eIxaP.jpg'),
(24, 12, 'test', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'Đã duyệt', '2024-10-03 19:25:23', '2024-10-03 19:25:28', 'userpost/8qNXxHSuOxcOaIF4pSDWGt1aawymbtt9QFwHjm6V.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_post_category_id_foreign` (`category_id`),
  ADD KEY `category_post_post_id_foreign` (`post_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_post_id_foreign` (`user_post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_post_id_foreign` (`post_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_posts`
--
ALTER TABLE `user_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_posts_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_posts`
--
ALTER TABLE `user_posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_post`
--
ALTER TABLE `category_post`
  ADD CONSTRAINT `category_post_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_post_id_foreign` FOREIGN KEY (`user_post_id`) REFERENCES `user_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_posts`
--
ALTER TABLE `user_posts`
  ADD CONSTRAINT `user_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
