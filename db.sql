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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_images`
--

LOCK TABLES `sp_images` WRITE;
/*!40000 ALTER TABLE `sp_images` DISABLE KEYS */;
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
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `images` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `tags` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` int(10) unsigned NOT NULL DEFAULT '0',
  `is_outofdate` tinyint(1) NOT NULL DEFAULT '0',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_item`
--

LOCK TABLES `sp_item` WRITE;
/*!40000 ALTER TABLE `sp_item` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_item_tag`
--

LOCK TABLES `sp_item_tag` WRITE;
/*!40000 ALTER TABLE `sp_item_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_item_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_user`
--

DROP TABLE IF EXISTS `sp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sp_user` (
  `user_id` mediumint(10) unsigned NOT NULL,
  `user_realname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_nickname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_location` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_communication` varchar(90) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_icon` int(11) NOT NULL DEFAULT '0',
  `user_marks` float unsigned NOT NULL DEFAULT '4',
  `user_comments` int(11) NOT NULL DEFAULT '0',
  `user_history` int(11) NOT NULL DEFAULT '0',
  `user_violation` int(11) NOT NULL DEFAULT '0',
  `user_lastip` char(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `user_rename` timestamp NOT NULL,
  `user_lastlogin` timestamp NOT NULL,
  `user_note` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
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
  `by_id` mediumint(10) unsigned NOT NULL,
  `by_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mark` float NOT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '1',
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

-- Dump completed on 2019-01-24 11:46:28
