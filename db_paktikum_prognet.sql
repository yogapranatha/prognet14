/*
SQLyog Ultimate v12.5.1 (32 bit)
MySQL - 10.1.36-MariaDB : Database - db_paktikum_prognet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_paktikum_prognet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_paktikum_prognet`;

/*Table structure for table `admin_notifications` */

DROP TABLE IF EXISTS `admin_notifications`;

CREATE TABLE `admin_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `admin_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_notifications` */

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sellers_email_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admins` */

insert  into `admins`(`id`,`username`,`password`,`name`,`profile_image`,`phone`,`remember_token`,`created_at`,`updated_at`) values 
(1,'ularara','$2y$10$2m4C.iJuU13Y1jLDR4BCc.25m15jIT2uil2YgT23fTQ9Hs67pc/.2','ular','fotoadmin\\start xampp.png','123213',NULL,'2020-03-14 17:18:49','2020-03-14 17:18:49'),
(2,'ularara','$2y$10$Z3oPzPSInwvartJgWwnKxesQw0mimufAs2M839ebqcDoDm.BBuDVy','ular','fotoadmin\\start xampp.png','08787878',NULL,'2020-03-15 06:11:11','2020-03-15 06:11:11'),
(3,'yogap','$2y$10$ECkdFYxExmvTC7IL2g1LMuOCM3cWCH8tbfxb3UhNrYgVc9xQ/UUKC','yoga','fotoadmin\\jjj.png','314235',NULL,'2020-03-22 05:34:11','2020-03-22 05:34:11');

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('checkedout','notyet','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `carts` */

/*Table structure for table `couriers` */

DROP TABLE IF EXISTS `couriers`;

CREATE TABLE `couriers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `couriers` */

/*Table structure for table `discounts` */

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned DEFAULT NULL,
  `percentage` int(3) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `discounts` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_02_15_123603_create_admins_table',1),
(4,'2019_02_15_123744_create_sellers_table',1),
(5,'2019_02_15_125445_create_products_table',1),
(6,'2019_02_15_130341_create_product_images_table',1),
(7,'2019_02_15_131114_create_transactions_table',1),
(8,'2019_02_15_131132_create_transaction_details_table',1),
(9,'2019_02_15_132352_create_product_categories_table',1),
(10,'2019_02_15_132701_create_carts_table',1),
(11,'2019_02_15_134220_create_wishlists_table',1),
(12,'2019_02_16_044815_create_rates_table',1),
(13,'2019_02_16_045411_create_product_reviews_table',1),
(14,'2019_02_16_062504_create_qna_products_table',1),
(15,'2019_02_16_063238_create_shopping_voucers_table',1),
(16,'2019_02_16_064643_create_couriers_table',1),
(17,'2019_02_16_102028_create_notifications_table',1),
(18,'2019_02_16_103007_create_seller_notifications_table',1),
(19,'2019_02_16_103024_create_user_notifications_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `product_categories` */

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_categories` */

/*Table structure for table `product_category_details` */

DROP TABLE IF EXISTS `product_category_details`;

CREATE TABLE `product_category_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_category_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_category_details_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product_category_details` */

/*Table structure for table `product_images` */

DROP TABLE IF EXISTS `product_images`;

CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_images` */

/*Table structure for table `product_reviews` */

DROP TABLE IF EXISTS `product_reviews`;

CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rate` int(1) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `rate_id` (`rate`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `product_reviews_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_reviews` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_rate` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

/*Table structure for table `response` */

DROP TABLE IF EXISTS `response`;

CREATE TABLE `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`),
  CONSTRAINT `response_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `response` */

/*Table structure for table `transaction_details` */

DROP TABLE IF EXISTS `transaction_details`;

CREATE TABLE `transaction_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` int(3) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_transaction` (`transaction_id`),
  KEY `id_product` (`product_id`),
  CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transaction_details` */

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timeout` datetime NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regency` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(12,2) NOT NULL,
  `shipping_cost` double(12,2) NOT NULL,
  `sub_total` double(12,2) NOT NULL,
  `user_id` int(20) unsigned NOT NULL,
  `courier_id` int(10) unsigned NOT NULL,
  `proof_of_payment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('unverified','verified','delivered','success','expired','canceled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courier_id` (`courier_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transactions` */

/*Table structure for table `user_notifications` */

DROP TABLE IF EXISTS `user_notifications`;

CREATE TABLE `user_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(11) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `user_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_notifications` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'yoga','ypranathaa@gmail.com','fotouser\\top sesudah xampp.png','aaa',NULL,'$2y$10$kWc0MszW4FmlTNaQgwSGJeNzoPvD.SAMnQBjInZuvk474pXH5tjse',NULL,'2020-03-16 16:49:27','2020-03-16 16:49:27'),
(2,'lala','lala@gmail.com','fotouser\\htop sebelum.png','aaa',NULL,'$2y$10$PSuFOYkViWmDnt.7OFATz.BUb7qVgKDAMQmMNlT.htrCoTen7tckO',NULL,'2020-03-16 17:07:51','2020-03-16 17:07:51'),
(4,'pepe','pepe@gmail.com','fotouser\\htop sebelum.png','aaa',NULL,'$2y$10$5DN8TE7CPa5oWWcgNUzOH.67qtFGXMpJ/CTamOk8U27VaVMaknQr.',NULL,'2020-03-16 17:11:48','2020-03-16 17:11:48'),
(6,'hehe','hehe@gmail.com','fotouser\\top sesudah xampp.png','aaa',NULL,'$2y$10$OJHNzRjrq3fnN.k799cJo.RRvrY8M/mX7Grpx9cTnFRTk300ayEHO',NULL,'2020-03-16 17:14:28','2020-03-16 17:14:28'),
(8,'haha','haha@gmail.com','fotouser\\top sesudah xampp.png','aaa',NULL,'$2y$10$7eE7SFSKUI3iid/pJJyqAezTtG2J8y1YXsHkR.8dNA4ORAEODas5q',NULL,'2020-03-16 17:15:58','2020-03-16 17:15:58'),
(9,'wiwi','wiwi@gmail.com','fotouser\\start xampp.png','aaa',NULL,'$2y$10$w/3J3vNVy21BxaaXE7vJvuNM62eXWuJZL/r/ub3rqYAz/n5LXKio6',NULL,'2020-03-16 17:22:24','2020-03-16 17:22:24'),
(11,'pipi','pipi@gmail.com','fotouser\\start xampp.png','aaa',NULL,'$2y$10$MoHKISRvpMhwa9ccK5nDoe9JCW/9mQFYZLKiHnp66BlV3wiTYuj.W',NULL,'2020-03-16 17:25:13','2020-03-16 17:25:13'),
(12,'hoho','hoho@gmail.com','fotouser\\top sesudah multiple.png','aaa',NULL,'$2y$10$iq5RXbm6Gl.DGaHpYPTbEuhZrkPh4dUYEffVTf1NDJkyHFosm6f5y',NULL,'2020-03-16 17:26:07','2020-03-16 17:26:07'),
(13,'popo','popo@gmail.com','fotouser\\top sesudah multiple.png','aaa',NULL,'$2y$10$Yz0PH7A2JdJKWGG2fDgSPOnOcNOQA5BUYTTiSlO60JMMQjOYocAJS',NULL,'2020-03-16 17:36:11','2020-03-16 17:36:11'),
(15,'papa','papa@gmail.com','fotouser\\top sesudah multiple.png','aaa',NULL,'$2y$10$ffCLrn5l0LptBelQehKrJuVlfOS2Q118cke1yxot2FJ6l851Hq7by',NULL,'2020-03-16 17:41:36','2020-03-16 17:41:36'),
(17,'lolo','lolo@gmail.com','fotouser\\top sesudah multiple.png','aaa',NULL,'$2y$10$A4fog9igk6T5EpMTC9lEYuaLoMV/DUvVjbgXsL1A79xa26viIZlcq',NULL,'2020-03-16 17:44:43','2020-03-16 17:44:43'),
(18,'mama','mama@gmail.com','fotouser\\top sesudah multiple.png','aaa',NULL,'$2y$10$LQDL5oStomN71i/pa8I4hO33rBV0BLREwP6yN3L77H/b6HHVK0U9a',NULL,'2020-03-16 18:00:05','2020-03-16 18:00:05'),
(20,'mimi','mimi@gmail.com','fotouser\\top sesudah multiple.png','aaa',NULL,'$2y$10$MpB98Xzbq6nf6TmPTffeuu.GfBzH.xOWnwQizKzzZ2hnoY/gXKj.u',NULL,'2020-03-16 18:02:33','2020-03-16 18:02:33'),
(21,'momo','momo@gmail.com','fotouser\\top sesudah multiple.png','aaa',NULL,'$2y$10$0Gnsa676kXHebtdzZN2kB.6OnvMQTNZEUQ3mzRq6wOo.O4EwcrArq',NULL,'2020-03-16 18:03:03','2020-03-16 18:03:03'),
(22,'lily','lily@gmail.com','fotouser\\top sesudah multiple.png','aaa',NULL,'$2y$10$HgczWr6lMQFX3Hg5mO2cSORJzgEtRrHFkoMVBCZoY3pIPivJDMdHu',NULL,'2020-03-16 18:05:04','2020-03-16 18:05:04'),
(23,'ular','ula@mamam','fotouser\\top sesudah xampp.png','aaaa',NULL,'$2y$10$Fovzi2N3tya/amd0uT2cJ.lBUkz3SHHjzGEqyN9cYtI.DN2ou7zqi',NULL,'2020-03-16 18:09:27','2020-03-16 18:09:27'),
(25,'gaga','asdsa','fotouser\\jarkom.png','apa',NULL,'$2y$10$sW0qj1PJUeEqvwB5sMoSSu.cNDP5r0jDm2TGtClqbaBY0L3t0jG4S',NULL,'2020-03-16 18:13:36','2020-03-16 18:13:36'),
(27,'yaya','yayaya','fotouser\\jjj.png','yaya',NULL,'$2y$10$YNSNXwHyDp8ao9bBQW3kZOtquJxHKu0owoO8Yy34dfGSQ9oqp7fcS',NULL,'2020-03-16 18:15:03','2020-03-16 18:15:03'),
(29,'yaya','yaya@gmail.com','fotouser\\jarkom.png','yaya',NULL,'$2y$10$pHNL84aU7Tprv1JIhZFK4.OwG0jgOs46Sm.u.VMxKsXAb5yayLyhe',NULL,'2020-03-16 18:18:28','2020-03-16 18:18:28'),
(30,'baba','baba@gmail.com','fotouser\\jarkom.png','baba',NULL,'$2y$10$Ft/lMGwF1E.l2D7lsBxQ4eqnlbTlwEhm.lVzOQrGRrX5Q6oKTEYly',NULL,'2020-03-16 18:21:21','2020-03-16 18:21:21'),
(32,'bibi','bibi@gmail.com','fotouser\\jarkom.png','bibi',NULL,'$2y$10$576Uu4iFS/cBlWvpVC/7gOPeYIF08alPYW5pOSm0tm4ba5eNWKneq',NULL,'2020-03-16 18:22:16','2020-03-16 18:22:16'),
(33,'koko','koko@gmail.com','fotouser\\jarkom.png','apa',NULL,'$2y$10$lOUzjqwJcAS6fWwLf.InweuZZNkbr04rcBFMgiejU2Kddba3s2nK6',NULL,'2020-03-16 18:24:50','2020-03-16 18:24:50'),
(34,'kuku','kuku@gmail.com','fotouser\\Screenshot (3).png','aaa',NULL,'$2y$10$3.j.YArP2FnoPjq1FXsX/uTHpoedkirZAquKFY.rsIXftiFN7guS6',NULL,'2020-03-16 18:27:31','2020-03-16 18:27:31'),
(35,'kaka','kaka@gmail.com','fotouser\\Screenshot (14).png','kaka',NULL,'$2y$10$INOALuHF1Arvk0C5VV5ONO3YNMGEe2DVa3K8xx4hd.od8RXyLOSNy',NULL,'2020-03-16 18:30:45','2020-03-16 18:30:45'),
(36,'jaka','jaka@gmail.com','fotouser\\Screenshot (16).png','pelajar',NULL,'$2y$10$P1hzI1Z9niQsp6roybx3ne3vtIqv.y9n0sQHZDrPAgCL2GNptKgP6',NULL,'2020-03-16 18:34:57','2020-03-16 18:34:57'),
(37,'bebe','bebe@example.com','fotouser\\Screenshot (12).png','123',NULL,'$2y$10$rcnEMGk3IYndk6dPckc/7.7dKsGxTjO6s.w7E3XcRtIW5iW5yvFiC',NULL,'2020-03-16 18:46:10','2020-03-16 18:46:10'),
(38,'cece','cece@example.com','fotouser\\Screenshot (19).png','cece',NULL,'$2y$10$bWfqILdgtKoXMFGwbLQsVOkBbCcZUf/G3N/BavLbKJXvGIFJY4kaC',NULL,'2020-03-16 18:50:50','2020-03-16 18:50:50'),
(39,'Anjing','asu@gmail.com','fotouser\\Screenshot (36).png','apa',NULL,'$2y$10$XGZhok5h8Nqadt8lA14SbeY7nc.LC9Ffwo5Cr6ScEH..fBQ5de88e',NULL,'2020-03-16 19:15:55','2020-03-16 19:15:55'),
(41,'uiui','uiui@gmail.com','fotouser\\Screenshot (59).png','aaa',NULL,'$2y$10$ne7OnqMa.eV/vMTdztNif.pqDvr45fEGMBv9G/UMO.r3G.mXYwJGS',NULL,'2020-03-16 19:26:31','2020-03-16 19:26:31'),
(42,'yoyo','yoyo@gmail.com','fotouser\\Screenshot (17).png','aaa',NULL,'$2y$10$TS8Frj1Ur./RM51y1rkDzOss8iPa14Ka5LuAkOymB8kXQocCQmrri',NULL,'2020-03-16 19:41:49','2020-03-16 19:41:49'),
(44,'juju','juju@gmail.com','fotouser\\Screenshot (16).png','aaa',NULL,'$2y$10$Wy/CmhWM8FWlznkxLwtYu.2rErTV2uf6xeYVs/Yv1m7VHCFHt5aXy',NULL,'2020-03-16 19:43:25','2020-03-16 19:43:25'),
(45,'fufu','fufu@gmail.com','fotouser\\Screenshot (42).png','asd',NULL,'$2y$10$FYyeq02z1mvUkeWq..EXAervhwXB42oZMJ6FG2m783zNILP00wALy',NULL,'2020-03-16 19:44:55','2020-03-16 19:44:55'),
(46,'ular','gaga@gmail.com','fotouser\\Screenshot (10).png','asd',NULL,'$2y$10$XPl/m.O.TAyJdXIq50NV8emVWx1H7mtXlHWoOkcAw6BLA1BzOvnrW',NULL,'2020-03-16 19:45:59','2020-03-16 19:45:59'),
(48,'vivi','vivi@gmail.com','fotouser\\Screenshot (14).png','bubu',NULL,'$2y$10$FEYXj7.sqj1tDmZWHQ6WoeuLOzS6zOuuzoNjZrZBjdL43SNcqkWW2',NULL,'2020-03-16 19:47:22','2020-03-16 19:47:22'),
(49,'lope','lope@gmail.com','fotouser\\Screenshot (13).png','aaa',NULL,'$2y$10$NHHmZ/Isf5sjkOVP1uLb6uIkS2nDzmahcWQHcH7ZJPgk3fvNA0Iz6',NULL,'2020-03-16 20:01:57','2020-03-16 20:01:57'),
(50,'lala','lala','fotouser\\Screenshot (14).png','sasa',NULL,'$2y$10$Z1hgMix8LEqXNpW1wQIDs.M00QgMYZEXV8KUP55npfKDpkwYYtlJ.',NULL,'2020-03-16 20:02:58','2020-03-16 20:02:58'),
(51,'miki','miki@gmail.com','fotouser\\Screenshot (14).png','anjing',NULL,'$2y$10$25IJzhBBfXotdCtghuyfkO1U4HaEL8B5u1ZdXdnvcsbI9AOQiCZmK',NULL,'2020-03-16 20:09:06','2020-03-16 20:09:06'),
(52,'mela','mela@gmail.com','fotouser\\Screenshot (2).png','pepe',NULL,'$2y$10$.9v.pJcCdBlULVTB4GMi2O3kR1btXs19yDwp8YfxwSJXZ6qJT.Eiy',NULL,'2020-03-16 20:10:41','2020-03-16 20:10:41'),
(55,'gaga','gaga1@gmail.com','fotouser\\Screenshot (14).png','apa',NULL,'$2y$10$eeyP349VfyzdpFDALm0rUunqogMFnTYeSjE7HjmTnED0hWniZmEaS',NULL,'2020-03-16 20:13:26','2020-03-16 20:13:26'),
(56,'bodo','bodo@gmail.com','fotouser\\Screenshot (18).png','lengeh',NULL,'$2y$10$jo7Qy6bSEyOsfXLK9pdGGel9q2N9Lyu4592SNqIISxCqBcNBQFDVy',NULL,'2020-03-16 20:14:42','2020-03-16 20:14:42'),
(57,'bubu','bubu@gmail.com','fotouser\\Screenshot (10).png','asu',NULL,'$2y$10$3vHm.9ESuU2jIe5txSea5exmPaC9rERCKCjZ6VZbbMPSUzeEBszES',NULL,'2020-03-16 20:17:35','2020-03-16 20:17:35'),
(58,'sofi','sofi@gmail.com','fotouser\\Screenshot (16).png','aaa','2020-03-17 04:19:26','$2y$10$WkR6EgnwPIDll2Fj/rzEb.wZtuhI9R0PDLyjRZez4..hlHayyRxdm',NULL,'2020-03-16 20:19:12','2020-03-16 20:19:12'),
(59,'beni','bebi@gmail.com','fotouser\\Screenshot (18).png','sayang',NULL,'$2y$10$Gc6mHMkWavXPORAajgRbd.e.0cXMjJD3v6IIlbBWn9Yp3vkDFTVE.',NULL,'2020-03-16 20:27:18','2020-03-16 20:27:18'),
(60,'biji','biji@gmail.com','fotouser\\Screenshot (11).png','aa',NULL,'$2y$10$aCynYvERTBrQoF6i6RIo6.mge4QDN.SgRwyNj1dVbP2rFpiOeNB/2',NULL,'2020-03-16 20:31:31','2020-03-16 20:31:31'),
(61,'gara','gara@gmail.com','fotouser\\Screenshot (19).png','aaa',NULL,'$2y$10$s24Laa8dWbWHkr04k64d.u3DOTNjHb/aCY7Ea0d.eGiIVji0daECO',NULL,'2020-03-16 20:33:48','2020-03-16 20:33:48'),
(62,'sidi','sidi@gmail.com','fotouser\\Screenshot (44).png','mahasiswa','2020-03-17 10:31:43','$2y$10$0sgJV2jn9FMac7iCkYcGaOS3DaNMxtv/iY1SSg51rvEY7Yc4cZ8HG',NULL,'2020-03-17 02:24:30','2020-03-17 02:24:30'),
(63,'ani','ani@gmial.com','fotouser\\jarkom.png','siswa','2020-03-22 14:43:00','$2y$10$PYTN1MCUTKKyCXvFKCV8A.WOeE3m7rDbE9VAcDdiDc3wmcS/Blibe',NULL,'2020-03-22 05:31:30','2020-03-22 05:31:30');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
