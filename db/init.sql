-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: spring_ecomer
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.33-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sso_id` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sso_id` (`sso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (2,'vanhuu','$2a$10$RSiPycV7Joxfhn4EecDczue1/ccNAF50zk6K0aYHBZ2iXVStKrX4K','van','huu','long.huu.100£@gmail.com',1),(3,'huunv','$2a$10$RSiPycV7Joxfhn4EecDczue1/ccNAF50zk6K0aYHBZ2iXVStKrX4K','Long','huu','long.huu.100£@gmail.com',1),(4,'admin','$2a$10$RSiPycV7Joxfhn4EecDczue1/ccNAF50zk6K0aYHBZ2iXVStKrX4K','Admin','Long','long.huu.100£@gmail.com',1);
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_user_profile`
--

DROP TABLE IF EXISTS `app_user_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user_user_profile` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`user_profile_id`),
  KEY `FK_USER_PROFILE` (`user_profile_id`),
  CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_user_profile`
--

LOCK TABLES `app_user_user_profile` WRITE;
/*!40000 ALTER TABLE `app_user_user_profile` DISABLE KEYS */;
INSERT INTO `app_user_user_profile` VALUES (2,1),(4,2);
/*!40000 ALTER TABLE `app_user_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_home`
--

DROP TABLE IF EXISTS `block_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(10) DEFAULT '0',
  `category` int(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `type` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_home`
--

LOCK TABLES `block_home` WRITE;
/*!40000 ALTER TABLE `block_home` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_home_main`
--

DROP TABLE IF EXISTS `block_home_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_home_main` (
  `home_main_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `href` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`home_main_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_home_main`
--

LOCK TABLES `block_home_main` WRITE;
/*!40000 ALTER TABLE `block_home_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_home_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_home_products`
--

DROP TABLE IF EXISTS `block_home_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_home_products` (
  `home_products_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text COMMENT '[{''lable'':''Laptop'', ''product_id'':[1,2,3,5]}]',
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`home_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_home_products`
--

LOCK TABLES `block_home_products` WRITE;
/*!40000 ALTER TABLE `block_home_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_home_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `content` text,
  `icon` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (50,0,'Hàng gia dụng',NULL,'',NULL,NULL,'2020-09-09 05:01:45','2020-09-09 05:02:24',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Bang config thong tin tren web';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'logo','oiroiorieorwwe.png','Day la Logo'),(2,'logo','logo2.png','Logo thu 2'),(3,'phone','02455878987','Hotline web site');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT '0',
  `customer_name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT '',
  `address` varchar(255) NOT NULL,
  `subtotal` int(10) DEFAULT '0',
  `shipping_cost` int(10) DEFAULT '0',
  `cod` int(10) DEFAULT '0',
  `total` int(10) DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,NULL,'Nguyen Van A','0987938490','fireballcac@yahoo.com','Ha noi',4500000,10000,NULL,4510000,'2020-10-06 17:00:00','2020-10-07 11:33:47',NULL),(2,NULL,'Nguyen Van A','0982154450','henrynguyends','klskdls',4500000,10000,NULL,4510000,'2020-10-06 17:00:00','2020-10-07 12:06:29',NULL);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order_detail`
--

DROP TABLE IF EXISTS `customer_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_order_detail` (
  `detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT '0',
  `product_name` varchar(255) NOT NULL,
  `product_id` bigint(20) DEFAULT '0',
  `price` varchar(255) NOT NULL,
  `quality` int(10) DEFAULT '0',
  `total` int(10) DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order_detail`
--

LOCK TABLES `customer_order_detail` WRITE;
/*!40000 ALTER TABLE `customer_order_detail` DISABLE KEYS */;
INSERT INTO `customer_order_detail` VALUES (1,1,'Hot tháng 8',10,'4500000',1,4500000,'2020-10-06 17:00:00','2020-10-07 11:33:47',0),(2,2,'Hot tháng 8',10,'4500000',1,4500000,'2020-10-06 17:00:00','2020-10-07 12:06:29',0);
/*!40000 ALTER TABLE `customer_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `href` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `desc` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `content` longtext,
  `alias` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT '0',
  `status` int(2) DEFAULT NULL,
  `order` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (28,1,'Thông báo lịch nghỉ ngày Giỗ tổ Hùng Vương','Thong bao toan truong',NULL,NULL,NULL,NULL,NULL,1,1,0,'2019-02-19 00:28:09','2019-02-19 00:55:19'),(29,1,'Thông báo lịch nghỉ 30/4 và quốc tế lao động','Thong bao toan truong',NULL,NULL,NULL,NULL,NULL,1,1,0,'2019-02-19 00:28:09','2019-02-19 00:55:39'),(30,1,'Thông báo về việc đóng học phí kỳ 2 lớp 3 tuổi (3A1)','Thong bao toan truong',NULL,NULL,NULL,NULL,NULL,1,1,0,'2019-02-19 00:28:09','2019-02-19 00:55:53');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_category`
--

DROP TABLE IF EXISTS `page_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `level` int(10) unsigned DEFAULT '0',
  `status` int(1) unsigned DEFAULT '1',
  `del_flag` int(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_category`
--

LOCK TABLES `page_category` WRITE;
/*!40000 ALTER TABLE `page_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_image`
--

DROP TABLE IF EXISTS `page_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned DEFAULT '0',
  `file_name` varchar(255) DEFAULT '',
  `is_featured` int(1) unsigned DEFAULT '0',
  `is_slideshow` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `page_id_index` (`page_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_image`
--

LOCK TABLES `page_image` WRITE;
/*!40000 ALTER TABLE `page_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate` int(10) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `status` tinyint(2) DEFAULT '0',
  `create_time` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (14,2,'hanoi','fdfdf','We\'ll never share your email with anyone else.',NULL,NULL,0,NULL),(15,1,'Hot tháng 8','su kiệntháng 8','',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>',1,NULL),(16,1,'Hot tháng 8','fdfdf','',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>',0,NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `price_ref` int(10) DEFAULT '0',
  `price_sale` int(10) DEFAULT '0',
  `content` text,
  `image` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (6,50,'fjkdfd','fdfdsfd','',30000,20000,NULL,NULL,'2020-09-19 17:00:00','2020-09-20 06:07:17',1),(7,50,'fjkdfd','fdfdsfd','',30000,20000,NULL,NULL,'2020-09-19 17:00:00','2020-09-20 06:10:57',1),(8,50,'fjkdfd','fdfdsfd','',30000,20000,NULL,NULL,'2020-09-19 17:00:00','2020-09-20 06:13:10',1),(9,50,'hanoi','su kiệntháng 8','',5000000,4500000,'<p>Noi dung san pham</p>',NULL,'2020-09-22 17:00:00','2020-09-23 12:41:08',1),(10,50,'Hot tháng 8','su kiệntháng 8','Oh, those tricky Java 8 streams with lambdas. They are very powerful, yet the intricacies take a bit to wrap one\'s header around it all.',5000000,4500000,'<p>Noi dung mopi</p>',NULL,'2020-09-26 17:00:00','2020-09-27 13:57:19',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `FK_PRODUCT` (`product_id`),
  KEY `FK_CATEGORY` (`category_id`),
  CONSTRAINT `FK_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_image` (
  `image_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file` varchar(200) DEFAULT '',
  `product_id` bigint(20) NOT NULL,
  `is_president` int(10) DEFAULT '0',
  `is_slider` int(10) DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (51,'780710/b07bc998ea54f700e145930f4d4c1b46.PNG',8,0,0,'2020-09-19 17:00:00'),(52,'780710/bf3fac5322761c0cc0144815a17057ac.png',9,1,1,'2020-09-22 17:00:00'),(53,'780710/06aa952d9f8ee50f4d57f10352162eb0.jpg',10,0,0,'2020-09-26 17:00:00'),(54,'780710/594afa62e42dc87b164753c93c3f8005.jpg',10,0,0,'2020-09-26 17:00:00'),(55,'780710/207e78e304be63b9ef1c62b933804411.jpg',10,1,0,'2020-09-26 17:00:00');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_reviews` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `star` decimal(4,2) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `content` text,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sso_id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(10) unsigned zerofill DEFAULT NULL,
  `create_time` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Bang thong tin user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'t3h','ORURIEURIE839283ID','Java','Web',NULL,NULL,NULL,NULL),(2,'t3hjava','ORURIEURIE839283ID','JPA','Web',NULL,NULL,NULL,NULL),(3,'hibernate','1234567','Hibernate','Web','016474878',NULL,NULL,NULL),(4,'java2','ORURIEURIE839283ID','Hibernate','Web',NULL,NULL,NULL,NULL),(5,'java3','ORURIEURIE839283ID','Hibernate','Web',NULL,NULL,NULL,NULL),(6,'java4','ORURIEURIE839283ID','Hibernate','Web',NULL,NULL,NULL,NULL),(7,'java4','ORURIEURIE839283ID','Hibernate','Web',NULL,NULL,NULL,NULL),(8,'java4','ORURIEURIE839283ID','Hibernate','Web',NULL,NULL,NULL,NULL),(9,'java4','ORURIEURIE839283ID','Hibernate','Web',NULL,NULL,NULL,NULL),(10,'java4','ORURIEURIE839283ID','Hibernate','Web',NULL,NULL,NULL,NULL),(11,'java4','ORURIEURIE839283ID','Hibernate','Web',NULL,NULL,NULL,NULL),(12,'java4','ORURIEURIE839283ID','Hibernate','Web',NULL,NULL,NULL,NULL),(13,'java4','ORURIEURIE839283ID','Hibernate','Web',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permision`
--

DROP TABLE IF EXISTS `user_permision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permision` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) NOT NULL,
  `roles` varchar(255) NOT NULL DEFAULT 'hasRole(''USER'')',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permision`
--

LOCK TABLES `user_permision` WRITE;
/*!40000 ALTER TABLE `user_permision` DISABLE KEYS */;
INSERT INTO `user_permision` VALUES (3,'/admin/**','hasRole(\'ADMIN\')'),(6,'/admin/banner/**','hasRole(\'ADMIN\') or hasRole(\'DBA\')'),(7,'/admin/page/**','hasRole(\'ADMIN\') or hasRole(\'DBA\')'),(8,'/admin/block-home/**','hasRole(\'ADMIN\') or hasRole(\'DBA\')'),(9,'/admin/config/**','hasRole(\'ADMIN\') or hasRole(\'DBA\')'),(10,'/admin/menu/**','any'),(11,'/admin/add-user','hasRole(\'ADMIN\')'),(12,'/admin/delete-user-*','hasRole(\'ADMIN\')'),(13,'/admin/edit-user-*','hasRole(\'ADMIN\')'),(14,'/product/create','hasRole(\'ADMIN\') or hasRole(\'DBA\')');
/*!40000 ALTER TABLE `user_permision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (2,'ROLE_ADMIN'),(3,'ROLE_DBA'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-07 20:06:29
