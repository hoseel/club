-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (arm64)
--
-- Host: localhost    Database: club
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code` (
  `num` int NOT NULL AUTO_INCREMENT,
  `disc` varchar(5) DEFAULT NULL,
  `code` varchar(7) DEFAULT NULL,
  `assort` varchar(20) DEFAULT NULL,
  `etc` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES (1,'A','A0001','등산',NULL),(2,'A','A0002','골프',NULL),(3,'A','A0003','볼링',NULL),(4,'A','A0004','자전거',NULL),(5,'A','A0005','봉사활동',NULL),(7,'B','B0001','정기회비',NULL),(8,'B','B0002','찬조금',NULL),(9,'B','B0003','기부금',NULL),(10,'B','B0004','기타',NULL),(11,'C','C0001','교통비',NULL),(12,'C','C0002','식비',NULL),(13,'C','C0003','운영비',NULL),(14,'C','C0004','게임비',NULL),(15,'C','C0005','기타',NULL),(16,'D','D0001','회사원',NULL),(17,'D','D0002','연구전문직',NULL),(18,'D','D0003','교수학생',NULL),(19,'D','D0004','일반자영업',NULL),(20,'D','D0005','언론예술인',NULL),(21,'D','D0006','농축산업',NULL),(22,'D','D0007','기타',NULL),(23,'E','E0001','현금',NULL),(24,'F','F0001','비자카드',NULL),(25,'F','F0002','국민카드',NULL),(26,'F','F0003','삼성카드',NULL),(27,'F','F0004','신한카드',NULL),(28,'F','F0005','현대카드',NULL),(29,'G','G0001','전북은행',NULL),(30,'G','G0002','농협은행',NULL),(31,'G','G0003','신한은행',NULL),(32,'G','G0004','우리은행',NULL),(33,'G','G0005','기업은행',NULL),(34,'','','수입','B0000'),(35,'','','지출','C0000');
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dues`
--

DROP TABLE IF EXISTS `dues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dues` (
  `num` int NOT NULL AUTO_INCREMENT,
  `grnum` varchar(10) NOT NULL DEFAULT '',
  `id` varchar(20) NOT NULL DEFAULT '',
  `du01` int DEFAULT '0',
  `du02` int DEFAULT '0',
  `du03` int DEFAULT '0',
  `du04` int DEFAULT '0',
  `du05` int DEFAULT '0',
  `dutot` int DEFAULT '0',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dues`
--

LOCK TABLES `dues` WRITE;
/*!40000 ALTER TABLE `dues` DISABLE KEYS */;
INSERT INTO `dues` VALUES (1,'A0001-01','admin',10000,10000,10000,10000,10000,50000),(2,'A0001-01','gradmin',10000,10000,10000,10000,10000,50000),(3,'A0001-01','user01',0,10000,0,10000,10000,30000),(4,'A0002-01','golflove',10000,10000,10000,10000,10000,0),(5,'A0002-01','user02',10000,0,10000,0,10000,0),(6,'A0002-01','user04',0,0,0,0,0,0),(7,'A0001-02','gradmin2',10000,10000,10000,10000,10000,0),(8,'A0001-02','user03',10000,0,0,10000,0,0),(9,'A0001-02','user05',0,10000,10000,0,10000,0);
/*!40000 ALTER TABLE `dues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupp`
--

DROP TABLE IF EXISTS `groupp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupp` (
  `num` int NOT NULL AUTO_INCREMENT,
  `code` varchar(7) NOT NULL DEFAULT '',
  `grnum` varchar(10) DEFAULT NULL,
  `grname` varchar(20) DEFAULT NULL,
  `grplace` varchar(10) DEFAULT NULL,
  `gradmid` varchar(15) DEFAULT NULL,
  `gradmname` varchar(20) DEFAULT NULL,
  `gradmtel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupp`
--

LOCK TABLES `groupp` WRITE;
/*!40000 ALTER TABLE `groupp` DISABLE KEYS */;
INSERT INTO `groupp` VALUES (1,'A0001','A0001-01','한라산등반','한라산','gradmin','그룹장','010-1111-1111'),(2,'A0001','A0001-02','월출산등산','월출산','gradmin2','산조아','010-4444-4444'),(5,'A0002','A0002-01','골프사랑','제주도','golflove','공사랑','010-4444-5555');
/*!40000 ALTER TABLE `groupp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list` (
  `num` int NOT NULL AUTO_INCREMENT,
  `grnum` varchar(10) NOT NULL DEFAULT '',
  `freq` varchar(10) NOT NULL DEFAULT '',
  `id` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(20) DEFAULT '',
  `tel` varchar(15) DEFAULT '',
  `parti` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
INSERT INTO `list` VALUES (1,'A0001-01','001','admin','관리자','010-0000-0011','참석'),(2,'A0001-01','001','gradmin','그룹장','010-1111-1111','참석'),(3,'A0001-01','001','user01','김등산','010-4444-5555','미참석'),(4,'A0002-01','001','golflove','공사랑','010-4444-6366','참석'),(5,'A0002-01','001','user02','김회원','010-8888-9999','참석'),(6,'A0002-01','001','user04','공공일','010-0001-1110','미참석'),(7,'A0001-02','001','gradmin2','산조아','010-4444-4444','참석'),(8,'A0001-02','001','user03','등산해','010-5555-6666','참석'),(9,'A0001-02','001','user05','조아산','010-4444-4545','참석'),(10,'A0001-01','002','admin','관리자','010-0000-0011','미참석'),(11,'A0001-01','002','gradmin','그룹장','010-1111-1111','참석'),(12,'A0001-01','002','user01','김등산','010-4444-5555','참석');
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meet`
--

DROP TABLE IF EXISTS `meet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meet` (
  `num` int NOT NULL AUTO_INCREMENT,
  `id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'grnum으로 봐주삼',
  `freq` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `s_code` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'S0000',
  `date` date DEFAULT '2022-01-01',
  `place` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `note` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meet`
--

LOCK TABLES `meet` WRITE;
/*!40000 ALTER TABLE `meet` DISABLE KEYS */;
INSERT INTO `meet` VALUES (1,'admin','A0001-01','001','S1001','2022-11-17','한라산 입구',NULL),(2,'golflove','A0002-01','001','S2002','2022-11-19','제주도',NULL),(3,'gradmin','A0001-02','001','S1002','2022-11-15','지리산입구','단체버스 대절'),(4,'admin','A0001-01','002','S1003','2022-11-28','전남 영암','7시까지 집합');
/*!40000 ALTER TABLE `meet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `num` int unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(15) NOT NULL DEFAULT '',
  `pw` varchar(15) NOT NULL DEFAULT '',
  `memship` varchar(10) DEFAULT 'basic' COMMENT '권한',
  `appro` varchar(10) DEFAULT '미승인' COMMENT '승인여부',
  `code` varchar(7) DEFAULT NULL,
  `grnum` varchar(10) DEFAULT NULL,
  `club` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `birth` varbinary(8) DEFAULT NULL,
  `mail` varchar(25) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `post2` varchar(50) DEFAULT NULL,
  `hobby` varchar(10) DEFAULT NULL,
  `job` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin','0000','admin','승인','A0001','A0001-01','등산','관리자','010-0000-0011','지정안함',_binary '000000','admin@admin.aaa','13494','경기 성남시 분당구 판교역로 235(삼평동)','관리자','11000','회사원'),(2,'gradmin','0000','gradmin','승인','A0001','A0001-01','등산','그룹장','010-1111-1111','지정안함',_binary '111111','group@admin.aa','13494','경기 성남시 분당구 판교역로 235(삼평동)','모임관리자','10000','회사원'),(4,'user01','0000','basic','승인','A0001','A0001-01','등산','김등산','010-4444-5555','남',_binary '840506','san@bb.vv','12432','경기 가평군 조종면 현등사길 20','산사랑','01001','일반자영업'),(5,'golflove','0000','gradmin','승인','A0002','A0002-01','골프','공사랑','010-4444-6366','남',_binary '860418','golf@love.bb','12423','경기 가평군 가평읍 호반로 2551','골프장','00001','언론예술인'),(6,'user02','0000','basic','승인','A0002','A0002-01','골프','김회원','010-8888-9999','여',_binary '910506','user@bb.vv','01151','서울 강북구 오현로 117(번동)','골프클럽','00110','교수학생'),(7,'gradmin2','0000','gradmin','승인','A0001','A0001-02','등산','산조아','010-4444-4444','여',_binary '050505','sanlove@bb.vv','63607','제주특별자치도 서귀포시 남원읍 하례광장로 25','펜션','00011','일반자영업'),(8,'user03','0000','basic','승인','A0001','A0001-02','등산','등산해','010-5555-6666','남',_binary '840603','hike@bb.vv','01063','서울 강북구 도봉로 356(번동)','센터','01000','농축산업'),(9,'user04','0000','basic','승인','A0002','A0002-01','골프','공공일','010-0001-1110','지정안함',_binary '001110','001@bb.vv','53256','경남 거제시 거제중앙로 1849(고현동)','공공청사','00100','회사원'),(10,'user05','0000','basic','미승인',NULL,'A0001-02','등산','조아산','010-4444-4545','여',_binary '940504','sanjoa@bb.vv','50045','경남 함양군 함양읍 용평중앙길 2-1','등산코너','01000','언론예술인');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentt`
--

DROP TABLE IF EXISTS `paymentt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentt` (
  `num` int unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(15) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `inorex` varchar(10) DEFAULT NULL,
  `c_inco` varchar(25) DEFAULT NULL,
  `c_expe` varchar(25) DEFAULT NULL,
  `cash` varchar(25) DEFAULT NULL,
  `card` varchar(25) DEFAULT NULL,
  `bank` varchar(25) DEFAULT NULL,
  `expe_list` varchar(25) DEFAULT NULL,
  `inco` int DEFAULT NULL,
  `expe` int DEFAULT NULL,
  `balan` int DEFAULT NULL,
  `note` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentt`
--

LOCK TABLES `paymentt` WRITE;
/*!40000 ALTER TABLE `paymentt` DISABLE KEYS */;
INSERT INTO `paymentt` VALUES (1,'admin','2022-11-23','수입','정기회비','-','현금','-','전북은행','-',100000,0,100000,'null'),(2,'gradmin','2022-11-23','수입','정기회비','-','현금','-','농협은행',NULL,100000,0,200000,NULL),(3,'user01','2022-11-23','수입','정기회비','-','현금','-','신한은행',NULL,100000,0,300000,NULL),(4,'admin','2022-11-23','지출','-','운영비','-','비자카드','기업은행','공과금납부',0,100000,200000,'null'),(5,'gradmin','2022-11-23','지출','-','교통비','-','삼성카드','우리은행','한라산 왕복 버스대관',0,100000,100000,'null'),(7,'admin','2022-11-25','지출','-','식비','-','국민카드','농협은행','돼지식당',0,20000,80000,NULL);
/*!40000 ALTER TABLE `paymentt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sight`
--

DROP TABLE IF EXISTS `sight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sight` (
  `num` int NOT NULL AUTO_INCREMENT,
  `club` varchar(10) DEFAULT NULL,
  `id` varchar(15) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sight` varchar(20) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `note` varchar(40) DEFAULT NULL,
  `s_code` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sight`
--

LOCK TABLES `sight` WRITE;
/*!40000 ALTER TABLE `sight` DISABLE KEYS */;
INSERT INTO `sight` VALUES (1,'등산','admin','관리자','한라산','제주 서귀포시 토평동 산15-1','높이 1,950m 남한에서 가장 높은 산','S1001'),(2,'등산','admin','관리자','월출산','전라남도 영암군 강진군','\'달이 뜨는 산\'이라는 의미','S1002'),(3,'등산','admin','관리자','지리산','경남 전남 전북','1967년 최초의 대한민국의 국립공원','S1003'),(4,'골프','admin','관리자','시네콕힐스','미국 뉴욕','최초 골프 클럽 본거지','S2001'),(5,'골프','admin','관리자','나인브릿지','제주특별자치도 서귀포시 안덕면 광평로 34-156','국내 유일의 세계 100대 코스','S2002');
/*!40000 ALTER TABLE `sight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'club'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-03 13:43:57
