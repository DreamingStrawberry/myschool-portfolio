-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `cla` int(11) DEFAULT NULL,
  `readnum` int(11) DEFAULT 0,
  `ofname` varchar(100) DEFAULT NULL,
  `sfname` varchar(100) DEFAULT NULL,
  `userid` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `community_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `teacher` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'이번주에 특별 감사가 실시될 예정입니다.','하하하\r\n\r\n모두 열심히 준비하세요','2025-03-31',1,0,NULL,NULL,'admin'),(2,'오늘은 즐거운 월요일입니다.','열심히 공부합시다\r\n\r\n하하하','2025-03-31',2,1,NULL,NULL,'admin'),(3,'MyUtil파일을 올립니다.','참고하세요\r\n\r\n하하하','2025-03-31',3,4,'MyUtil.java','MyUtil.java','admin'),(4,'홍길동이 알려드립니다.','오늘은 월요일입니다.\r\n\r\n하ㅏㅎ하','2025-03-31',2,1,NULL,NULL,'hong'),(5,'홍길동이가 좋아하는 사진입니다.','이쁘죠\r\n\r\n하ㅏ핳','2025-03-31',3,6,'b4.gif','b4.gif','hong'),(6,'배트맨이 알려드립니다.','오늘 점심은 돈까스입니다.\r\n\r\n하하하','2025-03-31',2,0,NULL,NULL,'batman'),(7,'배트맨은 이 사진을 좋아합니다.','천천히!!\r\n\r\n공부도 천천히 열심히!!','2025-03-31',3,6,'b1.jpg','b1.jpg','batman'),(8,'내일은 지각하지 말고 전부 오세요','하하하\r\n\r\n호호호','2025-03-31',1,5,NULL,NULL,'hong'),(9,'putty파일입니다.','리눅스서버에 텔넷으로 접속하는 프로그램입니다','2025-03-31',3,5,'PuTTY_V0.83.msi','PuTTY_V0.83.msi','hong'),(10,'점심 먹고 나니 졸려요','그래도 열심히\r\n\r\n합시다','2025-03-31',2,4,NULL,NULL,'admin'),(11,'날씨가 봄이 되네요!!  ','하하하\r\n \r\n호호호\r\n\r\n ','2025-03-31',2,5,NULL,NULL,'batman'),(12,'aaa','bbb',NULL,NULL,0,NULL,NULL,'hong'),(15,'오늘은 화요일입니다.','ㅎㅎㅎ','2025-04-01',3,2,'b1.jpg','b11743468308710.jpg','hong');
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imsi`
--

DROP TABLE IF EXISTS `imsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imsi` (
  `name` char(10) DEFAULT NULL,
  `juso` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imsi`
--

LOCK TABLES `imsi` WRITE;
/*!40000 ALTER TABLE `imsi` DISABLE KEYS */;
INSERT INTO `imsi` VALUES ('뽀로로','남극');
/*!40000 ALTER TABLE `imsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(10) NOT NULL,
  `name` char(10) NOT NULL,
  `state` int(11) DEFAULT 0,
  `sung` char(2) DEFAULT NULL CHECK (`sung` in ('남자','여자')),
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'hong','홍길동',1,'남자'),(2,'batman','배트맨',1,'남자'),(3,'pororo','뽀로로',0,'남자'),(4,'wonder','원더우먼',0,'여자');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memo`
--

DROP TABLE IF EXISTS `memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  `seUserid` char(10) DEFAULT NULL,
  `reUserid` char(10) DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  `ofname` varchar(255) DEFAULT NULL,
  `sfname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seUserid` (`seUserid`),
  KEY `reUserid` (`reUserid`),
  CONSTRAINT `memo_ibfk_1` FOREIGN KEY (`seUserid`) REFERENCES `teacher` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `memo_ibfk_2` FOREIGN KEY (`reUserid`) REFERENCES `teacher` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memo`
--

LOCK TABLES `memo` WRITE;
/*!40000 ALTER TABLE `memo` DISABLE KEYS */;
INSERT INTO `memo` VALUES (1,'34','43',NULL,'2025-04-02 14:11:50','hong','admin',1,NULL,NULL),(2,'123123','12312312312',NULL,'2025-04-02 14:22:13','admin','admin',1,NULL,NULL),(3,'asdf','adsf',NULL,'2025-04-02 14:40:51','hong','admin',0,'backup.sql','backup.sql'),(4,'312312','23213',NULL,'2025-04-02 14:41:21','hong','hong',1,NULL,NULL);
/*!40000 ALTER TABLE `memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ban` int(11) DEFAULT NULL,
  `bunho` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `birth` varchar(50) DEFAULT NULL,
  `delstate` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,1,1,'나그네','01012341234','2025-1-1',0),(2,1,2,'배트맨','01012344321','2025-3-4',0),(3,1,3,'홍길동','01012312344','2025-1-1',0);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sungjuk`
--

DROP TABLE IF EXISTS `sungjuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sungjuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kor` int(11) DEFAULT NULL,
  `eng` int(11) DEFAULT NULL,
  `mat` int(11) DEFAULT NULL,
  `sci` int(11) DEFAULT NULL,
  `mus` int(11) DEFAULT NULL,
  `ban` int(11) DEFAULT NULL,
  `bunho` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `tot` int(11) DEFAULT 0,
  `avg` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sungjuk`
--

LOCK TABLES `sungjuk` WRITE;
/*!40000 ALTER TABLE `sungjuk` DISABLE KEYS */;
INSERT INTO `sungjuk` VALUES (1,30,40,50,20,30,1,1,'나그네',0,0),(2,80,70,60,50,13,1,2,'배트맨',0,0);
/*!40000 ALTER TABLE `sungjuk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `ban` int(11) DEFAULT NULL,
  `userid` char(10) NOT NULL,
  `pwd` char(10) DEFAULT NULL,
  `name` char(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `delstate` int(11) DEFAULT 0,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,100,0,'admin','1234','관리자',NULL,NULL,'2025-03-31',0),(3,50,2,'batman','1234','배트맨',NULL,NULL,'2025-03-31',0),(5,100,1,'channy','1234','차니','channy@test.com','01012312344','2025-04-04',0),(7,100,1,'channy1','1234','차니','channy@test.com','01012341234','2025-04-04',0),(2,80,1,'hong','1234','홍길동',NULL,NULL,'2025-03-31',0),(4,50,3,'pororo','1234','뽀로로','pororo@naver.com','010-1234-1234','2025-04-01',0);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-08  9:34:42
