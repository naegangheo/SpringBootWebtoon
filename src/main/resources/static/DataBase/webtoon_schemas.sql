-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: webtooon
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminid` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('scott','1234','홍길동','010-1234-5678','scott@abc.com');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `userid` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `zip_num` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('hong1','1234','hong1','M','hong1@abc.com','010-1111-1111',NULL,NULL,NULL,NULL),('hong10','1234','hong10','F','hong10@abc.com','010-1111-1120',NULL,NULL,NULL,NULL),('hong2','1234','hong2','F','hong2@abc.com','010-1111-1112',NULL,NULL,NULL,NULL),('hong3','1234','hong3','M','hong3@abc.com','010-1111-1113',NULL,NULL,NULL,NULL),('hong4','1234','hong4','F','hong4@abc.com','010-1111-1114',NULL,NULL,NULL,NULL),('hong5','1234','hong5','M','hong5@abc.com','010-1111-1115',NULL,NULL,NULL,NULL),('hong6','1234','hong6','F','hong6@abc.com','010-1111-1116',NULL,NULL,NULL,NULL),('hong7','1234','hong7','M','hong7@abc.com','010-1111-1117',NULL,NULL,NULL,NULL),('hong8','1234','hong8','F','hong8@abc.com','010-1111-1118',NULL,NULL,NULL,NULL),('hong9','1234','hong9','M','hong9@abc.com','010-1111-1119',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `nseq` int NOT NULL AUTO_INCREMENT,
  `adminid` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nseq`),
  KEY `fk7_idx` (`adminid`),
  CONSTRAINT `fk7` FOREIGN KEY (`adminid`) REFERENCES `admin` (`adminid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'scott','1234','noticeSubject1','noteceContent1','2023-10-12 00:00:00'),(2,'scott','1234','noticeSubject2','noteceContent2','2023-10-13 00:00:00'),(3,'scott','1234','noticeSubject3','noteceContent3','2023-10-15 00:00:00'),(4,'scott','1234','noticeSubject4','noteceContent4','2023-12-15 00:00:00'),(5,'scott','1234','noticeSubject5','noteceContent5','2024-03-01 00:00:00'),(6,'scott','1234','noticeSubject6','noteceContent6','2024-05-01 00:00:00'),(7,'scott','1234','noticeSubject7','noteceContent7','2024-07-01 00:00:00'),(8,'scott','1234','noticeSubject8','noteceContent8','2024-07-06 00:00:00'),(9,'scott','1234','noticeSubject9','noteceContent9','2024-07-07 00:00:00'),(10,'scott','1234','noticeSubject10','noteceContent10','2024-07-09 00:00:00'),(11,'scott','1234','noticeSubject11','noteceContent11','2024-08-09 00:00:00'),(12,'scott','1234','noticeSubject12','noteceContent12','2024-10-09 00:00:00'),(13,'scott','1234','noticeSubject13','noteceContent13','2024-12-09 00:00:00');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qseq` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`qseq`),
  KEY `fk4_idx` (`userid`),
  CONSTRAINT `fk4` FOREIGN KEY (`userid`) REFERENCES `member` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'hong1','1234','subject1','content1','2023-10-12 00:00:00'),(2,'hong2','1234','subject2','content2','2023-12-10 00:00:00'),(3,'hong3','1234','subject3','content3','2024-01-10 00:00:00'),(4,'hong4','1234','subject4','content4','2024-03-10 00:00:00'),(5,'hong5','1234','subject5','content5','2024-05-10 00:00:00'),(6,'hong6','1234','subject6','content6','2024-10-10 00:00:00'),(7,'hong7','1234','subject7','content7','2023-10-12 00:00:00'),(8,'hong8','1234','subject8','content8','2023-12-10 00:00:00'),(9,'hong9','1234','subject9','content9','2024-01-10 00:00:00'),(10,'hong10','1234','subject10','content10','2024-03-10 00:00:00'),(11,'hong1','1234','subject11','content11','2024-05-10 00:00:00'),(12,'hong2','1234','subject12','content12','2024-10-10 00:00:00'),(13,'hong3','1234','subject13','content13','2023-10-12 00:00:00'),(14,'hong4','1234','subject14','content14','2023-12-10 00:00:00'),(15,'hong5','1234','subject15','content15','2024-01-10 00:00:00'),(16,'hong6','1234','subject16','content16','2024-03-10 00:00:00'),(17,'hong7','1234','subject17','content17','2024-05-10 00:00:00'),(18,'hong8','1234','subject18','content18','2024-10-10 00:00:00'),(19,'hong9','1234','subject19','content19','2023-10-12 00:00:00'),(20,'hong10','1234','subject20','content20','2023-12-10 00:00:00'),(21,'hong1','1234','subject21','content21','2024-01-10 00:00:00'),(22,'hong2','1234','subject22','content22','2024-03-10 00:00:00'),(23,'hong3','1234','subject23','content23','2024-05-10 00:00:00'),(24,'hong4','1234','subject24','content24','2024-10-10 00:00:00'),(25,'hong5','1234','subject25','content25','2023-10-12 00:00:00'),(26,'hong6','1234','subject26','content26','2023-12-10 00:00:00'),(27,'hong7','1234','subject27','content27','2024-01-10 00:00:00'),(28,'hong8','1234','subject28','content28','2024-03-10 00:00:00'),(29,'hong9','1234','subject29','content29','2024-05-10 00:00:00'),(30,'hong10','1234','subject30','content30','2024-10-10 00:00:00'),(31,'hong1','1234','subject31','content31','2023-10-12 00:00:00'),(32,'hong2','1234','subject32','content32','2023-12-10 00:00:00'),(33,'hong3','1234','subject33','content33','2024-01-10 00:00:00'),(34,'hong4','1234','subject34','content34','2024-03-10 00:00:00'),(35,'hong5','1234','subject35','content35','2024-05-10 00:00:00'),(36,'hong6','1234','subject36','content36','2024-10-10 00:00:00'),(37,'hong7','1234','subject37','content37','2023-10-12 00:00:00'),(38,'hong8','1234','subject38','content38','2023-12-10 00:00:00'),(39,'hong9','1234','subject39','content39','2024-01-10 00:00:00'),(40,'hong10','1234','subject40','content40','2024-03-10 00:00:00');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qreply`
--

DROP TABLE IF EXISTS `qreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qreply` (
  `qrseq` int NOT NULL AUTO_INCREMENT,
  `qseq` int NOT NULL,
  `adminid` varchar(30) NOT NULL,
  `qrcontent` varchar(100) NOT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`qrseq`),
  KEY `fk5_idx` (`adminid`),
  KEY `fk6_idx` (`qseq`),
  CONSTRAINT `fk5` FOREIGN KEY (`adminid`) REFERENCES `admin` (`adminid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk6` FOREIGN KEY (`qseq`) REFERENCES `qna` (`qseq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qreply`
--

LOCK TABLES `qreply` WRITE;
/*!40000 ALTER TABLE `qreply` DISABLE KEYS */;
INSERT INTO `qreply` VALUES (1,1,'scott','qrcontent1','2023-10-12 00:00:00'),(2,5,'scott','qrcontent2','2023-12-10 00:00:00'),(3,3,'scott','qrcontent3','2024-01-10 00:00:00'),(4,2,'scott','qrcontent4','2024-03-10 00:00:00'),(5,3,'scott','qrcontent5','2024-05-10 00:00:00'),(6,5,'scott','qrcontent6','2024-10-10 00:00:00'),(7,6,'scott','qrcontent7','2023-10-12 00:00:00'),(8,8,'scott','qrcontent8','2023-12-10 00:00:00'),(9,5,'scott','qrcontent9','2024-01-10 00:00:00'),(10,7,'scott','qrcontent10','2024-03-10 00:00:00'),(11,9,'scott','qrcontent11','2024-05-10 00:00:00'),(12,10,'scott','qrcontent12','2024-10-10 00:00:00'),(13,7,'scott','qrcontent13','2023-10-12 00:00:00'),(14,5,'scott','qrcontent14','2023-12-10 00:00:00'),(15,2,'scott','qrcontent15','2024-01-10 00:00:00'),(16,3,'scott','qrcontent16','2024-03-10 00:00:00'),(17,1,'scott','qrcontent17','2024-05-10 00:00:00'),(18,1,'scott','qrcontent18','2024-10-10 00:00:00'),(19,3,'scott','qrcontent19','2023-10-12 00:00:00'),(20,5,'scott','qrcontent20','2023-12-10 00:00:00');
/*!40000 ALTER TABLE `qreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `reseq` int NOT NULL AUTO_INCREMENT,
  `wseq` int NOT NULL,
  `userid` varchar(30) NOT NULL,
  `rcontent` varchar(500) NOT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reseq`),
  KEY `fk2_idx` (`userid`),
  KEY `fk3_idx` (`wseq`),
  CONSTRAINT `fk2` FOREIGN KEY (`userid`) REFERENCES `member` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk3` FOREIGN KEY (`wseq`) REFERENCES `webtoon` (`wseq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,1,'hong1','reply1','2023-10-12 00:00:00'),(2,1,'hong2','reply2','2023-12-10 00:00:00'),(3,3,'hong3','reply3','2024-01-10 00:00:00'),(4,4,'hong4','reply4','2024-03-10 00:00:00'),(5,5,'hong5','reply5','2024-05-10 00:00:00'),(6,6,'hong6','reply6','2024-10-10 00:00:00'),(7,3,'hong7','reply7','2023-10-12 00:00:00'),(8,8,'hong8','reply8','2023-12-10 00:00:00'),(9,9,'hong9','reply9','2024-01-10 00:00:00'),(10,10,'hong10','reply10','2024-03-10 00:00:00'),(11,11,'hong1','reply11','2024-05-10 00:00:00'),(12,5,'hong2','reply12','2024-10-10 00:00:00'),(13,13,'hong3','reply13','2023-10-12 00:00:00'),(14,1,'hong4','reply14','2023-12-10 00:00:00'),(15,6,'hong5','reply15','2024-01-10 00:00:00'),(16,16,'hong6','reply16','2024-03-10 00:00:00'),(17,17,'hong7','reply17','2024-05-10 00:00:00'),(18,18,'hong8','reply18','2024-10-10 00:00:00'),(19,19,'hong9','reply19','2023-10-12 00:00:00'),(20,20,'hong10','reply20','2023-12-10 00:00:00'),(21,1,'hong1','reply21','2024-01-10 00:00:00'),(22,22,'hong2','reply22','2024-03-10 00:00:00'),(23,23,'hong3','reply23','2024-05-10 00:00:00'),(24,5,'hong4','reply24','2024-10-10 00:00:00'),(25,34,'hong5','reply25','2023-10-12 00:00:00'),(26,26,'hong6','reply26','2023-12-10 00:00:00'),(27,3,'hong7','reply27','2024-01-10 00:00:00'),(28,28,'hong8','reply28','2024-03-10 00:00:00'),(29,4,'hong9','reply29','2024-05-10 00:00:00'),(30,30,'hong10','reply30','2024-10-10 00:00:00');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webtoon`
--

DROP TABLE IF EXISTS `webtoon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webtoon` (
  `wseq` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `genre` int NOT NULL,
  `content` varchar(1000) NOT NULL,
  `week` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `savefilename` varchar(255) DEFAULT NULL,
  `savefilename2` varchar(255) DEFAULT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  `readcountF` int DEFAULT '0',
  `readcountM` int DEFAULT '0',
  `readcountN` int DEFAULT '0',
  PRIMARY KEY (`wseq`),
  KEY `fk1_idx` (`userid`),
  CONSTRAINT `fk1` FOREIGN KEY (`userid`) REFERENCES `member` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webtoon`
--

LOCK TABLES `webtoon` WRITE;
/*!40000 ALTER TABLE `webtoon` DISABLE KEYS */;
INSERT INTO `webtoon` VALUES (1,'hong1','참교육',6,'무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!',1,'title_img1.jpg','content_img1.png',NULL,NULL,'2023-10-12 00:00:00',10,20,6000),(2,'hong1','부활남',5,'나는 죽으면 3일 만에 부활한다!',2,'title_img2.jpg','content_img2.png',NULL,NULL,'2023-12-10 00:00:00',20,40,5900),(3,'hong1','신석기녀',4,'불로불사 소녀와 시한부 청년의 피튀기는 로맨스',3,'title_img3.jpg','content_img3.png',NULL,NULL,'2024-01-10 00:00:00',30,60,5800),(4,'hong1','하우스키퍼',4,'\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.',4,'title_img4.jpg','content_img4.png',NULL,NULL,'2024-03-10 00:00:00',40,80,5700),(5,'hong1','한림체육관',3,'\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물',5,'title_img5.jpg','content_img5.png',NULL,NULL,'2024-05-10 00:00:00',50,100,5600),(6,'hong1','촉법소년',2,'대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다',6,'title_img6.jpg','content_img6.png',NULL,NULL,'2024-10-10 00:00:00',60,120,5500),(7,'hong2','악의등교',3,'성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.',3,'title_img7.jpg','content_img7.png',NULL,NULL,'2023-10-12 00:00:00',70,140,5400),(8,'hong2','사형 집행관',5,'무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!',4,'title_img8.jpg','content_img8.png',NULL,NULL,'2023-12-10 00:00:00',80,160,5300),(9,'hong2','소년법칙',3,'나는 죽으면 3일 만에 부활한다!',5,'title_img9.jpg','content_img9.png',NULL,NULL,'2024-01-10 00:00:00',90,180,5200),(10,'hong2','돈구멍',6,'불로불사 소녀와 시한부 청년의 피튀기는 로맨스',6,'title_img10.jpg','content_img10.png',NULL,NULL,'2024-03-10 00:00:00',100,200,5100),(11,'hong2','대장전',2,'\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.',7,'title_img11.jpg','content_img11.png',NULL,NULL,'2024-05-10 00:00:00',110,220,5000),(12,'hong3','구룡',3,'세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물',1,'title_img12.jpg','content_img12.png',NULL,NULL,'2023-10-12 00:00:00',120,240,4900),(13,'hong3','하이클래스',5,'대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다',2,'title_img13.jpg','content_img13.png',NULL,NULL,'2023-12-10 00:00:00',130,260,4800),(14,'hong3','구세라',6,'성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.',3,'title_img14.jpg','content_img14.png',NULL,NULL,'2024-01-10 00:00:00',140,280,4700),(15,'hong3','킹메이커',3,'무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!',4,'title_img15.jpg','content_img15.png',NULL,NULL,'2024-03-10 00:00:00',150,300,4600),(16,'hong3','윈드브레이커',2,'나는 죽으면 3일 만에 부활한다!',4,'title_img16.jpg','content_img16.png',NULL,NULL,'2024-05-10 00:00:00',160,320,4500),(17,'hong3','소녀의 세계',4,'불로불사 소녀와 시한부 청년의 피튀기는 로맨스',5,'title_img17.jpg','content_img17.png',NULL,NULL,'2024-10-10 00:00:00',170,340,4400),(18,'hong4','두번째 생일',4,'\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.',6,'title_img18.jpg','content_img18.png',NULL,NULL,'2023-10-12 00:00:00',180,360,4300),(19,'hong4','활이피플',5,'세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물',7,'title_img19.jpg','content_img19.png',NULL,NULL,'2023-12-10 00:00:00',190,380,4200),(20,'hong4','퀘스트 지상주의',6,'대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다',1,'title_img20.jpg','content_img20.png',NULL,NULL,'2024-01-10 00:00:00',200,400,4100),(21,'hong4','절대검감',4,'성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.',3,'title_img21.jpg','content_img21.png',NULL,NULL,'2024-03-10 00:00:00',210,420,4000),(22,'hong4','토마토가 돼라!',3,'무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!',2,'title_img22.jpg','content_img22.png',NULL,NULL,'2024-05-10 00:00:00',220,440,3900),(23,'hong4','별난 식당',2,'나는 죽으면 3일 만에 부활한다!',3,'title_img23.jpg','content_img23.png',NULL,NULL,'2024-10-10 00:00:00',230,460,3800),(24,'hong5','천재 타자가 강속구를 숨김',3,'불로불사 소녀와 시한부 청년의 피튀기는 로맨스',2,'title_img24.jpg','content_img24.png',NULL,NULL,'2023-10-12 00:00:00',240,480,3700),(25,'hong5','우아한 욕망',5,'\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.',1,'title_img25.jpg','content_img25.png',NULL,NULL,'2023-12-10 00:00:00',250,500,3600),(26,'hong5','대신 살쪄주는 여자',6,'\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물',2,'title_img26.jpg','content_img26.png',NULL,NULL,'2024-01-10 00:00:00',260,520,3500),(27,'hong5','망돌의 사생',4,'대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다',3,'title_img27.jpg','content_img27.png',NULL,NULL,'2024-03-10 00:00:00',270,540,3400),(28,'hong5','회귀한 공작가의 막내도련님 암살자',3,'성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.',5,'title_img28.jpg','content_img28.png',NULL,NULL,'2024-05-10 00:00:00',280,560,3300),(29,'hong5','기기괴괴2',2,'무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!',5,'title_img29.jpg','content_img29.png',NULL,NULL,'2024-10-10 00:00:00',290,580,3200),(30,'hong6','기자매',2,'나는 죽으면 3일 만에 부활한다!',3,'title_img30.jpg','content_img30.png',NULL,NULL,'2023-10-12 00:00:00',300,600,3100),(31,'hong6','아포칼립스에 집을 숨김',3,'불로불사 소녀와 시한부 청년의 피튀기는 로맨스',4,'title_img31.jpg','content_img31.png',NULL,NULL,'2023-12-10 00:00:00',310,620,3000),(32,'hong6','잘 헤어지는 방법',4,'\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.',5,'title_img32.jpg','content_img32.png',NULL,NULL,'2024-01-10 00:00:00',320,640,2900),(33,'hong6','무벌전',5,'\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물',2,'title_img33.jpg','content_img33.png',NULL,NULL,'2024-03-10 00:00:00',330,660,2800),(34,'hong6','어느날 갑자기 가슴이커짐',6,'대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다',3,'title_img34.jpg','content_img34.png',NULL,NULL,'2024-05-10 00:00:00',340,680,2700),(35,'hong6','중세 판타지 속 망나니 경비조장',5,'성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.',5,'title_img35.jpg','content_img35.png',NULL,NULL,'2024-10-10 00:00:00',350,700,2600),(36,'hong7','정신차려 전승연',4,'무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!',6,'title_img36.jpg','content_img36.png',NULL,NULL,'2023-10-12 00:00:00',360,720,2500),(37,'hong7','시안부 천재가 살아남는 법',3,'나는 죽으면 3일 만에 부활한다!',2,'title_img37.jpg','content_img37.png',NULL,NULL,'2023-12-10 00:00:00',370,740,2400),(38,'hong7','호붕빵 아저씨',2,'불로불사 소녀와 시한부 청년의 피튀기는 로맨스',1,'title_img38.jpg','content_img38.png',NULL,NULL,'2024-01-10 00:00:00',380,760,2300),(39,'hong7','사천당가',3,'\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.',2,'title_img39.jpg','content_img39.png',NULL,NULL,'2024-03-10 00:00:00',390,780,2200),(40,'hong7','벤타블랙',4,'\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물',4,'title_img40.jpg','content_img40.png',NULL,NULL,'2024-05-10 00:00:00',400,800,2100),(41,'hong7','최악의 세대',5,'대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다',5,'title_img41.jpg','content_img41.png',NULL,NULL,'2024-10-10 00:00:00',410,820,2000),(42,'hong8','무적불패',5,'성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.',6,'title_img42.jpg','content_img42.png',NULL,NULL,'2023-10-12 00:00:00',420,840,1900),(43,'hong8','신의탑',6,'무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!',1,'title_img43.jpg','content_img43.png',NULL,NULL,'2023-12-10 00:00:00',430,860,1800),(44,'hong8','외모지상주의',5,'나는 죽으면 3일 만에 부활한다!',2,'title_img44.jpg','content_img44.png',NULL,NULL,'2024-01-10 00:00:00',440,880,1700),(45,'hong8','별이상샵',4,'불로불사 소녀와 시한부 청년의 피튀기는 로맨스',5,'title_img45.jpg','content_img45.png',NULL,NULL,'2024-03-10 00:00:00',450,900,1600),(46,'hong8','무사만리행',3,'\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.',7,'title_img46.jpg','content_img46.png',NULL,NULL,'2024-05-10 00:00:00',460,920,1500),(47,'hong8','전지적 독자시점',2,'\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물',6,'title_img47.jpg','content_img47.png',NULL,NULL,'2024-10-10 00:00:00',470,940,1400),(48,'hong9','나노마신',3,'대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다',2,'title_img48.jpg','content_img48.png',NULL,NULL,'2023-10-12 00:00:00',480,960,1300),(49,'hong9','독립일기',4,'성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.',1,'title_img49.jpg','content_img49.png',NULL,NULL,'2023-12-10 00:00:00',490,980,1200),(50,'hong9','입학용병',5,'무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!',4,'title_img50.jpg','content_img50.png',NULL,NULL,'2024-01-10 00:00:00',500,1000,1100),(51,'hong9','화산귀환',6,'나는 죽으면 3일 만에 부활한다!',5,'title_img51.jpg','content_img51.png',NULL,NULL,'2024-03-10 00:00:00',510,1020,1000),(52,'hong9','나혼자 만렙 뉴비',5,'불로불사 소녀와 시한부 청년의 피튀기는 로맨스',6,'title_img52.jpg','content_img52.png',NULL,NULL,'2024-05-10 00:00:00',520,1040,900),(53,'hong9','조조코믹스',4,'\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.',7,'title_img53.jpg','content_img53.png',NULL,NULL,'2024-10-10 00:00:00',530,1060,800),(54,'hong10','똑 닮은 딸',3,'\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물',5,'title_img54.jpg','content_img54.png',NULL,NULL,'2023-10-12 00:00:00',540,1080,700),(55,'hong10','김부장',2,'대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다',4,'title_img55.jpg','content_img55.png',NULL,NULL,'2023-12-10 00:00:00',550,1100,600),(56,'hong10','어쩌다보니 천생연분',3,'성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.',6,'title_img56.jpg','content_img56.png',NULL,NULL,'2024-01-10 00:00:00',560,1120,500),(57,'hong10','운명을 보는 회사원',4,'무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!',2,'title_img57.jpg','content_img57.png',NULL,NULL,'2024-03-10 00:00:00',570,1140,400),(58,'hong10','재벌집 막내아들',3,'나는 죽으면 3일 만에 부활한다!',4,'title_img58.jpg','content_img58.png',NULL,NULL,'2024-05-10 00:00:00',580,1160,300),(59,'hong10','휴재일기',6,'불로불사 소녀와 시한부 청년의 피튀기는 로맨스',1,'title_img59.jpg','content_img59.png',NULL,NULL,'2024-10-10 00:00:00',590,1180,200);
/*!40000 ALTER TABLE `webtoon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 16:52:19
