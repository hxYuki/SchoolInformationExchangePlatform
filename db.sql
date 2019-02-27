-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: school_publish
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sp_admini`
--

DROP TABLE IF EXISTS `sp_admini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sp_admini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `arranging` int(11) DEFAULT NULL,
  `workload` int(11) NOT NULL DEFAULT '0',
  `upvote` int(11) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_admini`
--

LOCK TABLES `sp_admini` WRITE;
/*!40000 ALTER TABLE `sp_admini` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_admini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_argument`
--

DROP TABLE IF EXISTS `sp_argument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sp_argument` (
  `id` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `arranged` int(11) NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_argument`
--

LOCK TABLES `sp_argument` WRITE;
/*!40000 ALTER TABLE `sp_argument` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_argument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_images`
--

DROP TABLE IF EXISTS `sp_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sp_images` (
  `id` bigint(20) unsigned NOT NULL,
  `url` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_images`
--

LOCK TABLES `sp_images` WRITE;
/*!40000 ALTER TABLE `sp_images` DISABLE KEYS */;
INSERT INTO `sp_images` VALUES (10,' ',' '),(11,'c9\\a165fba3a7e18e3a9687db549b6c79beed0cdd.jpg','stuCard'),(12,'c9\\a165fba3a7e18e3a9687db549b6c79beed0cdd.jpg','stuCard'),(13,'c9\\a165fba3a7e18e3a9687db549b6c79beed0cdd.jpg','stuCard'),(14,'c9\\a165fba3a7e18e3a9687db549b6c79beed0cdd.jpg','stuCard'),(15,'c9\\a165fba3a7e18e3a9687db549b6c79beed0cdd.jpg','stuCard'),(16,'7c\\8859223aca1402c7b458dfeca60bc6f1050be6.png','stuCard'),(17,'7c\\8859223aca1402c7b458dfeca60bc6f1050be6.png','stuCard'),(18,'7c\\8859223aca1402c7b458dfeca60bc6f1050be6.png','stuCard'),(19,'7c\\8859223aca1402c7b458dfeca60bc6f1050be6.png','stuCard'),(20,'7c\\8859223aca1402c7b458dfeca60bc6f1050be6.png','stuCard'),(21,'7c\\8859223aca1402c7b458dfeca60bc6f1050be6.png','stuCard'),(22,'cf\\f542ade16799ddf6d361f1a49639eebe12d8e5.jpg','stuCard'),(23,'e2\\b4264a6811d14183f2e3995723921bc451850b.jpg','stuCard'),(24,'ae\\d5b5c3a224b629a66baeaa5e53cb756bc8995d.gif','itemPic'),(25,'62\\93656b8b6f19b572050930b700b1d2348f5da7.jpg','itemPic'),(26,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','itemPic'),(27,'5d\\f6c85bf12bcd4f6d5776990f19e78fd269ff19.jpg','itemPic'),(28,'f3\\5359f5dd7cc6d05052da4a758b7c974b995777.jpg','itemPic'),(29,'62\\93656b8b6f19b572050930b700b1d2348f5da7.jpg','itemPic'),(30,'ae\\d5b5c3a224b629a66baeaa5e53cb756bc8995d.gif','itemPic'),(31,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','itemPic'),(32,'f3\\5359f5dd7cc6d05052da4a758b7c974b995777.jpg','itemPic'),(33,'5d\\f6c85bf12bcd4f6d5776990f19e78fd269ff19.jpg','itemPic'),(34,'5d\\f6c85bf12bcd4f6d5776990f19e78fd269ff19.jpg','itemPic'),(35,'f3\\5359f5dd7cc6d05052da4a758b7c974b995777.jpg','itemPic'),(36,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','itemPic'),(37,'f3\\5359f5dd7cc6d05052da4a758b7c974b995777.jpg','itemPic'),(38,'5d\\f6c85bf12bcd4f6d5776990f19e78fd269ff19.jpg','itemPic'),(39,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','itemPic'),(40,'5d\\f6c85bf12bcd4f6d5776990f19e78fd269ff19.jpg','itemPic'),(41,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','itemPic'),(42,'f3\\5359f5dd7cc6d05052da4a758b7c974b995777.jpg','itemPic'),(43,'5d\\f6c85bf12bcd4f6d5776990f19e78fd269ff19.jpg','itemPic'),(44,'f3\\5359f5dd7cc6d05052da4a758b7c974b995777.jpg','itemPic'),(45,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','itemPic'),(46,'f3\\5359f5dd7cc6d05052da4a758b7c974b995777.jpg','itemPic'),(47,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','itemPic'),(48,'f3\\5359f5dd7cc6d05052da4a758b7c974b995777.jpg','itemPic'),(49,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','itemPic'),(51,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','stuCard'),(52,'e2\\b4264a6811d14183f2e3995723921bc451850b.jpg','stuCard'),(53,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','stuCard'),(54,'ae\\d5b5c3a224b629a66baeaa5e53cb756bc8995d.gif','stuCard'),(55,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','stuCard'),(56,'ae\\d5b5c3a224b629a66baeaa5e53cb756bc8995d.gif','stuCard'),(57,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','stuCard'),(58,'ae\\d5b5c3a224b629a66baeaa5e53cb756bc8995d.gif','stuCard'),(59,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','stuCard'),(60,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','stuCard'),(61,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','stuCard'),(62,'62\\93656b8b6f19b572050930b700b1d2348f5da7.jpg','stuCard'),(63,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','stuCard'),(64,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','stuCard'),(65,'ae\\d5b5c3a224b629a66baeaa5e53cb756bc8995d.gif','stuCard'),(66,'31\\66e7d034adb52d01eb6f7705b39238078b6969.jpg','stuCard'),(67,'ae\\d5b5c3a224b629a66baeaa5e53cb756bc8995d.gif','stuCard'),(69,'ae\\d5b5c3a224b629a66baeaa5e53cb756bc8995d.gif','stuCard');
/*!40000 ALTER TABLE `sp_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_item`
--

DROP TABLE IF EXISTS `sp_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sp_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) NOT NULL,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `images` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `location` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '东校区,昌平校区,西校区',
  `tags` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` int(10) unsigned NOT NULL DEFAULT '0',
  `is_outofdate` tinyint(1) NOT NULL DEFAULT '0',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sale',
  `publish_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_item`
--

LOCK TABLES `sp_item` WRITE;
/*!40000 ALTER TABLE `sp_item` DISABLE KEYS */;
INSERT INTO `sp_item` VALUES (1,1000000009,'高等数学（上）','','0','东校区,昌平校区,西校区','旧书,数学,高数','￥10',0,0,0,'sale','2019-02-23 06:25:35'),(2,1000000009,'大学物理（上）','','0','东校区,昌平校区,西校区','旧书,大物,物理','￥10',0,0,0,'sale','2019-02-23 06:25:35'),(3,1000000009,'大学物理实验','','0','东校区,昌平校区,西校区','旧书,物理,物理实验','￥9',0,0,0,'sale','2019-02-23 06:25:35'),(4,1000000009,'收旧报纸','RT','0','东校区,昌平校区,西校区','收购,旧物,旧报纸','',0,0,0,'sale','2019-02-23 06:25:35'),(5,1000000009,'出一双球鞋 全新','AJ 1','0','东校区,昌平校区,西校区','出售,鞋,球鞋','￥500',0,0,0,'sale','2019-02-23 06:25:35'),(6,1000000009,'xxx网吧 车接车送','','0','东校区,昌平校区,西校区','广告,网吧,娱乐','',0,0,0,'sale','2019-02-23 06:25:35'),(7,1000000009,'qweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(8,1000000009,'qweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(9,1000000009,'qweqweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(10,1000000009,'qweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(11,1000000009,'qweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(12,1000000009,'qwrqew','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(13,1000000009,'qweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(14,1000000009,'qweqweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(15,1000000009,'qweqweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qweqwe',0,0,0,'sale','2019-02-23 06:25:35'),(16,1000000009,'qweqweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qweqwe',0,0,0,'sale','2019-02-23 06:25:35'),(17,1000000009,'qweqweqwe','','0','东校区,昌平校区,西校区','数学,复习资料,物理','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(18,1000000009,'qweqweqweqw','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(19,1000000009,'qweqweqweq','','0','东校区,昌平校区,西校区','旧书,高数,数学','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(20,1000000009,'qweqweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(21,1000000009,'qweqweqweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qweq',0,0,0,'sale','2019-02-23 06:25:35'),(22,1000000009,'qweqweqweqwe','','0','东校区,昌平校区,西校区','旧书,数学,复习资料','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(23,1000000009,'qweqweqweqw','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(24,1000000009,'qweqweqweqweqwe','','0','东校区,昌平校区,西校区','旧书,数学,高数','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(25,1000000009,'qweqweqwe','','0','东校区,昌平校区,西校区','物理,票子,大物','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(26,1000000009,'qweqweqwe','','0','东校区,昌平校区,西校区','物理,票子,大物','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(27,1000000009,'qweqweqweqwe','','0','东校区,昌平校区,西校区','票子,大物,物理实验','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(28,1000000009,'qweqwe','','0','东校区,昌平校区,西校区','票子,大物,复习资料','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(29,1000000009,'qweqweqw','','0','东校区,昌平校区,西校区','数学,高数,旧书','qwe',0,0,0,'sale','2019-02-23 06:25:35'),(30,1000000009,'caoni','','0','东校区,昌平校区,西校区','票子,大物,数学','qweasd',0,0,0,'sale','2019-02-23 06:25:35'),(31,1000000009,'qweqweqweqwe','','0','东校区,昌平校区,西校区','数学,旧书,复习资料','qweqwe',0,0,0,'sale','2019-02-23 06:25:35'),(32,1000000009,'装逼培训班招生啦','￥20 每月，带人更有优惠','0','东校区,昌平校区,西校区','培训班,装逼,招生','',0,0,0,'sale','2019-02-23 06:25:35'),(33,1000000009,'test','test','0','东校区,昌平校区,西校区','旧书,数学,高数','',0,0,0,'message','2019-02-23 06:25:35');
/*!40000 ALTER TABLE `sp_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_item_tag`
--

DROP TABLE IF EXISTS `sp_item_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sp_item_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `use` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_item_tag`
--

LOCK TABLES `sp_item_tag` WRITE;
/*!40000 ALTER TABLE `sp_item_tag` DISABLE KEYS */;
INSERT INTO `sp_item_tag` VALUES (1,'旧书',59),(2,'复习资料',13),(3,'票子',6),(4,'数学',36),(5,'高数',32),(6,'大物',6),(7,'物理',5),(8,'物理实验',2),(9,'收购',1),(10,'旧物',1),(11,'旧报纸',1),(12,'出售',1),(13,'鞋',1),(14,'球鞋',1),(15,'广告',1),(16,'网吧',1),(17,'娱乐',1),(18,'培训班',2),(19,'装逼',2),(20,'招生',2);
/*!40000 ALTER TABLE `sp_item_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_system`
--

DROP TABLE IF EXISTS `sp_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sp_system` (
  `img_logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sys_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations` mediumtext COLLATE utf8_unicode_ci,
  `homepage_hotlinks` mediumtext COLLATE utf8_unicode_ci,
  `useless_key` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`useless_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_system`
--

LOCK TABLES `sp_system` WRITE;
/*!40000 ALTER TABLE `sp_system` DISABLE KEYS */;
INSERT INTO `sp_system` VALUES (NULL,'School Infomation Puiblish','东校区,北校区,西校区',NULL,'0');
/*!40000 ALTER TABLE `sp_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_user`
--

DROP TABLE IF EXISTS `sp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sp_user` (
  `user_id` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `user_realname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_nickname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `user_location` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_communication` varchar(90) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_icon` int(11) NOT NULL DEFAULT '0',
  `user_marks` float unsigned NOT NULL DEFAULT '4',
  `user_comments` int(11) NOT NULL DEFAULT '0',
  `user_history` int(11) NOT NULL DEFAULT '0',
  `user_violation` int(11) NOT NULL DEFAULT '0',
  `user_lastip` char(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `user_rename` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_lastlogin` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_note` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `user_stuCard` mediumtext COLLATE utf8_unicode_ci,
  `_pwd_salt` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `user_nickname_UNIQUE` (`user_nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_user`
--

LOCK TABLES `sp_user` WRITE;
/*!40000 ALTER TABLE `sp_user` DISABLE KEYS */;
INSERT INTO `sp_user` VALUES ('10000','asdas','testuser','123321','东校区',NULL,0,4,0,0,0,'0.0.0.0','2019-01-26 09:12:02','2019-01-26 09:12:02',NULL,0,NULL,NULL),('1000000000','qwe','qwe','4021d0626b16cad529449a98d1f2f214630e75a6632cc73e4c6159337cebaab4','北校区',NULL,0,4,0,0,0,'::1','2019-01-27 12:04:30','2019-01-27 12:04:30',NULL,0,'21','WX%ebJqtQl(Mg@1DITbj2S\'-q3-kQF'),('1000000001','qwe','qwer','dbc054275e1ee834f00a695c5fb940589981e2d1b68c25d9ac796cea009711f2','北校区',NULL,0,4,0,0,0,'::1','2019-01-27 12:07:23','2019-01-27 12:07:23',NULL,0,'21','DaM=ybL2T_gL1Qg##)h_\\gG~au->p@'),('1000000002','qwe','qwert','8fa3337145b9a6d15008661b8bf22defc5a129dd4c95ac855c731a5fa3271cf9','北校区',NULL,0,4,0,0,0,'::1','2019-01-27 12:13:01','2019-01-27 12:13:01',NULL,0,'21','z92;\"OKhxK-.LL+;T]\"Zg>;1<qGxs;'),('1000000003','qwe','qwerty','cea72a88200f3e2506b1363414ae511e290462c0671c3a40cfd7b59373bdaa1a','北校区',NULL,0,4,0,0,0,'::1','2019-01-27 12:13:26','2019-01-27 12:13:26',NULL,0,'21','ASS|S5/(R++i<3r_)x.GNl<c4/3C_F'),('1000000009','qwe','qdw','40a61277d06749ae0e135fc7559799d403e5107c483ca6649c473e3d34b89172','北校区',NULL,0,4,0,0,0,'::1','2019-01-28 02:40:23','2019-01-28 02:40:23',NULL,0,'23','XqnW5yrgSbB{1,v-{~jNVc\\n?}F6u2'),('1000000010','qwe','yhx','d3866e349d3e3aec597c2ace9a4759e88a2c198fb1813a791c087a70d98a1191','北校区',NULL,0,4,0,0,0,'::1','2019-01-31 12:21:20','2019-01-31 12:21:20',NULL,0,'','aX~6egvB!DuE!&>BIM=`9Jzrl%,XUS');
/*!40000 ALTER TABLE `sp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_user_comments`
--

DROP TABLE IF EXISTS `sp_user_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sp_user_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `on_id` mediumint(10) unsigned NOT NULL,
  `under_id` int(10) NOT NULL,
  `by_id` mediumint(10) unsigned NOT NULL,
  `by_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mark` float NOT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`on_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_user_comments`
--

LOCK TABLES `sp_user_comments` WRITE;
/*!40000 ALTER TABLE `sp_user_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_user_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_user_history`
--

DROP TABLE IF EXISTS `sp_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sp_user_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `by_id` mediumint(10) unsigned NOT NULL,
  `on_id` mediumint(10) unsigned NOT NULL,
  `on_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`by_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_user_history`
--

LOCK TABLES `sp_user_history` WRITE;
/*!40000 ALTER TABLE `sp_user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_user_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-27 16:48:30
