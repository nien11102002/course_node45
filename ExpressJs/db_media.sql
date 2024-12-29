/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `chats` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `user_id_sender` int DEFAULT NULL,
  `user_id_recipient` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`chat_id`),
  KEY `user_id_sender` (`user_id_sender`),
  KEY `user_id_recipient` (`user_id_recipient`),
  CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`user_id_sender`) REFERENCES `users` (`user_id`),
  CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`user_id_recipient`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `permissions` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) DEFAULT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `role_permissions` (
  `role_permissions_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `permission_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_permissions_id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `face_app_id` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `video_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `videos` (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `video_name` varchar(255) NOT NULL,
  `description` text,
  `thumbnail` varchar(255) DEFAULT NULL,
  `views` int DEFAULT '0',
  `source` varchar(255) NOT NULL,
  `type_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`video_id`),
  KEY `type_id` (`type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `video_type` (`type_id`),
  CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(1, '1', 14, 16, '2024-12-03 18:38:13', '2024-12-03 18:38:13');
INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(2, '1', 14, 16, '2024-12-03 18:40:12', '2024-12-03 18:40:12');
INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(3, '2', 14, 16, '2024-12-03 18:40:19', '2024-12-03 18:40:19');
INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(4, '3', 14, 16, '2024-12-03 18:40:21', '2024-12-03 18:40:21'),
(5, '4', 14, 16, '2024-12-03 18:40:23', '2024-12-03 18:40:23'),
(6, '4', 14, 16, '2024-12-03 18:40:31', '2024-12-03 18:40:31'),
(7, '1', 14, 16, '2024-12-03 18:40:36', '2024-12-03 18:40:36'),
(8, '1', 14, 16, '2024-12-03 18:40:53', '2024-12-03 18:40:53'),
(9, '1', 14, 16, '2024-12-03 18:42:23', '2024-12-03 18:42:23'),
(10, '1', 14, 15, '2024-12-03 18:43:19', '2024-12-03 18:43:19'),
(11, '1', 14, 16, '2024-12-03 18:43:30', '2024-12-03 18:43:30'),
(12, '5', 14, 16, '2024-12-03 18:43:34', '2024-12-03 18:43:34'),
(13, '2', 14, 16, '2024-12-03 18:47:16', '2024-12-03 18:47:16'),
(14, '3', 14, 16, '2024-12-03 18:47:17', '2024-12-03 18:47:17'),
(15, '4', 14, 16, '2024-12-03 18:47:18', '2024-12-03 18:47:18'),
(16, '5', 14, 16, '2024-12-03 18:47:19', '2024-12-03 18:47:19'),
(17, 'abcd', 14, 15, '2024-12-03 18:48:40', '2024-12-03 18:48:40'),
(18, 'a', 14, 16, '2024-12-03 18:50:26', '2024-12-03 18:50:26'),
(19, '1', 14, 16, '2024-12-03 18:55:21', '2024-12-03 18:55:21');

INSERT INTO `permissions` (`permission_id`, `permission_name`, `endpoint`, `method`, `module`, `created_at`, `updated_at`) VALUES
(1, 'Read video-type', 'video/video-type', 'GET', 'videos', '2024-11-03 09:11:44', '2024-11-03 09:11:44');
INSERT INTO `permissions` (`permission_id`, `permission_name`, `endpoint`, `method`, `module`, `created_at`, `updated_at`) VALUES
(2, 'Read video', 'video/video-list', 'GET', 'videos', '2024-11-03 09:11:56', '2024-11-03 09:11:56');


INSERT INTO `role_permissions` (`role_permissions_id`, `role_id`, `permission_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '2024-11-27 18:33:56', '2024-11-27 18:33:56');


INSERT INTO `roles` (`role_id`, `role_name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'ROLE_ADMIN', 'Administrator with full access rights', 1, '2024-11-03 09:10:56', '2024-11-27 18:59:38');
INSERT INTO `roles` (`role_id`, `role_name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'ROLE_USER', 'Regular user with limited access rights', 1, '2024-11-03 09:10:56', '2024-11-27 18:59:38');


INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `google_id`, `face_app_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'john.doe@example.com', 'SecurePass123', 'John Doe', 'https://example.com/avatars/john_doe.jpg', 'google_id_1', 'facebook_id_1', 2, '2024-11-03 09:10:56', '2024-11-03 09:10:56');
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `google_id`, `face_app_id`, `role_id`, `created_at`, `updated_at`) VALUES
(2, 'jane.smith@example.com', 'Password456', 'Jane Smith', 'https://example.com/avatars/jane_smith.jpg', 'google_id_2', 'facebook_id_2', 2, '2024-11-03 09:10:56', '2024-11-03 09:10:56');
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `google_id`, `face_app_id`, `role_id`, `created_at`, `updated_at`) VALUES
(3, 'alex.brown@example.com', 'AlexPass789', 'Alex Brown', 'https://example.com/avatars/alex_brown.jpg', 'google_id_3', 'facebook_id_3', 2, '2024-11-03 09:10:56', '2024-11-03 09:10:56');
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `google_id`, `face_app_id`, `role_id`, `created_at`, `updated_at`) VALUES
(4, 'lisa.white@example.com', 'LisaSecure321', 'Lisa White', 'https://example.com/avatars/lisa_white.jpg', 'google_id_4', 'facebook_id_4', 2, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(5, 'michael.green@example.com', 'MikePass654', 'Michael Green', 'https://example.com/avatars/michael_green.jpg', 'google_id_5', 'facebook_id_5', 2, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(6, 'sarah.jones@example.com', 'SarahPass987', 'Sarah Jones', 'https://example.com/avatars/sarah_jones.jpg', 'google_id_6', 'facebook_id_6', 2, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(7, 'david.wilson@example.com', 'DavidSecure111', 'David Wilson', 'https://example.com/avatars/david_wilson.jpg', 'google_id_7', 'facebook_id_7', 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(8, 'emma.taylor@example.com', 'EmmaPass222', 'Emma Taylor', 'https://example.com/avatars/emma_taylor.jpg', 'google_id_8', 'facebook_id_8', 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(9, 'chris.moore@example.com', 'ChrisPass333', 'Chris Moore', 'https://example.com/avatars/chris_moore.jpg', 'google_id_9', 'facebook_id_9', 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(10, 'olivia.thomas@example.com', 'OliviaSecure444', 'Olivia Thomas', 'https://example.com/avatars/olivia_thomas.jpg', 'google_id_10', 'facebook_id_10', 2, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(11, 'test@gmail.com', '$2b$10$Z5ZCd/AGKX1CWJ.jYLkaReetIyXQ.trnod3y8eTf0De1SchcvwQku', 'test', 'images/auczv67yj8gz2hcjrjes', NULL, NULL, 1, '2024-11-09 08:24:56', '2024-12-04 18:55:12'),
(12, 'test1@gmail.com', '$2b$10$fpr9okS0/JYfT1ck4/0pfOmu.3Bm7JDmSmPL881iM2qf26SyGBiP2', 'test', NULL, NULL, NULL, 2, '2024-11-09 08:28:19', '2024-11-27 18:42:47'),
(13, 'test123@gmail.com', '$2b$10$QGACRu6tm2ljaCmKJ0NXT.T4gtLFlo95Ni9T3F.am3EOjtsxtGTZ.', 'test', NULL, NULL, NULL, 1, '2024-11-10 08:02:23', '2024-11-27 18:42:47'),
(14, 'nien11102002@gmail.com', NULL, 'Nguyễn Duy Niên', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=2350441915307416&height=50&width=50&ext=1734337362&hash=AbbOrjcqJqzLWr5uClxenpHf', NULL, '2350441915307416', 1, '2024-11-16 08:22:38', '2024-11-27 18:59:59'),
(15, 'test321@gmail.com', '$2b$10$MpaMM0b7Op.ZXXIwQ8.Jvu.PCL1ydA/ozfGx6V7l.PTqnvpXik7Su', 'Nien', NULL, NULL, NULL, NULL, '2024-12-03 18:20:16', '2024-12-03 18:20:16'),
(16, 'fmldn123@gmail.com', '$2b$10$Go8LtgFvUMvPWFwFcQvr9.ZUgoVyNJrAKuQ.TQ8wey0Jo9U81vs4S', 'NDN', NULL, NULL, NULL, NULL, '2024-12-03 18:21:45', '2024-12-03 18:21:45');

INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'New', 'IconNews', '2024-11-03 09:10:56', '2024-11-03 09:10:56');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(2, 'Coding', 'IconCode', '2024-11-03 09:10:56', '2024-11-03 09:10:56');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(3, 'Music', 'IconMusic', '2024-11-03 09:10:56', '2024-11-03 09:10:56');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(4, 'Movie', 'IconVideo', '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(5, 'Gaming', 'IconDeviceGamepad', '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(6, 'Sport', 'IconBallBaseball', '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(7, 'Fashion', 'IconShirt', '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(8, 'Gym', 'IconUmbrella', '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(9, 'Crypto', 'IconDiamond', '2024-11-03 09:10:56', '2024-11-03 09:10:56');

INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'SƠN TÙNG M-TP | ĐỪNG LÀM TRÁI TIM ANH ĐAU | OFFICIAL TEASER', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure rem, tempora quia culpa praesentium totam id adipisci. Itaque voluptatibus aspernatur vitae quisquam cumque? Quaerat fugit tempora recusandae illo quod aspernatur impedit cumque exercitationem vel! Doloribus nemo suscipit eius deserunt eveniet hic, tempore odit fugiat soluta itaque, sequi et voluptatem! Consequuntur, autem deleniti commodi placeat sed numquam, illo harum unde dolore officia laborum accusamus animi libero? Blanditiis ratione esse nulla ut aperiam quasi non distinctio animi minus qui ducimus sit odit nobis officia, facere voluptates! Minima ut animi facere enim modi autem aliquid, numquam amet sapiente iure suscipit quisquam delectus tempore. Fuga, quae, consequuntur nam aliquid est fugiat nulla laudantium veritatis quos enim quibusdam impedit porro doloribus dolorum libero, dignissimos atque. Placeat ipsa saepe dolore. Repellat, ea. Doloremque repellendus facilis rem aliquam suscipit iusto exercitationem, magnam hic. Officia dolores corporis dolore nam magni quia magnam at dicta cumque accusantium eos assumenda expedita, ducimus voluptates porro est dignissimos! Saepe facere fugiat atque, numquam tempora eius? Ut ipsum beatae porro odio aspernatur, iure voluptatum. Libero adipisci temporibus eius dolore recusandae, veniam obcaecati soluta fuga, animi totam beatae quisquam modi officiis magnam quibusdam nostrum. Laborum porro quibusdam deserunt nesciunt perspiciatis totam libero cupiditate esse.', 'https://img.youtube.com/vi/CQXQKr_3vKE/maxresdefault.jpg', 1500, 'https://www.youtube.com/watch?v=CQXQKr_3vKE', 2, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'SƠN TÙNG M-TP | ĐỪNG LÀM TRÁI TIM ANH ĐAU | OFFICIAL', 'Highlights from a live music concert', 'https://img.youtube.com/vi/abPmZCZZrFA/maxresdefault.jpg', 800, 'https://www.youtube.com/watch?v=abPmZCZZrFA', 3, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'SƠN TÙNG M-TP | CHÚNG TA CỦA TƯƠNG LAI | OFFICIAL MUSIC VIDEO\n', 'First episode of a gaming adventure', 'https://img.youtube.com/vi/zoEtcR5EW08/maxresdefault.jpg', 2500, 'https://www.youtube.com/watch?v=zoEtcR5EW08', 5, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'SƠN TÙNG M-TP | 7-MINUTE STAGE | ĐỪNG LÀM TRÁI TIM ANH ĐAU\n', 'Latest fashion trends for the spring season', 'https://img.youtube.com/vi/FEmnnU-HhnQ/maxresdefault.jpg', 1200, 'https://www.youtube.com/watch?v=FEmnnU-HhnQ', 7, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(5, '(Synthwave Disco 80s) Em Đừng Đi - Sơn Tùng M-TP | Prod. by SenTfour\n', 'Understanding the basics of cryptocurrency', 'https://img.youtube.com/vi/kMg3wTAhNsY/maxresdefault.jpg', 300, 'https://www.youtube.com/watch?v=kMg3wTAhNsY', 9, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(6, 'SƠN TÙNG M-TP | MUỘN RỒI MÀ SAO CÒN | OFFICIAL MUSIC VIDEO\n', 'Complete guide to full stack web development', 'https://img.youtube.com/vi/xypzmu5mMPY/maxresdefault.jpg', 1200, 'https://www.youtube.com/watch?v=xypzmu5mMPY', 2, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(7, 'NƠI NÀY CÓ ANH | OFFICIAL MUSIC VIDEO | SƠN TÙNG M-TP\n', 'Soulful acoustic guitar performance', 'https://img.youtube.com/vi/FN7ALfpGxiI/maxresdefault.jpg', 650, 'https://www.youtube.com/watch?v=FN7ALfpGxiI', 3, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(8, 'SƠN TÙNG M-TP | CHÚNG TA CỦA HIỆN TẠI | OFFICIAL MUSIC VIDEO\n', 'Compilation of epic gaming moments', 'https://img.youtube.com/vi/psZ1g9fMfeo/maxresdefault.jpg', 3500, 'https://www.youtube.com/watch?v=psZ1g9fMfeo', 5, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(9, 'SƠN TÙNG M-TP | HÃY TRAO CHO ANH ft. Snoop Dogg | Official MV\n', 'Effective fitness workout routine', 'https://img.youtube.com/vi/knW7-x7Y7RE/maxresdefault.jpg', 900, 'https://www.youtube.com/watch?v=knW7-x7Y7RE', 8, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(10, 'Em Là Mầm Non Của Đảng (Thu thanh trước 1975) | Hà Nội Vi Vu', 'Effective fitness workout routine', 'https://img.youtube.com/vi/vfWTt905FUI/maxresdefault.jpg', 900, 'https://www.youtube.com/watch?v=vfWTt905FUI', 8, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(11, 'SƠN TÙNG M-TP x BOMATELA | CÓ CHẮC YÊU LÀ ĐÂY (REMIX) | SHOW RECAP', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cupiditate pariatur praesentium alias quod explicabo. Amet necessitatibus voluptates vitae ut? Ratione, molestias quasi nihil tempore quisquam veritatis repellat aut autem? Cupiditate, voluptatem vel minima, natus quis doloribus in inventore harum qui autem eaque eos, aspernatur magnam. Saepe quae reprehenderit ipsum voluptatum dolores, atque ullam at optio minima inventore iure quis, labore unde voluptatibus accusamus eveniet illo praesentium magni quos ad illum. Laboriosam incidunt aliquam rerum eius aperiam ad nobis quos quae, sequi, ab iusto laborum, eos sunt tenetur qui modi atque iste. Cupiditate quaerat quasi accusantium itaque voluptas. Asperiores pariatur autem perferendis repellendus minus ducimus aut iste molestiae est error aspernatur maxime corporis mollitia, voluptatum omnis facilis, voluptatem blanditiis deleniti consequuntur soluta! Corrupti distinctio vel sequi ab adipisci deleniti eos quod atque, nulla, eius eveniet. Nihil numquam suscipit neque blanditiis labore exercitationem amet quae officia sit natus culpa consequatur, recusandae architecto sapiente sed nesciunt! Odit quae ad voluptate adipisci tempore harum in voluptates quos, beatae impedit delectus ab exercitationem dolorem illo. Beatae delectus dicta esse quod voluptates sed corporis suscipit maxime, exercitationem laboriosam voluptas amet impedit. Id, ad reprehenderit libero incidunt quasi reiciendis neque dolorum nobis. Officiis ullam earum modi repellat?', 'https://img.youtube.com/vi/EhJqekMVxTc/maxresdefault.jpg', 299, 'https://www.youtube.com/watch?v=EhJqekMVxTc', 1, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(12, 'SƠN TÙNG M-TP | LẠC TRÔI MOVINGTOON | PHOTOSHOOT | OFFICIAL EPISODE 36', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequuntur vitae expedita, saepe repellat atque quia. Autem recusandae nostrum itaque in, perspiciatis ullam, sunt, magnam ducimus eaque quisquam hic magni possimus sed alias soluta vitae enim quasi id veritatis iusto nam iure porro. Natus, minima fugiat, inventore minus omnis quaerat mollitia quo voluptatum, blanditiis ipsa voluptatem consectetur fugit asperiores expedita numquam? Quia sed blanditiis nam a odit omnis facere nesciunt dolorum sequi tempora, corporis hic dicta minima possimus vel exercitationem impedit reprehenderit quod expedita quos perferendis veniam officia! Dolore aperiam aliquid, libero accusantium dolores qui fuga doloremque molestiae! Pariatur, explicabo vitae.', 'https://img.youtube.com/vi/phknRB6-f4U/maxresdefault.jpg', 408, 'https://www.youtube.com/watch?v=phknRB6-f4U', 1, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(13, 'SƠN TÙNG M-TP | LẠC TRÔI MOVINGTOON | TÙNG FAKE TÙNG REAL | OFFICIAL EPISODE 30', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Blanditiis, atque minima optio quibusdam, officia facilis delectus rem iste, beatae saepe doloremque? Quaerat, provident quidem qui minus facilis, reprehenderit temporibus explicabo non deleniti sapiente nostrum tenetur eaque hic, recusandae quas voluptate consequatur rerum quasi. Provident laborum magnam repudiandae vitae possimus voluptatibus, ipsum omnis facere blanditiis nesciunt? Eligendi mollitia aut obcaecati aliquam alias sequi non libero! Officiis, repudiandae. Tenetur distinctio voluptatibus ducimus nobis quis inventore dicta alias fuga quia sit. Minus veniam quidem expedita, adipisci, ipsa quo tempore neque ullam itaque, ratione modi possimus officia! Ipsum cum dolorem obcaecati alias maiores fugit veniam, repellat, dicta facilis blanditiis enim inventore animi id ea quasi. Sunt numquam reprehenderit quidem modi blanditiis dolor et, corrupti architecto nulla recusandae sapiente molestiae iusto officia repellendus, optio laudantium?', 'https://img.youtube.com/vi/kgeiiJNewZc/maxresdefault.jpg', 199, 'https://www.youtube.com/watch?v=kgeiiJNewZc', 4, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(14, 'SON TUNG M-TP | MAKING MY WAY | OFFICIAL VISUALIZER', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio maiores expedita, ad nulla dicta quam nisi beatae, voluptas quae necessitatibus, facilis excepturi velit harum explicabo debitis. Et iure veritatis ex, nemo culpa in ipsum laudantium corporis. Vitae dolor quasi architecto repellat, soluta ipsum reiciendis, iusto quia voluptate delectus unde veritatis in tempore magnam laborum nesciunt minima provident ducimus nulla maxime totam eos sapiente quisquam quas? Debitis, nisi nostrum. Quaerat eveniet voluptatem nemo error necessitatibus placeat illum excepturi cupiditate voluptate. Officia, voluptatibus unde! Sed illo error placeat, fugit deserunt quisquam adipisci tenetur facilis quod non pariatur nisi ullam odio nemo dolorum sunt omnis corrupti eligendi reprehenderit accusamus tempore facere earum autem nam. Repudiandae saepe praesentium quos, aliquid voluptatibus ullam sint excepturi!', 'https://img.youtube.com/vi/niPkap1ozUA/maxresdefault.jpg', 120, 'https://www.youtube.com/watch?v=niPkap1ozUA', 6, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(15, 'SƠN TÙNG M-TP | THERE’S NO ONE AT ALL (ANOTHER VERSION) | OFFICIAL MUSIC VIDEO', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio omnis amet error id, cupiditate, numquam quo deleniti voluptate recusandae itaque neque et ut laboriosam. Illum molestias, quae quas soluta molestiae quidem tenetur officiis in. Corrupti natus ipsum porro omnis dolore officia? Laboriosam consectetur culpa praesentium quibusdam ullam dolor similique eligendi maxime aspernatur rem illo illum corporis corrupti est tempore, tempora excepturi numquam totam officia consequuntur! Incidunt, maxime. In a ipsa cumque quaerat, mollitia, asperiores ducimus enim iste nemo velit facilis quia tempora? Sed consequuntur illo iste odio provident cum voluptatibus saepe maiores a nihil, ab corrupti molestias, dolorum quia. Aliquam, natus! Odit commodi dolorem eveniet. Velit illo sit id tempora?', 'https://img.youtube.com/vi/JHSRTU31T14/maxresdefault.jpg', 1000, 'https://www.youtube.com/watch?v=JHSRTU31T14', 4, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(16, 'SƠN TÙNG M-TP | LẠC TRÔI MOVINGTOON | KÝ HỢP ĐỒNG | OFFICIAL EPISODE 32', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi voluptas consectetur, dolor, facilis perferendis autem, tempora hic eaque blanditiis beatae dignissimos culpa natus tenetur cum labore non laudantium quis? Consectetur veniam fugit modi dolor facilis, explicabo impedit velit, eveniet deleniti unde dolorum est quasi alias dolores perspiciatis similique ipsa asperiores cupiditate assumenda nostrum culpa. Harum ratione delectus dolorem perspiciatis iure pariatur laudantium ullam culpa error mollitia sunt rerum rem voluptatibus quis, eaque accusamus totam illo eligendi. Dicta ab incidunt ipsum repudiandae pariatur consequatur vel doloremque sit nesciunt, nobis dignissimos veniam beatae ex? Veniam laboriosam, numquam facilis deserunt laudantium repellat.', 'https://img.youtube.com/vi/MaI7JCybK3s/maxresdefault.jpg', 999, 'https://www.youtube.com/watch?v=MaI7JCybK3s', 6, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56'),
(17, 'Bản tình ca của Đá - [Official Audio] - HwangCho - Đường anh đi toàn ke với đá…', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure rem, tempora quia culpa praesentium totam id adipisci. Itaque voluptatibus aspernatur vitae quisquam cumque? Quaerat fugit tempora recusandae illo quod aspernatur impedit cumque exercitationem vel! Doloribus nemo suscipit eius deserunt eveniet hic, tempore odit fugiat soluta itaque, sequi et voluptatem! Consequuntur, autem deleniti commodi placeat sed numquam, illo harum unde dolore officia laborum accusamus animi libero? Blanditiis ratione esse nulla ut aperiam quasi non distinctio animi minus qui ducimus sit odit nobis officia, facere voluptates! Minima ut animi facere enim modi autem aliquid, numquam amet sapiente iure suscipit quisquam delectus tempore. Fuga, quae, consequuntur nam aliquid est fugiat nulla laudantium veritatis quos enim quibusdam impedit porro doloribus dolorum libero, dignissimos atque. Placeat ipsa saepe dolore. Repellat, ea. Doloremque repellendus facilis rem aliquam suscipit iusto exercitationem, magnam hic. Officia dolores corporis dolore nam magni quia magnam at dicta cumque accusantium eos assumenda expedita, ducimus voluptates porro est dignissimos! Saepe facere fugiat atque, numquam tempora eius? Ut ipsum beatae porro odio aspernatur, iure voluptatum. Libero adipisci temporibus eius dolore recusandae, veniam obcaecati soluta fuga, animi totam beatae quisquam modi officiis magnam quibusdam nostrum. Laborum porro quibusdam deserunt nesciunt perspiciatis totam libero cupiditate esse.', 'https://img.youtube.com/vi/ZyYmIiYEK7I/maxresdefault.jpg', 1500, 'https://www.youtube.com/watch?v=ZyYmIiYEK7I', 6, 1, '2024-11-03 09:10:56', '2024-11-03 09:10:56');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;