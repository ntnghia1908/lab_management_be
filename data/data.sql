-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab_management
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset` (
  `price` double DEFAULT NULL,
  `assigned_user_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_modified_date` datetime(6) DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `purchase_date` datetime(6) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `status` enum('AVAILABLE','IN_USE','MAINTENANCE','RETIRED') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKpl8v78k0lsxi66mo36uu0cdyu` (`serial_number`),
  KEY `FK22tanq5xo2p5caoj05jii1svl` (`assigned_user_id`),
  KEY `FKe69ydkxgcthslax73274q33fs` (`category_id`),
  KEY `FKoo11h2f4j12wv0axk6d8u1wy0` (`location_id`),
  CONSTRAINT `FK22tanq5xo2p5caoj05jii1svl` FOREIGN KEY (`assigned_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKe69ydkxgcthslax73274q33fs` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKoo11h2f4j12wv0axk6d8u1wy0` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (234234,1,1,'2024-12-30 20:11:05.547401',1,'2024-12-30 20:11:05.565925',1,'2024-12-30 20:11:05.564285','http://res.cloudinary.com/dsboloq8v/image/upload/v1735564223/a2y9a5vcvlrrjoysvrgk.png','sss','Asus tuf a15','IU-30122024-201035','IN_USE'),(200000,2,2,'2024-12-30 20:12:05.037550',2,'2024-12-30 20:12:05.053529',1,'2024-12-30 20:12:05.051230','http://res.cloudinary.com/dsboloq8v/image/upload/v1735564287/zskwrk9zy4239mxofbgs.png','sss','Aula f75','IU-30122024-201139','IN_USE'),(300000,2,2,'2024-12-30 20:12:30.370837',3,'2024-12-30 20:12:30.383266',1,'2024-12-30 20:12:30.381108','http://res.cloudinary.com/dsboloq8v/image/upload/v1735564313/kgon6oxeee0rhq9j7zaw.png','sss','Aula f87','IU-30122024-201206','IN_USE'),(3487286736,2,2,'2025-01-02 14:19:16.782801',4,'2025-01-02 14:19:16.828678',1,'2025-01-02 14:19:16.820822','http://res.cloudinary.com/dsboloq8v/image/upload/v1735802352/ols6yotwt3ovygog5pwr.png','sjjs','Huntsman V3 Pro TKL','IU-02012025-141827','IN_USE');
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_history`
--

DROP TABLE IF EXISTS `asset_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_history` (
  `asset_id` bigint NOT NULL,
  `change_date` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `new_status` enum('AVAILABLE','IN_USE','MAINTENANCE','RETIRED') DEFAULT NULL,
  `previous_status` enum('AVAILABLE','IN_USE','MAINTENANCE','RETIRED') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK322cepv7u4b2ch4r0g7ciehbj` (`asset_id`),
  KEY `FKal3v5vg4px2lljc044f7hlita` (`user_id`),
  CONSTRAINT `FK322cepv7u4b2ch4r0g7ciehbj` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`),
  CONSTRAINT `FKal3v5vg4px2lljc044f7hlita` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_history`
--

LOCK TABLES `asset_history` WRITE;
/*!40000 ALTER TABLE `asset_history` DISABLE KEYS */;
INSERT INTO `asset_history` VALUES (1,'2024-12-30 20:11:05.578326',1,1,'Assigned to user Nguyen Sang','IN_USE','AVAILABLE'),(2,'2024-12-30 20:12:05.064240',2,2,'Assigned to user Thái Trung Tín','IN_USE','AVAILABLE'),(3,'2024-12-30 20:12:30.393270',3,2,'Assigned to user Thái Trung Tín','IN_USE','AVAILABLE'),(4,'2025-01-02 14:19:16.867530',4,2,'Assigned to user Thái Trung Tín','IN_USE','AVAILABLE');
/*!40000 ALTER TABLE `asset_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_log`
--

DROP TABLE IF EXISTS `attendance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_log`
--

LOCK TABLES `attendance_log` WRITE;
/*!40000 ALTER TABLE `attendance_log` DISABLE KEYS */;
INSERT INTO `attendance_log` VALUES (1,10.877858726886524,106.80155522239467,'2025-02-11 19:17:49.682450',1);
/*!40000 ALTER TABLE `attendance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqir5ob5q1x1w30jk4j3e4p58c` (`user_id`),
  CONSTRAINT `FKqir5ob5q1x1w30jk4j3e4p58c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK46ccwnsi9409t36lurvtyljak` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'hehe','Laptop'),(2,'hihi','Keyboard');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `credits` int NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `instructor_id` bigint NOT NULL,
  `semester_id` bigint DEFAULT NULL,
  `code` varchar(522) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nh` varchar(255) DEFAULT NULL,
  `th` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqk2yq2yk124dhlsilomy36qr9` (`instructor_id`),
  KEY `FKlmyb73uymsfhqh374ndr3n4c0` (`semester_id`),
  CONSTRAINT `FKlmyb73uymsfhqh374ndr3n4c0` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`),
  CONSTRAINT `FKqk2yq2yk124dhlsilomy36qr9` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (4,1,1,1,'IT013IU',NULL,'Algorithms & Data Structures','01','02'),(4,2,1,1,'IT013IU',NULL,'Algorithms & Data Structures','03','01'),(4,3,2,1,'IT017IU',NULL,'Operating Systems','01','01'),(4,4,2,1,'IT017IU',NULL,'Operating Systems','01','02'),(4,5,2,1,'IT017IU',NULL,'Operating Systems','01','03'),(4,6,3,1,'IT069IU',NULL,'Object-Oriented Programming','01','01'),(4,7,3,1,'IT069IU',NULL,'Object-Oriented Programming','01','02'),(4,8,1,1,'IT090IU',NULL,'Object-Oriented Analysis and Design','02','01'),(4,9,1,1,'IT090IU',NULL,'Object-Oriented Analysis and Design','02','02'),(4,10,4,1,'IT103IU',NULL,'Digital Signal Processing','01','01'),(4,11,2,1,'IT116IU',NULL,'C/C++ Programming','01','02'),(3,12,5,1,'MAFE309IU',NULL,'Software Engineering','01','01'),(5,13,6,1,'UFCF7H-15-3',NULL,'Mobile Applications','01','01'),(5,14,7,1,'UFCFRB-15-3',NULL,'Security Management in Practice','01','01'),(5,15,3,1,'UFCFX3-15-3',NULL,'Advanced Topics in Web Development','01','01'),(4,16,3,1,'IT069IU',NULL,'Object-Oriented Programming','02','01'),(4,17,3,1,'IT069IU',NULL,'Object-Oriented Programming','02','02'),(4,18,8,1,'IT089IU',NULL,'Computer Architecture','01','02'),(4,19,9,1,'IT092IU',NULL,'Principles of Programming Languages','01','01'),(4,20,3,1,'IT093IU',NULL,'Web Application Development','01','01'),(4,21,3,1,'IT093IU',NULL,'Web Application Development','01','02'),(4,22,10,1,'IT096IU',NULL,'Net-Centric Programming','01','01'),(4,23,6,1,'IT133IU',NULL,'Mobile Application Development','01','01'),(4,24,11,1,'IT160IU',NULL,'Data Mining','01','01'),(4,25,12,1,'IT161IU',NULL,'Big Data Technology','01','01'),(4,26,12,1,'IT161IU',NULL,'Big Data Technology','01','02'),(4,27,12,1,'IT162IU',NULL,'Machine Learning Platforms','01','01'),(4,28,13,1,'MA024IU',NULL,'Differential Equations','01','01'),(1,29,14,1,'IT106IU',NULL,'Digital System Design Laboratory','02','0'),(4,30,2,1,'IT116IU',NULL,'C/C++ Programming','01','01'),(4,31,2,1,'IT116IU',NULL,'C/C++ Programming','01','03'),(4,32,8,1,'IT149IU',NULL,'Fundamentals of Programming','01','01'),(4,33,8,1,'IT149IU',NULL,'Fundamentals of Programming','01','02'),(4,34,15,1,'IT159IU',NULL,'Artificial Intelligence','01','01'),(4,35,15,1,'IT159IU',NULL,'Artificial Intelligence','01','02'),(4,36,15,1,'IT159IU',NULL,'Artificial Intelligence','02','01'),(4,37,15,1,'IT159IU',NULL,'Artificial Intelligence','02','02'),(3,38,5,1,'MAFE204IU',NULL,'Database Management system','01','0'),(3,39,5,1,'MAFE204IU',NULL,'Database Management system','01','01'),(4,40,5,1,'MAFE312IU',NULL,'Data mining','01','01'),(1,41,16,1,'ENEE1020IU',NULL,'Applied Statistics in Environment Lab','02','0'),(4,42,1,1,'IT013IU',NULL,'Algorithms & Data Structures','02','02'),(4,43,2,1,'IT017IU',NULL,'Operating Systems','02','02'),(4,44,11,1,'IT079IU',NULL,'Principles of Database Management','01','02'),(4,45,11,1,'IT079IU',NULL,'Principles of Database Management','03','01'),(4,46,11,1,'IT079IU',NULL,'Principles of Database Management','03','02'),(4,47,8,1,'IT089IU',NULL,'Computer Architecture','01','01'),(4,48,8,1,'IT089IU',NULL,'Computer Architecture','01','03'),(4,49,17,1,'IT091IU',NULL,'Computer Networks','01','01'),(4,50,6,1,'IT133IU',NULL,'Mobile Application Development','01','02'),(4,51,18,1,'BM064IU',NULL,'Applied Informatics','02','01'),(4,52,18,1,'BM064IU',NULL,'Applied Informatics','02','02'),(1,53,16,1,'ENEE1020IU',NULL,'Applied Statistics in Environment Lab','01','0'),(4,54,1,1,'IT013IU',NULL,'Algorithms & Data Structures','03','02'),(4,55,1,1,'IT013IU',NULL,'Algorithms & Data Structures','03','03'),(4,56,17,1,'IT091IU',NULL,'Computer Networks','01','02'),(4,57,2,1,'IT091IU',NULL,'Computer Networks','02','01'),(4,58,2,1,'IT091IU',NULL,'Computer Networks','03','01'),(4,59,7,1,'IT117IU',NULL,'System and Network Security','01','01'),(4,60,3,2,'IT079IU',NULL,'Principles of Database Management','01','01'),(4,61,9,2,'IT090IU',NULL,'Object-Oriented Analysis and Design','01','03'),(4,62,9,2,'IT090IU',NULL,'Object-Oriented Analysis and Design','01','04'),(4,63,2,2,'IT091IU',NULL,'Computer Networks','02','02'),(4,64,20,2,'IT093IU',NULL,'Web Application Development','02','02'),(4,65,20,2,'IT093IU',NULL,'Web Application Development','02','03'),(4,66,11,2,'IT159IU',NULL,'Artificial Intelligence','03','02'),(5,67,7,2,'UFCFEL-15-3',NULL,'Security Data Analytics and Visualization','01','01'),(5,68,21,2,'UFCFJP-15-3',NULL,'Big Data Analytics','01','01'),(1,69,22,2,'BT338IU',NULL,'Practice in Bioinformatics','01','0'),(1,70,22,2,'BT338IU',NULL,'Practice in Bioinformatics','02','0'),(1,71,23,2,'CHE2035IU',NULL,'Simulation and Optimization Lab','02','0'),(4,72,3,2,'IT079IU',NULL,'Principles of Database Management','01','03'),(4,73,8,2,'IT089IU',NULL,'Computer Architecture','02','02'),(4,74,2,2,'IT091IU',NULL,'Computer Networks','03','02'),(4,75,12,2,'IT094IU',NULL,'Information System Management','01','01'),(4,76,1,2,'IT116IU',NULL,'C/C++ Programming','02','01'),(4,77,1,2,'IT116IU',NULL,'C/C++ Programming','02','02'),(3,78,24,2,'IT011UN',NULL,'Functional Programming','01','0'),(4,79,5,2,'MAFE312IU',NULL,'Data mining','02','01'),(1,80,25,2,'CHE2025IU',NULL,'Computational Chemistry Lab','02','0'),(4,81,1,2,'IT013IU',NULL,'Algorithms & Data Structures','02','01'),(4,82,2,2,'IT017IU',NULL,'Operating Systems','02','01'),(4,83,1,2,'IT090IU',NULL,'Object-Oriented Analysis and Design','01','02'),(1,84,4,2,'IT101IU',NULL,'Electronics Devices Laboratory','01','0'),(4,85,21,2,'IT157IU',NULL,'Deep Learning','01','01'),(4,86,18,2,'BM064IU',NULL,'Applied Informatics','01','01'),(4,87,18,2,'BM064IU',NULL,'Applied Informatics','01','02'),(1,88,25,2,'CHE2025IU',NULL,'Computational Chemistry Lab','01','0'),(1,89,23,2,'CHE2035IU',NULL,'Simulation and Optimization Lab','01','0'),(4,90,1,2,'IT013IU',NULL,'Algorithms & Data Structures','01','01'),(4,91,8,2,'IT089IU',NULL,'Computer Architecture','02','01'),(4,92,1,2,'IT090IU',NULL,'Object-Oriented Analysis and Design','01','01'),(4,93,3,2,'IT093IU',NULL,'Web Application Development','01','03'),(4,94,3,2,'IT093IU',NULL,'Web Application Development','02','01'),(4,95,12,2,'IT094IU',NULL,'Information System Management','01','02'),(4,96,17,2,'IT136IU',NULL,'Regression Analysis','01','01'),(4,97,4,2,'IT158IU',NULL,'UI Design and Evaluation','01','01');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `course_id` bigint DEFAULT NULL,
  `enrollment_date` datetime(6) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint DEFAULT NULL,
  `timetable_id` bigint DEFAULT NULL,
  `status` enum('COMPLETED','DROPPED','ENROLLED','PENDING','WAITLIST') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbhhcqkw1px6yljqg92m0sh2gt` (`course_id`),
  KEY `FKio7fsy3vhvfgv7c0gjk15nyk4` (`student_id`),
  KEY `FKrmlv80pqqaqs78arrucx9t1f4` (`timetable_id`),
  CONSTRAINT `FKbhhcqkw1px6yljqg92m0sh2gt` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FKio7fsy3vhvfgv7c0gjk15nyk4` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKrmlv80pqqaqs78arrucx9t1f4` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `instructor_id` varchar(255) DEFAULT NULL,
  `department` enum('BA','IT') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKcr0g7gh88hv7sfdx9kqbrbiyw` (`user_id`),
  CONSTRAINT `FKpyhf3fgtvlqq630u3697wsmre` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,2,'0585','IT'),(2,3,'0850','IT'),(3,4,'0605','IT'),(4,5,'0808','IT'),(5,6,'IT008','IT'),(6,7,'0701','IT'),(7,8,'0084','IT'),(8,9,'0060','IT'),(9,10,'0880','IT'),(10,11,'0036','IT'),(11,12,'0609','IT'),(12,13,'0879','IT'),(13,14,'0662','IT'),(14,15,'0083','IT'),(15,16,'0724','IT'),(16,17,'0403','IT'),(17,18,'0062','IT'),(18,19,'0749','IT'),(19,20,'0644','IT'),(20,22,'IT017','IT'),(21,23,'0654','IT'),(22,24,'0141','IT'),(23,25,'0565','IT'),(24,26,'0074','IT'),(25,27,'0147','IT');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_time`
--

DROP TABLE IF EXISTS `lesson_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_time` (
  `end_time` time(6) DEFAULT NULL,
  `lesson_number` int NOT NULL,
  `start_time` time(6) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `session` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_time`
--

LOCK TABLES `lesson_time` WRITE;
/*!40000 ALTER TABLE `lesson_time` DISABLE KEYS */;
INSERT INTO `lesson_time` VALUES ('08:50:00.000000',1,'08:00:00.000000',1,'SÁNG'),('09:40:00.000000',2,'08:50:00.000000',2,'SÁNG'),('10:30:00.000000',3,'09:40:00.000000',3,'SÁNG'),('11:25:00.000000',4,'10:35:00.000000',4,'SÁNG'),('12:15:00.000000',5,'11:25:00.000000',5,'SÁNG'),('13:05:00.000000',6,'12:15:00.000000',6,'SÁNG'),('14:05:00.000000',7,'13:15:00.000000',7,'CHIỀU'),('14:55:00.000000',8,'14:05:00.000000',8,'CHIỀU'),('15:45:00.000000',9,'14:55:00.000000',9,'CHIỀU'),('16:40:00.000000',10,'15:50:00.000000',10,'CHIỀU'),('17:30:00.000000',11,'16:40:00.000000',11,'CHIỀU'),('18:15:00.000000',12,'17:30:00.000000',12,'CHIỀU'),('19:00:00.000000',13,'18:15:00.000000',13,'TỐI'),('19:45:00.000000',14,'19:00:00.000000',14,'TỐI'),('20:40:00.000000',15,'19:55:00.000000',15,'TỐI'),('21:25:00.000000',16,'20:40:00.000000',16,'TỐI');
/*!40000 ALTER TABLE `lesson_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsahixf1v7f7xns19cbg12d946` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Dĩ An','IU'),(2,'hcm city','Bình duong');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `course_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4quons73gfm5a1xptbrccu5fe` (`course_id`),
  KEY `FK6313q4colhy85u9nyh7c6hy50` (`user_id`),
  CONSTRAINT `FK4quons73gfm5a1xptbrccu5fe` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK6313q4colhy85u9nyh7c6hy50` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (41,1,'2024-12-30 20:03:05.056513',1,'view timetable by course (Course ID: ENEE1020IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(21,2,'2024-12-30 20:28:14.988289',1,'view timetable by course (Course ID: IT093IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(38,3,'2024-12-30 20:28:18.427643',1,'view timetable by course (Course ID: MAFE204IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(10,4,'2024-12-30 20:28:23.792219',1,'view timetable by course (Course ID: IT103IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(11,5,'2024-12-30 20:28:25.438249',1,'view timetable by course (Course ID: IT116IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(27,6,'2024-12-30 20:28:27.434920',1,'view timetable by course (Course ID: IT162IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(39,7,'2024-12-30 20:28:29.576162',1,'view timetable by course (Course ID: MAFE204IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(45,8,'2024-12-30 20:28:31.963362',1,'view timetable by course (Course ID: IT079IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(40,9,'2024-12-30 20:28:59.157084',1,'view timetable by course (Course ID: MAFE312IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(40,10,'2024-12-30 20:29:01.599123',1,'view timetable by course (Course ID: MAFE312IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(46,11,'2024-12-30 20:29:04.712150',1,'view timetable by course (Course ID: IT079IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(45,12,'2024-12-30 20:29:09.572874',1,'view timetable by course (Course ID: IT079IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(9,13,'2024-12-30 20:30:12.513790',1,'view timetable by course (Course ID: IT090IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(9,14,'2024-12-30 20:30:14.194233',1,'view timetable by course (Course ID: IT090IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(9,15,'2024-12-30 20:30:15.766339',1,'view timetable by course (Course ID: IT090IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(9,16,'2024-12-30 20:30:17.297242',1,'view timetable by course (Course ID: IT090IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(9,17,'2024-12-30 20:30:18.900157',1,'view timetable by course (Course ID: IT090IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(9,18,'2024-12-30 20:30:20.597749',1,'view timetable by course (Course ID: IT090IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(11,19,'2024-12-30 23:36:41.565933',1,'view timetable by course (Course ID: IT116IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(37,20,'2024-12-30 23:36:43.847647',1,'view timetable by course (Course ID: IT159IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(34,21,'2024-12-30 23:36:45.962664',1,'view timetable by course (Course ID: IT159IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(59,22,'2024-12-30 23:36:48.949061',1,'view timetable by course (Course ID: IT117IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(43,23,'2024-12-30 23:36:51.449357',1,'view timetable by course (Course ID: IT017IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(16,24,'2024-12-31 18:25:04.609183',1,'view timetable by course (Course ID: IT069IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(12,25,'2024-12-31 18:35:25.728317',1,'view timetable by course (Course ID: MAFE309IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(14,26,'2024-12-31 18:35:29.490888',1,'view timetable by course (Course ID: UFCFRB-15-3)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(15,27,'2024-12-31 18:35:38.271970',1,'view timetable by course (Course ID: UFCFX3-15-3)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(12,28,'2024-12-31 18:43:16.163736',1,'view timetable by course (Course ID: MAFE309IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(9,29,'2024-12-31 19:00:34.086771',1,'view timetable by course (Course ID: IT090IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(4,30,'2024-12-31 19:53:08.276421',1,'view timetable by course (Course ID: IT017IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(15,31,'2024-12-31 20:44:29.157660',1,'view timetable by course (Course ID: UFCFX3-15-3)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(11,32,'2024-12-31 21:15:28.712335',1,'view timetable by course (Course ID: IT116IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1'),(28,33,'2025-01-01 21:08:35.966326',1,'view timetable by course (Course ID: MA024IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(57,34,'2025-01-02 12:16:34.327970',1,'view timetable by course (Course ID: IT091IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(11,35,'2025-01-02 14:08:35.887677',1,'view timetable by course (Course ID: IT116IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(21,36,'2025-01-02 19:06:27.081797',6,'view timetable by course (Course ID: IT093IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(14,37,'2025-01-02 21:05:23.221599',1,'view timetable by course (Course ID: UFCFRB-15-3)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(8,38,'2025-01-02 21:06:02.577900',1,'view timetable by course (Course ID: IT090IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),(12,39,'2025-02-22 02:51:45.481577',1,'view timetable by course (Course ID: MAFE309IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36'),(56,40,'2025-02-22 02:59:18.616335',1,'view timetable by course (Course ID: IT091IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36'),(62,41,'2025-03-13 00:35:02.958119',1,'view timetable by course (Course ID: IT090IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(69,42,'2025-03-21 19:10:44.708644',1,'view timetable by course (Course ID: BT338IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(92,43,'2025-03-21 19:17:47.125756',1,'view timetable by course (Course ID: IT090IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(97,44,'2025-03-21 20:21:06.470879',1,'view timetable by course (Course ID: IT158IU)','/api/v1/timetable/course-details','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `asset_id` bigint NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_modified_date` datetime(6) DEFAULT NULL,
  `schedule_date` datetime(6) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` enum('CANCELED','COMPLETED','SCHEDULED') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcnqloj1i6co1nlrp42m10tmdk` (`asset_id`),
  CONSTRAINT `FKcnqloj1i6co1nlrp42m10tmdk` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,'2025-01-02 14:09:45.420293',1,NULL,'2025-01-04 14:09:00.000000','hehe','SCHEDULED');
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `last_modified_date` datetime(6) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `status` enum('READ','UNREAD') DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb0yvoep4h4k92ipon31wmdf7e` (`user_id`),
  CONSTRAINT `FKb0yvoep4h4k92ipon31wmdf7e` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (973,'2025-02-26 20:23:15.688937',NULL,'ss','UNREAD','ss',1),(974,'2025-02-26 20:23:15.729063',NULL,'ss','UNREAD','ss',2),(975,'2025-02-26 20:23:15.732631',NULL,'ss','UNREAD','ss',3),(976,'2025-02-26 20:23:15.736419',NULL,'ss','UNREAD','ss',4),(977,'2025-02-26 20:23:15.740182',NULL,'ss','UNREAD','ss',5),(978,'2025-02-26 20:23:15.743487',NULL,'ss','UNREAD','ss',6),(979,'2025-02-26 20:23:15.746684',NULL,'ss','UNREAD','ss',7),(980,'2025-02-26 20:23:15.749928',NULL,'ss','UNREAD','ss',8),(981,'2025-02-26 20:23:15.753146',NULL,'ss','UNREAD','ss',9),(982,'2025-02-26 20:23:15.756350',NULL,'ss','UNREAD','ss',10),(983,'2025-02-26 20:23:15.759634',NULL,'ss','UNREAD','ss',11),(984,'2025-02-26 20:23:15.762297',NULL,'ss','UNREAD','ss',12),(985,'2025-02-26 20:23:15.764998',NULL,'ss','UNREAD','ss',13),(986,'2025-02-26 20:23:15.768350',NULL,'ss','UNREAD','ss',14),(987,'2025-02-26 20:23:15.771129',NULL,'ss','UNREAD','ss',15),(988,'2025-02-26 20:23:15.775014',NULL,'ss','UNREAD','ss',16),(989,'2025-02-26 20:23:15.777639',NULL,'ss','UNREAD','ss',17),(990,'2025-02-26 20:23:15.781382',NULL,'ss','UNREAD','ss',18),(991,'2025-02-26 20:23:15.784592',NULL,'ss','UNREAD','ss',19),(992,'2025-02-26 20:23:15.787952',NULL,'ss','UNREAD','ss',20),(993,'2025-02-26 20:23:15.791066',NULL,'ss','UNREAD','ss',21),(994,'2025-02-26 20:23:15.794305',NULL,'ss','UNREAD','ss',22),(995,'2025-02-26 20:23:15.797515',NULL,'ss','UNREAD','ss',23),(996,'2025-02-26 20:23:15.800698',NULL,'ss','UNREAD','ss',24),(997,'2025-02-26 20:23:15.804662','2025-02-26 21:02:13.997861','ss','READ','ss',25),(998,'2025-02-26 20:23:15.807961',NULL,'ss','UNREAD','ss',26),(999,'2025-02-26 20:23:15.811124',NULL,'ss','UNREAD','ss',27),(1000,'2025-02-26 20:35:13.810919',NULL,'sss','UNREAD','sss',1),(1001,'2025-02-26 20:35:13.861427',NULL,'sss','UNREAD','sss',2),(1002,'2025-02-26 20:35:13.865239',NULL,'sss','UNREAD','sss',3),(1003,'2025-02-26 20:35:13.868430',NULL,'sss','UNREAD','sss',4),(1004,'2025-02-26 20:35:13.871589',NULL,'sss','UNREAD','sss',5),(1005,'2025-02-26 20:35:13.875897',NULL,'sss','UNREAD','sss',6),(1006,'2025-02-26 20:35:13.879765',NULL,'sss','UNREAD','sss',7),(1007,'2025-02-26 20:35:13.883749',NULL,'sss','UNREAD','sss',8),(1008,'2025-02-26 20:35:13.886929',NULL,'sss','UNREAD','sss',9),(1009,'2025-02-26 20:35:13.890158',NULL,'sss','UNREAD','sss',10),(1010,'2025-02-26 20:35:13.893521',NULL,'sss','UNREAD','sss',11),(1011,'2025-02-26 20:35:13.897734',NULL,'sss','UNREAD','sss',12),(1012,'2025-02-26 20:35:13.901676',NULL,'sss','UNREAD','sss',13),(1013,'2025-02-26 20:35:13.905134',NULL,'sss','UNREAD','sss',14),(1014,'2025-02-26 20:35:13.909655',NULL,'sss','UNREAD','sss',15),(1015,'2025-02-26 20:35:13.914180',NULL,'sss','UNREAD','sss',16),(1016,'2025-02-26 20:35:13.917549',NULL,'sss','UNREAD','sss',17),(1017,'2025-02-26 20:35:13.920215',NULL,'sss','UNREAD','sss',18),(1018,'2025-02-26 20:35:13.923489',NULL,'sss','UNREAD','sss',19),(1019,'2025-02-26 20:35:13.926356',NULL,'sss','UNREAD','sss',20),(1020,'2025-02-26 20:35:13.928953',NULL,'sss','UNREAD','sss',21),(1021,'2025-02-26 20:35:13.931619',NULL,'sss','UNREAD','sss',22),(1022,'2025-02-26 20:35:13.934290',NULL,'sss','UNREAD','sss',23),(1023,'2025-02-26 20:35:13.936981',NULL,'sss','UNREAD','sss',24),(1024,'2025-02-26 20:35:13.938664','2025-02-26 21:02:21.419611','sss','READ','sss',25),(1025,'2025-02-26 20:35:13.942325',NULL,'sss','UNREAD','sss',26),(1026,'2025-02-26 20:35:13.945360',NULL,'sss','UNREAD','sss',27),(1027,'2025-02-26 20:51:42.623087',NULL,'www','UNREAD','ss',1),(1028,'2025-02-26 20:51:42.638094',NULL,'www','UNREAD','ss',2),(1029,'2025-02-26 20:51:42.640828',NULL,'www','UNREAD','ss',3),(1030,'2025-02-26 20:51:42.643484',NULL,'www','UNREAD','ss',4),(1031,'2025-02-26 20:51:42.647522',NULL,'www','UNREAD','ss',5),(1032,'2025-02-26 20:51:42.651336',NULL,'www','UNREAD','ss',6),(1033,'2025-02-26 20:51:42.655122',NULL,'www','UNREAD','ss',7),(1034,'2025-02-26 20:51:42.658375',NULL,'www','UNREAD','ss',8),(1035,'2025-02-26 20:51:42.661696',NULL,'www','UNREAD','ss',9),(1036,'2025-02-26 20:51:42.665947',NULL,'www','UNREAD','ss',10),(1037,'2025-02-26 20:51:42.668652',NULL,'www','UNREAD','ss',11),(1038,'2025-02-26 20:51:42.670865',NULL,'www','UNREAD','ss',12),(1039,'2025-02-26 20:51:42.674093',NULL,'www','UNREAD','ss',13),(1040,'2025-02-26 20:51:42.676275',NULL,'www','UNREAD','ss',14),(1041,'2025-02-26 20:51:42.679675',NULL,'www','UNREAD','ss',15),(1042,'2025-02-26 20:51:42.683210',NULL,'www','UNREAD','ss',16),(1043,'2025-02-26 20:51:42.686445',NULL,'www','UNREAD','ss',17),(1044,'2025-02-26 20:51:42.689738',NULL,'www','UNREAD','ss',18),(1045,'2025-02-26 20:51:42.692397',NULL,'www','UNREAD','ss',19),(1046,'2025-02-26 20:51:42.694111',NULL,'www','UNREAD','ss',20),(1047,'2025-02-26 20:51:42.697942',NULL,'www','UNREAD','ss',21),(1048,'2025-02-26 20:51:42.700637',NULL,'www','UNREAD','ss',22),(1049,'2025-02-26 20:51:42.702804',NULL,'www','UNREAD','ss',23),(1050,'2025-02-26 20:51:42.705531',NULL,'www','UNREAD','ss',24),(1051,'2025-02-26 20:51:42.708195','2025-02-26 21:02:27.424924','www','READ','ss',25),(1052,'2025-02-26 20:51:42.710940',NULL,'www','UNREAD','ss',26),(1053,'2025-02-26 20:51:42.714178',NULL,'www','UNREAD','ss',27),(1054,'2025-02-26 21:10:24.326937',NULL,'awq','UNREAD','sss',1),(1055,'2025-02-26 21:10:24.369870',NULL,'awq','UNREAD','sss',2),(1056,'2025-02-26 21:10:24.374608',NULL,'awq','UNREAD','sss',3),(1057,'2025-02-26 21:10:24.378005',NULL,'awq','UNREAD','sss',4),(1058,'2025-02-26 21:10:24.381807',NULL,'awq','UNREAD','sss',5),(1059,'2025-02-26 21:10:24.384970',NULL,'awq','UNREAD','sss',6),(1060,'2025-02-26 21:10:24.388267',NULL,'awq','UNREAD','sss',7),(1061,'2025-02-26 21:10:24.392444',NULL,'awq','UNREAD','sss',8),(1062,'2025-02-26 21:10:24.395595',NULL,'awq','UNREAD','sss',9),(1063,'2025-02-26 21:10:24.398759',NULL,'awq','UNREAD','sss',10),(1064,'2025-02-26 21:10:24.401434',NULL,'awq','UNREAD','sss',11),(1065,'2025-02-26 21:10:24.404643',NULL,'awq','UNREAD','sss',12),(1066,'2025-02-26 21:10:24.407949',NULL,'awq','UNREAD','sss',13),(1067,'2025-02-26 21:10:24.411036',NULL,'awq','UNREAD','sss',14),(1068,'2025-02-26 21:10:24.414254',NULL,'awq','UNREAD','sss',15),(1069,'2025-02-26 21:10:24.419147',NULL,'awq','UNREAD','sss',16),(1070,'2025-02-26 21:10:24.423132',NULL,'awq','UNREAD','sss',17),(1071,'2025-02-26 21:10:24.426402',NULL,'awq','UNREAD','sss',18),(1072,'2025-02-26 21:10:24.429608',NULL,'awq','UNREAD','sss',19),(1073,'2025-02-26 21:10:24.432469',NULL,'awq','UNREAD','sss',20),(1074,'2025-02-26 21:10:24.435226',NULL,'awq','UNREAD','sss',21),(1075,'2025-02-26 21:10:24.438773',NULL,'awq','UNREAD','sss',22),(1076,'2025-02-26 21:10:24.442113',NULL,'awq','UNREAD','sss',23),(1077,'2025-02-26 21:10:24.445345',NULL,'awq','UNREAD','sss',24),(1078,'2025-02-26 21:10:24.448642','2025-02-26 21:17:16.647324','awq','READ','sss',25),(1079,'2025-02-26 21:10:24.451566',NULL,'awq','UNREAD','sss',26),(1080,'2025-02-26 21:10:24.454870',NULL,'awq','UNREAD','sss',27),(1081,'2025-02-26 21:13:26.988978',NULL,'aq','UNREAD','w',1),(1082,'2025-02-26 21:13:27.031661',NULL,'aq','UNREAD','w',2),(1083,'2025-02-26 21:13:27.035010',NULL,'aq','UNREAD','w',3),(1084,'2025-02-26 21:13:27.038754',NULL,'aq','UNREAD','w',4),(1085,'2025-02-26 21:13:27.042064',NULL,'aq','UNREAD','w',5),(1086,'2025-02-26 21:13:27.045867',NULL,'aq','UNREAD','w',6),(1087,'2025-02-26 21:13:27.049175',NULL,'aq','UNREAD','w',7),(1088,'2025-02-26 21:13:27.052943',NULL,'aq','UNREAD','w',8),(1089,'2025-02-26 21:13:27.056672',NULL,'aq','UNREAD','w',9),(1090,'2025-02-26 21:13:27.059913',NULL,'aq','UNREAD','w',10),(1091,'2025-02-26 21:13:27.063103',NULL,'aq','UNREAD','w',11),(1092,'2025-02-26 21:13:27.066305',NULL,'aq','UNREAD','w',12),(1093,'2025-02-26 21:13:27.068944',NULL,'aq','UNREAD','w',13),(1094,'2025-02-26 21:13:27.072199',NULL,'aq','UNREAD','w',14),(1095,'2025-02-26 21:13:27.078941',NULL,'aq','UNREAD','w',15),(1096,'2025-02-26 21:13:27.083681',NULL,'aq','UNREAD','w',16),(1097,'2025-02-26 21:13:27.087603',NULL,'aq','UNREAD','w',17),(1098,'2025-02-26 21:13:27.091982',NULL,'aq','UNREAD','w',18),(1099,'2025-02-26 21:13:27.096137',NULL,'aq','UNREAD','w',19),(1100,'2025-02-26 21:13:27.099404',NULL,'aq','UNREAD','w',20),(1101,'2025-02-26 21:13:27.102739',NULL,'aq','UNREAD','w',21),(1102,'2025-02-26 21:13:27.106008',NULL,'aq','UNREAD','w',22),(1103,'2025-02-26 21:13:27.108681',NULL,'aq','UNREAD','w',23),(1104,'2025-02-26 21:13:27.111402',NULL,'aq','UNREAD','w',24),(1105,'2025-02-26 21:13:27.114123','2025-02-26 21:17:14.303950','aq','READ','w',25),(1106,'2025-02-26 21:13:27.117332',NULL,'aq','UNREAD','w',26),(1107,'2025-02-26 21:13:27.119985',NULL,'aq','UNREAD','w',27),(1108,'2025-02-26 21:28:10.915838','2025-02-27 00:22:42.759700','qqer','READ','saw',1),(1109,'2025-02-26 21:28:10.951032',NULL,'qqer','UNREAD','saw',2),(1110,'2025-02-26 21:28:10.955756',NULL,'qqer','UNREAD','saw',3),(1111,'2025-02-26 21:28:10.960162',NULL,'qqer','UNREAD','saw',4),(1112,'2025-02-26 21:28:10.964557',NULL,'qqer','UNREAD','saw',5),(1113,'2025-02-26 21:28:10.968275',NULL,'qqer','UNREAD','saw',6),(1114,'2025-02-26 21:28:10.972218',NULL,'qqer','UNREAD','saw',7),(1115,'2025-02-26 21:28:10.975453',NULL,'qqer','UNREAD','saw',8),(1116,'2025-02-26 21:28:10.978617',NULL,'qqer','UNREAD','saw',9),(1117,'2025-02-26 21:28:10.981266',NULL,'qqer','UNREAD','saw',10),(1118,'2025-02-26 21:28:10.984572',NULL,'qqer','UNREAD','saw',11),(1119,'2025-02-26 21:28:10.987822',NULL,'qqer','UNREAD','saw',12),(1120,'2025-02-26 21:28:10.990994',NULL,'qqer','UNREAD','saw',13),(1121,'2025-02-26 21:28:10.993579',NULL,'qqer','UNREAD','saw',14),(1122,'2025-02-26 21:28:10.997327',NULL,'qqer','UNREAD','saw',15),(1123,'2025-02-26 21:28:11.000616',NULL,'qqer','UNREAD','saw',16),(1124,'2025-02-26 21:28:11.004343',NULL,'qqer','UNREAD','saw',17),(1125,'2025-02-26 21:28:11.007536',NULL,'qqer','UNREAD','saw',18),(1126,'2025-02-26 21:28:11.010727',NULL,'qqer','UNREAD','saw',19),(1127,'2025-02-26 21:28:11.012142',NULL,'qqer','UNREAD','saw',20),(1128,'2025-02-26 21:28:11.015945',NULL,'qqer','UNREAD','saw',21),(1129,'2025-02-26 21:28:11.019691',NULL,'qqer','UNREAD','saw',22),(1130,'2025-02-26 21:28:11.022909',NULL,'qqer','UNREAD','saw',23),(1131,'2025-02-26 21:28:11.026166',NULL,'qqer','UNREAD','saw',24),(1132,'2025-02-26 21:28:11.029414','2025-02-26 21:28:35.284281','qqer','READ','saw',25),(1133,'2025-02-26 21:28:11.032871',NULL,'qqer','UNREAD','saw',26),(1134,'2025-02-26 21:28:11.036218',NULL,'qqer','UNREAD','saw',27),(1135,'2025-02-26 21:29:58.276097','2025-02-27 00:18:40.793027','1','READ','1',1),(1136,'2025-02-26 21:29:58.279923',NULL,'1','UNREAD','1',2),(1137,'2025-02-26 21:29:58.282799',NULL,'1','UNREAD','1',3),(1138,'2025-02-26 21:29:58.285479',NULL,'1','UNREAD','1',4),(1139,'2025-02-26 21:29:58.288320',NULL,'1','UNREAD','1',5),(1140,'2025-02-26 21:29:58.290424',NULL,'1','UNREAD','1',6),(1141,'2025-02-26 21:29:58.293079',NULL,'1','UNREAD','1',7),(1142,'2025-02-26 21:29:58.296353',NULL,'1','UNREAD','1',8),(1143,'2025-02-26 21:29:58.298983',NULL,'1','UNREAD','1',9),(1144,'2025-02-26 21:29:58.301720',NULL,'1','UNREAD','1',10),(1145,'2025-02-26 21:29:58.304534',NULL,'1','UNREAD','1',11),(1146,'2025-02-26 21:29:58.306701',NULL,'1','UNREAD','1',12),(1147,'2025-02-26 21:29:58.309399',NULL,'1','UNREAD','1',13),(1148,'2025-02-26 21:29:58.313242',NULL,'1','UNREAD','1',14),(1149,'2025-02-26 21:29:58.315358',NULL,'1','UNREAD','1',15),(1150,'2025-02-26 21:29:58.318082',NULL,'1','UNREAD','1',16),(1151,'2025-02-26 21:29:58.321911',NULL,'1','UNREAD','1',17),(1152,'2025-02-26 21:29:58.324835',NULL,'1','UNREAD','1',18),(1153,'2025-02-26 21:29:58.328154',NULL,'1','UNREAD','1',19),(1154,'2025-02-26 21:29:58.330806',NULL,'1','UNREAD','1',20),(1155,'2025-02-26 21:29:58.333572',NULL,'1','UNREAD','1',21),(1156,'2025-02-26 21:29:58.361257',NULL,'1','UNREAD','1',22),(1157,'2025-02-26 21:29:58.377085',NULL,'1','UNREAD','1',23),(1158,'2025-02-26 21:29:58.380480',NULL,'1','UNREAD','1',24),(1159,'2025-02-26 21:29:58.383684','2025-02-26 21:43:23.009632','1','READ','1',25),(1160,'2025-02-26 21:29:58.388062',NULL,'1','UNREAD','1',26),(1161,'2025-02-26 21:29:58.391348',NULL,'1','UNREAD','1',27),(1162,'2025-02-26 21:43:16.632627','2025-02-27 00:16:55.693994','aaa','READ','a',1),(1163,'2025-02-26 21:43:16.648328',NULL,'aaa','UNREAD','a',2),(1164,'2025-02-26 21:43:16.651567',NULL,'aaa','UNREAD','a',3),(1165,'2025-02-26 21:43:16.655483',NULL,'aaa','UNREAD','a',4),(1166,'2025-02-26 21:43:16.658757',NULL,'aaa','UNREAD','a',5),(1167,'2025-02-26 21:43:16.662457',NULL,'aaa','UNREAD','a',6),(1168,'2025-02-26 21:43:16.665190',NULL,'aaa','UNREAD','a',7),(1169,'2025-02-26 21:43:16.669253',NULL,'aaa','UNREAD','a',8),(1170,'2025-02-26 21:43:16.672522',NULL,'aaa','UNREAD','a',9),(1171,'2025-02-26 21:43:16.675800',NULL,'aaa','UNREAD','a',10),(1172,'2025-02-26 21:43:16.678527',NULL,'aaa','UNREAD','a',11),(1173,'2025-02-26 21:43:16.681209',NULL,'aaa','UNREAD','a',12),(1174,'2025-02-26 21:43:16.684665',NULL,'aaa','UNREAD','a',13),(1175,'2025-02-26 21:43:16.689088',NULL,'aaa','UNREAD','a',14),(1176,'2025-02-26 21:43:16.692344',NULL,'aaa','UNREAD','a',15),(1177,'2025-02-26 21:43:16.695644',NULL,'aaa','UNREAD','a',16),(1178,'2025-02-26 21:43:16.698387',NULL,'aaa','UNREAD','a',17),(1179,'2025-02-26 21:43:16.701229',NULL,'aaa','UNREAD','a',18),(1180,'2025-02-26 21:43:16.704510',NULL,'aaa','UNREAD','a',19),(1181,'2025-02-26 21:43:16.706665',NULL,'aaa','UNREAD','a',20),(1182,'2025-02-26 21:43:16.709856',NULL,'aaa','UNREAD','a',21),(1183,'2025-02-26 21:43:16.712029',NULL,'aaa','UNREAD','a',22),(1184,'2025-02-26 21:43:16.714825',NULL,'aaa','UNREAD','a',23),(1185,'2025-02-26 21:43:16.717607',NULL,'aaa','UNREAD','a',24),(1186,'2025-02-26 21:43:16.720354',NULL,'aaa','UNREAD','a',25),(1187,'2025-02-26 21:43:16.722523',NULL,'aaa','UNREAD','a',26),(1188,'2025-02-26 21:43:16.724657',NULL,'aaa','UNREAD','a',27);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `capacity` int NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('AVAILABLE','CLEANING','CLOSED','MAINTENANCE','OCCUPIED','OUT_OF_SERVICE','RESERVED','UNAVAILABLE') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (35,1,'A1','LA1.604','AVAILABLE'),(35,2,'A1','LA1.605','AVAILABLE'),(35,3,'A1','LA1.606','AVAILABLE'),(35,4,'A1','LA1.607','AVAILABLE'),(35,5,'A1','LA1.608','AVAILABLE');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `academic_year` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (NULL,'2024-09-02',1,'2024 - 2025','Semester 1'),('2025-06-08','2025-02-03',2,'2024 - 2025','Semester 2');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `year_of_study` int NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKbkix9btnoi1n917ll7bplkvg5` (`user_id`),
  CONSTRAINT `FKk5m148xqefonqw7bgnpm0snwj` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `day_of_week` tinyint DEFAULT NULL,
  `number_of_students` int NOT NULL,
  `start_lesson` int NOT NULL,
  `total_lesson_day` int NOT NULL,
  `total_lesson_semester` int NOT NULL,
  `end_lesson_time_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `instructor_id` bigint NOT NULL,
  `room_id` bigint DEFAULT NULL,
  `start_lesson_time_id` bigint DEFAULT NULL,
  `class_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `study_time` varchar(255) DEFAULT NULL,
  `timetable_name` varchar(255) DEFAULT NULL,
  `semester_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo7spn58hu2018j4ah997vm9ts` (`end_lesson_time_id`),
  KEY `FKsswwfdfpc83gg4qh3vef1gint` (`instructor_id`),
  KEY `FKp305jq1ghef0c43cgoy8o6ypr` (`room_id`),
  KEY `FKpo3194nvqsefa8n5ci6yusjyj` (`start_lesson_time_id`),
  KEY `FKmkvrn4nnpjhpjxgqvd4dhfdbl` (`semester_id`),
  CONSTRAINT `FKmkvrn4nnpjhpjxgqvd4dhfdbl` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`),
  CONSTRAINT `FKo7spn58hu2018j4ah997vm9ts` FOREIGN KEY (`end_lesson_time_id`) REFERENCES `lesson_time` (`id`),
  CONSTRAINT `FKp305jq1ghef0c43cgoy8o6ypr` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FKpo3194nvqsefa8n5ci6yusjyj` FOREIGN KEY (`start_lesson_time_id`) REFERENCES `lesson_time` (`id`),
  CONSTRAINT `FKsswwfdfpc83gg4qh3vef1gint` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`),
  CONSTRAINT `timetable_chk_1` CHECK ((`day_of_week` between 0 and 6))
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (3,30,4,3,75,6,1,1,1,4,'ITIT23UN01',NULL,'03/10/2024 - 24/10/2024\n14/11/2024 - 19/12/2024',NULL,1),(3,30,7,3,75,9,2,1,1,7,'ITIT23UN01',NULL,'03/10/2024 - 24/10/2024\n14/11/2024 - 19/12/2024',NULL,1),(0,31,1,3,75,3,3,2,1,1,'ITIT23IU21',NULL,'30/09/2024 - 21/10/2024\n11/11/2024 - 16/12/2024',NULL,1),(2,30,1,3,75,3,4,2,1,1,'ITIT23IU21',NULL,'02/10/2024 - 23/10/2024\n13/11/2024 - 18/12/2024',NULL,1),(2,30,4,3,75,6,5,2,1,4,'ITIT23IU21',NULL,'02/10/2024 - 23/10/2024\n13/11/2024 - 18/12/2024',NULL,1),(0,35,4,3,75,6,6,3,1,4,'ITIT23UN41',NULL,'30/09/2024 - 21/10/2024\n11/11/2024 - 16/12/2024',NULL,1),(1,35,4,3,75,6,7,3,1,4,'ITIT23UN41',NULL,'01/10/2024 - 22/10/2024\n12/11/2024 - 17/12/2024',NULL,1),(4,35,7,3,75,9,8,1,1,7,'ITIT23SB21',NULL,'04/10/2024 - 25/10/2024\n15/11/2024 - 20/12/2024',NULL,1),(1,12,1,3,75,3,9,1,1,1,'ITIT23SB21',NULL,'01/10/2024 - 22/10/2024\n12/11/2024 - 17/12/2024',NULL,1),(2,15,7,4,75,10,10,4,1,7,'ITIT23SB21',NULL,'02/10/2024 - 23/10/2024\n13/11/2024 - 04/12/2024',NULL,1),(5,35,7,4,75,10,11,2,1,7,'ITIT24WE31',NULL,'12/10/2024 - 02/11/2024\n16/11/2024 - 07/12/2024',NULL,1),(3,35,1,3,60,3,12,5,1,1,'MAMA22IU01',NULL,'03/10/2024 - 24/10/2024\n14/11/2024 - 19/12/2024',NULL,1),(0,0,7,5,105,11,13,6,1,7,'ITIT224WE41',NULL,'30/09/2024 - 16/12/2024',NULL,1),(4,0,1,5,105,5,14,7,1,1,'ITIT224WE41',NULL,'04/10/2024 - 20/12/2024',NULL,1),(5,0,1,5,105,5,15,3,1,1,'ITIT224WE41',NULL,'05/10/2024 - 21/12/2024',NULL,1),(2,34,4,3,75,6,16,3,2,4,'ITIT23UN41',NULL,'02/10/2024 - 23/10/2024\n13/11/2024 - 18/12/2024',NULL,1),(2,34,1,3,75,3,17,3,2,1,'ITIT23UN41',NULL,'02/10/2024 - 23/10/2024\n13/11/2024 - 18/12/2024',NULL,1),(0,35,1,3,75,3,18,8,2,1,'ITIT23IU01',NULL,'30/09/2024 - 21/10/2024\n11/11/2024 - 16/12/2024',NULL,1),(3,13,1,4,75,4,19,9,2,1,'ITIT22IU11',NULL,'03/10/2024 - 24/10/2024\n14/11/2024 - 05/12/2024',NULL,1),(0,35,7,4,90,10,20,3,2,7,'ITIT22IU11',NULL,'16/09/2024 - 21/10/2024\n11/11/2024 - 16/12/2024',NULL,1),(4,35,1,4,90,4,21,3,2,1,'ITIT22IU11',NULL,'20/09/2024 - 25/10/2024\n15/11/2024 - 20/12/2024',NULL,1),(1,34,1,4,75,4,22,10,2,1,'ITIT22IU01',NULL,'01/10/2024 - 22/10/2024\n12/11/2024 - 03/12/2024',NULL,1),(0,35,4,3,75,6,23,6,2,4,'ITIT22IU41',NULL,'30/09/2024 - 21/10/2024\n11/11/2024 - 16/12/2024',NULL,1),(1,35,7,4,75,10,24,11,2,7,'ITIT22IU11',NULL,'01/10/2024 - 22/10/2024\n12/11/2024 - 03/12/2024',NULL,1),(2,14,7,4,75,10,25,12,2,7,'ITIT23IU21',NULL,'02/10/2024 - 23/10/2024\n13/11/2024 - 04/12/2024',NULL,1),(4,35,7,4,75,10,26,12,2,7,'ITIT23IU21',NULL,'04/10/2024 - 25/10/2024\n15/11/2024 - 06/12/2024',NULL,1),(5,34,1,4,75,4,27,12,2,1,'ITIT23WE31',NULL,'05/10/2024 - 26/10/2024\n16/11/2024 - 07/12/2024',NULL,1),(3,29,7,4,75,10,28,13,2,7,'MAMA23IU21',NULL,'26/09/2024 - 24/10/2024\n14/11/2024 - 28/11/2024',NULL,1),(4,7,1,3,30,3,29,14,3,1,'ITIT23IU41',NULL,'04/10/2024 - 25/10/2024\n15/11/2024 - 20/12/2024',NULL,1),(3,11,1,4,75,4,30,2,3,1,'ITIT23WE31',NULL,'10/10/2024 - 31/10/2024\n14/11/2024 - 05/12/2024',NULL,1),(1,35,7,4,75,10,31,2,3,7,'ITIT24WE31',NULL,'08/10/2024 - 29/10/2024\n12/11/2024 - 03/12/2024',NULL,1),(2,0,1,4,75,4,32,8,3,1,'ITIT23WE31',NULL,'09/10/2024 - 30/10/2024\n13/11/2024 - 04/12/2024',NULL,1),(0,26,7,4,75,10,33,8,3,7,'ITIT24WE31',NULL,'07/10/2024 - 28/10/2024\n11/11/2024 - 02/12/2024',NULL,1),(5,32,1,3,75,3,34,15,3,1,'ITIT22IU01',NULL,'05/10/2024 - 26/10/2024\n16/11/2024 - 21/12/2024',NULL,1),(0,32,1,3,75,3,35,15,3,1,'ITIT22IU01',NULL,'30/09/2024 - 21/10/2024\n11/11/2024 - 16/12/2024',NULL,1),(0,33,4,3,75,6,36,15,3,4,'ITIT22IU01',NULL,'30/09/2024 - 21/10/2024\n11/11/2024 - 16/12/2024',NULL,1),(5,33,4,3,75,6,37,15,3,4,'ITIT22IU01',NULL,'05/10/2024 - 26/10/2024\n16/11/2024 - 21/12/2024',NULL,1),(3,35,7,4,60,10,38,5,3,7,'MAMA22IU01',NULL,'05/09/2024 - 24/10/2024',NULL,1),(3,35,7,4,60,10,39,5,3,7,'MAMA22IU01',NULL,'14/11/2024 - 26/12/2024',NULL,1),(2,22,7,4,75,10,40,5,3,7,'MAMA22IU01',NULL,'02/10/2024 - 23/10/2024\n13/11/2024 - 04/12/2024',NULL,1),(1,23,7,5,30,11,41,16,4,7,'CHCE22IU21',NULL,'12/11/2024 - 17/12/2024',NULL,1),(5,30,4,3,75,6,42,1,4,4,'ITIT23UN01',NULL,'05/10/2024 - 26/10/2024\n16/11/2024 - 21/12/2024',NULL,1),(5,30,1,3,75,3,43,2,4,1,'ITIT23IU21',NULL,'05/10/2024 - 26/10/2024\n16/11/2024 - 21/12/2024',NULL,1),(3,35,1,3,75,3,44,11,4,1,'ITIT23UN31',NULL,'03/10/2024 - 24/10/2024\n14/11/2024 - 19/12/2024',NULL,1),(2,26,1,3,75,3,45,11,4,1,'ITIT23UN31',NULL,'02/10/2024 - 23/10/2024\n13/11/2024 - 18/12/2024',NULL,1),(2,22,7,3,75,9,46,11,4,7,'ITIT23UN31',NULL,'02/10/2024 - 23/10/2024\n13/11/2024 - 18/12/2024',NULL,1),(3,35,7,3,75,9,47,8,4,7,'ITIT23IU01',NULL,'03/10/2024 - 24/10/2024\n14/11/2024 - 19/12/2024',NULL,1),(4,35,7,3,75,9,48,8,4,7,'ITIT23IU01',NULL,'04/10/2024 - 25/10/2024\n15/11/2024 - 20/12/2024',NULL,1),(5,35,7,3,75,9,49,17,4,7,'ITIT23WE01',NULL,'05/10/2024 - 26/10/2024\n16/11/2024 - 21/12/2024',NULL,1),(1,35,4,3,75,6,50,6,4,4,'ITIT22IU41',NULL,'01/10/2024 - 22/10/2024\n12/11/2024 - 17/12/2024',NULL,1),(2,20,7,4,75,10,51,18,5,7,'BEBE22IU41',NULL,'27/11/2024 - 18/12/2024',NULL,1),(2,20,7,4,75,10,52,19,5,7,'BEBE22IU41',NULL,'16/10/2024 - 23/10/2024\n13/11/2024 - 20/11/2024',NULL,1),(3,16,7,4,75,10,53,18,5,7,'BEBE22IU41',NULL,'28/11/2024 - 19/12/2024',NULL,1),(3,16,7,4,75,10,54,19,5,7,'BEBE22IU41',NULL,'17/10/2024 - 24/10/2024\n14/11/2024 - 21/11/2024',NULL,1),(3,23,1,5,30,5,55,16,5,1,'CHCE22IU21',NULL,'14/11/2024 - 19/12/2024',NULL,1),(0,30,1,3,75,3,56,1,5,1,'ITIT23UN01',NULL,'30/09/2024 - 21/10/2024\n11/11/2024 - 16/12/2024',NULL,1),(2,30,4,3,75,6,57,1,5,4,'ITIT23UN01',NULL,'02/10/2024 - 23/10/2024\n13/11/2024 - 18/12/2024',NULL,1),(1,35,7,3,75,9,58,17,5,7,'ITIT23WE01',NULL,'01/10/2024 - 22/10/2024\n12/11/2024 - 17/12/2024',NULL,1),(4,35,7,3,75,9,59,2,5,7,'ITIT23WE01',NULL,'04/10/2024 - 25/10/2024\n15/11/2024 - 20/12/2024',NULL,1),(5,35,4,3,75,6,60,2,5,4,'ITIT23WE01',NULL,'05/10/2024 - 26/10/2024\n16/11/2024 - 21/12/2024',NULL,1),(5,35,1,3,75,3,61,7,5,1,'ITIT22IU41',NULL,'05/10/2024 - 26/10/2024\n16/11/2024 - 21/12/2024',NULL,1),(6,0,8,4,0,11,62,1,1,8,NULL,'Buổi học Toán về Đạo hàm cao cấp','17/11/2024','Lịch học Toán cao cấp',1),(4,25,7,5,30,11,63,16,1,7,'EVEV20IU31',NULL,'18/04/2025 - 23/05/2025',NULL,2),(0,37,7,3,75,9,64,3,1,7,'ITCS23IU21',NULL,'03/03/2025 - 24/03/2025\n14/04/2025 - 19/05/2025',NULL,2),(3,15,4,3,75,6,65,9,1,4,'ITCS23IU01',NULL,'06/03/2025 - 27/03/2025\n17/04/2025 - 22/05/2025',NULL,2),(2,24,1,3,75,3,66,9,1,1,'ITCS23IU01',NULL,'05/03/2025 - 26/03/2025\n16/04/2025 - 21/05/2025',NULL,2),(3,30,1,3,75,3,67,2,1,1,'ITIT23IU11',NULL,'06/03/2025 - 27/03/2025\n17/04/2025 - 22/05/2025',NULL,2),(3,30,7,3,75,9,68,2,1,7,'ITIT23IU11',NULL,'06/03/2025 - 27/03/2025\n17/04/2025 - 22/05/2025',NULL,2),(5,36,4,3,90,6,69,3,1,4,'ITCS23IU11',NULL,'22/02/2025 - 29/03/2025\n19/04/2025 - 31/05/2025',NULL,2),(5,36,4,6,90,9,70,3,1,4,'ITCS23IU11',NULL,'07/06/2025 - 07/06/2025',NULL,2),(5,37,1,3,90,3,71,20,1,1,'ITCS23IU11',NULL,'22/02/2025 - 29/03/2025\n19/04/2025 - 31/05/2025',NULL,2),(5,36,7,3,90,9,72,20,1,7,'ITCS23IU11',NULL,'22/02/2025 - 29/03/2025\n19/04/2025 - 31/05/2025',NULL,2),(1,41,1,3,75,3,73,11,1,1,'ITDS23IU41',NULL,'04/03/2025 - 25/03/2025\n15/04/2025 - 20/05/2025',NULL,2),(0,39,1,3,75,3,74,8,1,1,'ITDS23IU41',NULL,'03/03/2025 - 24/03/2025\n14/04/2025 - 19/05/2025',NULL,2),(4,36,4,3,75,6,75,11,1,4,'ITDS23IU41',NULL,'07/03/2025 - 28/03/2025\n18/04/2025 - 23/05/2025',NULL,2),(2,12,7,5,105,11,76,7,1,7,'ITIT20CS11',NULL,'05/02/2025 - 28/05/2025',NULL,2),(1,12,7,5,105,11,77,21,1,7,'ITIT20CS11',NULL,'04/02/2025 - 27/05/2025',NULL,2),(4,35,7,5,30,11,78,22,2,7,'BTBT23UN31',NULL,'21/02/2025 - 28/03/2025',NULL,2),(1,35,7,5,30,11,79,22,2,7,'BTBT23UN31',NULL,'18/02/2025 - 25/03/2025',NULL,2),(2,30,7,5,30,11,80,23,2,7,'CHEV23IU21',NULL,'16/04/2025 - 21/05/2025',NULL,2),(3,37,7,3,75,9,81,3,2,7,'ITCS23IU21',NULL,'06/03/2025 - 27/03/2025\n17/04/2025 - 22/05/2025',NULL,2),(3,40,1,3,75,3,82,8,2,1,'ITCS23IU01',NULL,'06/03/2025 - 27/03/2025\n17/04/2025 - 22/05/2025',NULL,2),(3,41,4,3,75,6,83,8,2,4,'ITCS23IU01',NULL,'06/03/2025 - 27/03/2025\n17/04/2025 - 22/05/2025',NULL,2),(0,40,7,3,75,9,84,8,2,7,'ITCS23IU01',NULL,'03/03/2025 - 24/03/2025\n14/04/2025 - 19/05/2025',NULL,2),(5,8,1,3,75,3,85,2,2,1,'ITCS24IU41',NULL,'08/03/2025 - 29/03/2025\n19/04/2025 - 24/05/2025',NULL,2),(5,35,7,3,75,9,86,2,2,7,'ITCS24IU41',NULL,'08/03/2025 - 29/03/2025\n19/04/2025 - 24/05/2025',NULL,2),(5,37,1,6,90,6,87,20,2,1,'ITCS23IU11',NULL,'07/06/2025 - 07/06/2025',NULL,2),(5,36,7,6,90,12,88,20,2,7,'ITCS23IU11',NULL,'07/06/2025 - 07/06/2025',NULL,2),(0,41,1,3,75,3,89,12,2,1,'ITIT22NE41',NULL,'03/03/2025 - 24/03/2025\n14/04/2025 - 19/05/2025',NULL,2),(1,32,4,3,75,6,90,1,2,4,'ITIT24IU11',NULL,'04/03/2025 - 25/03/2025\n15/04/2025 - 20/05/2025',NULL,2),(2,35,1,3,75,3,91,1,2,1,'ITIT24IU11',NULL,'05/03/2025 - 26/03/2025\n16/04/2025 - 21/05/2025',NULL,2),(4,24,1,3,75,3,92,8,2,1,'ITDS24IU41',NULL,'07/03/2025 - 28/03/2025\n18/04/2025 - 23/05/2025',NULL,2),(4,4,7,3,45,9,93,24,3,7,'ITCS23IU01',NULL,'07/02/2025 - 28/03/2025\n18/04/2025 - 30/05/2025',NULL,2),(0,15,7,4,75,10,94,5,3,7,'MAMA23IU11',NULL,'03/03/2025 - 24/03/2025\n14/04/2025 - 05/05/2025',NULL,2),(1,33,7,5,30,11,95,25,4,7,'CHEV23IU21',NULL,'15/04/2025 - 20/05/2025',NULL,2),(3,40,4,3,75,6,96,1,4,4,'ITCS23IU11',NULL,'06/03/2025 - 27/03/2025\n17/04/2025 - 22/05/2025',NULL,2),(4,37,7,3,75,9,97,2,4,7,'ITCS22IU11',NULL,'07/03/2025 - 28/03/2025\n18/04/2025 - 23/05/2025',NULL,2),(1,36,4,3,75,6,98,2,4,4,'ITCS22IU11',NULL,'04/03/2025 - 25/03/2025\n15/04/2025 - 20/05/2025',NULL,2),(2,36,1,3,75,3,99,2,4,1,'ITCS22IU11',NULL,'05/03/2025 - 26/03/2025\n16/04/2025 - 21/05/2025',NULL,2),(1,36,1,3,75,3,100,2,4,1,'ITCS22IU11',NULL,'04/03/2025 - 25/03/2025\n15/04/2025 - 20/05/2025',NULL,2),(4,34,4,3,75,6,101,3,4,4,'ITCS23IU21',NULL,'07/03/2025 - 28/03/2025\n18/04/2025 - 23/05/2025',NULL,2),(4,25,1,3,75,3,102,1,4,1,'ITCS23IU01',NULL,'07/03/2025 - 28/03/2025\n18/04/2025 - 23/05/2025',NULL,2),(2,34,4,3,90,6,103,3,4,4,'ITCS23IU11',NULL,'19/02/2025 - 26/03/2025\n16/04/2025 - 28/05/2025',NULL,2),(2,34,4,6,90,9,104,3,4,4,'ITCS23IU11',NULL,'04/06/2025 - 04/06/2025',NULL,2),(2,23,7,4,30,10,105,4,4,7,'ITIT22CE41',NULL,'05/03/2025 - 26/03/2025\n16/04/2025 - 07/05/2025',NULL,2),(0,40,7,4,75,10,106,7,4,7,'ITIT21CE11',NULL,'03/03/2025 - 24/03/2025\n14/04/2025 - 05/05/2025',NULL,2),(3,41,7,4,75,10,107,21,4,7,'ITDS22IU41',NULL,'06/03/2025 - 27/03/2025\n17/04/2025 - 08/05/2025',NULL,2),(0,40,1,3,75,3,108,11,4,1,'ITIT22CE41',NULL,'03/03/2025 - 24/03/2025\n14/04/2025 - 19/05/2025',NULL,2),(2,24,7,4,75,10,109,18,5,7,'BEBE23IU41',NULL,'26/02/2025 - 19/03/2025',NULL,2),(2,24,7,4,75,10,110,19,5,7,'BEBE23IU41',NULL,'26/03/2025 - 26/03/2025\n16/04/2025 - 30/04/2025',NULL,2),(4,24,7,4,75,10,111,18,5,7,'BEBE23IU41',NULL,'28/02/2025 - 21/03/2025',NULL,2),(4,24,7,4,75,10,112,19,5,7,'BEBE23IU41',NULL,'28/03/2025 - 28/03/2025\n18/04/2025 - 02/05/2025',NULL,2),(3,8,7,5,30,11,113,25,5,7,'CHEV23IU21',NULL,'17/04/2025 - 22/05/2025',NULL,2),(0,14,7,5,30,11,114,23,5,7,'CHEV23IU21',NULL,'14/04/2025 - 19/05/2025',NULL,2),(0,40,4,3,75,6,115,1,5,4,'ITCS23IU11',NULL,'03/03/2025 - 24/03/2025\n14/04/2025 - 19/05/2025',NULL,2),(2,41,4,3,75,6,116,8,5,4,'ITCS23IU01',NULL,'05/03/2025 - 26/03/2025\n16/04/2025 - 21/05/2025',NULL,2),(4,18,4,3,75,6,117,1,5,4,'ITCS23IU01',NULL,'07/03/2025 - 28/03/2025\n18/04/2025 - 23/05/2025',NULL,2),(3,37,4,3,90,6,118,3,5,4,'ITCS23IU11',NULL,'20/02/2025 - 27/03/2025\n17/04/2025 - 29/05/2025',NULL,2),(3,37,4,6,90,9,119,3,5,4,'ITCS23IU11',NULL,'05/06/2025 - 05/06/2025',NULL,2),(1,35,1,3,90,3,120,3,5,1,'ITCS23IU11',NULL,'18/02/2025 - 25/03/2025\n15/04/2025 - 27/05/2025',NULL,2),(1,35,1,6,90,6,121,3,5,1,'ITCS23IU11',NULL,'03/06/2025 - 03/06/2025',NULL,2),(2,40,1,3,75,3,122,12,5,1,'ITIT22NE41',NULL,'05/03/2025 - 26/03/2025\n16/04/2025 - 21/05/2025',NULL,2),(5,29,7,4,75,10,123,17,5,7,'ITDS23IU41',NULL,'08/03/2025 - 29/03/2025\n19/04/2025 - 10/05/2025',NULL,2),(4,28,1,3,75,3,124,4,5,1,'ITDS22IU41',NULL,'07/03/2025 - 28/03/2025\n18/04/2025 - 23/05/2025',NULL,2),(3,40,1,3,75,3,125,11,5,1,'ITDS23IU41',NULL,'06/03/2025 - 27/03/2025\n17/04/2025 - 22/05/2025',NULL,2);
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_cancel_dates`
--

DROP TABLE IF EXISTS `timetable_cancel_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable_cancel_dates` (
  `cancel_dates` date DEFAULT NULL,
  `timetable_id` bigint NOT NULL,
  KEY `FKg8cq1ydtd9364slfxuhf71sj9` (`timetable_id`),
  CONSTRAINT `FKg8cq1ydtd9364slfxuhf71sj9` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_cancel_dates`
--

LOCK TABLES `timetable_cancel_dates` WRITE;
/*!40000 ALTER TABLE `timetable_cancel_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_cancel_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_course`
--

DROP TABLE IF EXISTS `timetable_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable_course` (
  `course_id` bigint NOT NULL,
  `timetable_id` bigint NOT NULL,
  PRIMARY KEY (`course_id`,`timetable_id`),
  KEY `FKfws2br9a8to7h6y50t8faepk` (`timetable_id`),
  CONSTRAINT `FKfws2br9a8to7h6y50t8faepk` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`id`),
  CONSTRAINT `FKj3v8mwnm6gop1uo0okr267cn8` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_course`
--

LOCK TABLES `timetable_course` WRITE;
/*!40000 ALTER TABLE `timetable_course` DISABLE KEYS */;
INSERT INTO `timetable_course` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(51,52),(52,53),(52,54),(53,55),(54,56),(55,57),(56,58),(57,59),(58,60),(59,61),(41,63),(60,64),(61,65),(62,66),(56,67),(63,68),(20,69),(20,70),(64,71),(65,72),(34,73),(36,74),(66,75),(67,76),(68,77),(69,78),(70,79),(71,80),(72,81),(47,82),(18,83),(73,84),(58,85),(74,86),(64,87),(65,88),(75,89),(76,90),(77,91),(32,92),(78,93),(79,94),(80,95),(81,96),(3,97),(4,98),(82,99),(43,100),(44,101),(83,102),(21,103),(21,104),(84,105),(59,106),(85,107),(24,108),(86,109),(86,110),(87,111),(87,112),(88,113),(89,114),(90,115),(91,116),(92,117),(93,118),(93,119),(94,120),(94,121),(95,122),(96,123),(97,124),(37,125);
/*!40000 ALTER TABLE `timetable_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `expired` bit(1) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_modified_date` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `token` varchar(512) DEFAULT NULL,
  `token_type` enum('BEARER') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKpddrhgwxnms2aceeku9s2ewy5` (`token`),
  KEY `FKe32ek7ixanakfqsdaokm4q9y2` (`user_id`),
  CONSTRAINT `FKe32ek7ixanakfqsdaokm4q9y2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (_binary '\0',_binary '\0','2025-02-26 01:55:36.256773',138,NULL,2,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwNTg1IiwiaWF0IjoxNzQwNTA5NzM2LCJleHAiOjE3NDA1MTgzNzYsImF1dGhvcml0aWVzIjpbeyJhdXRob3JpdHkiOiJST0xFX1RFQUNIRVIifV19.4DxHMI5jAkF_yG6JcA7S2l39_0Wqi-5zOgFSoUX7Q-U','BEARER'),(_binary '\0',_binary '\0','2025-02-26 20:21:33.452894',148,NULL,25,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwNTY1IiwiaWF0IjoxNzQwNTc2MDkzLCJleHAiOjE3NDA1ODQ3MzMsImF1dGhvcml0aWVzIjpbeyJhdXRob3JpdHkiOiJST0xFX1RFQUNIRVIifV19.kgOx0P5Euua6oyw8Ju4d9lOu_je5t8jJIvdX90scTy0','BEARER'),(_binary '',_binary '','2025-02-26 23:16:52.880159',154,'2025-03-06 22:28:46.239995',1,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJVTIwMjkyIiwiaWF0IjoxNzQwNTg2NjEyLCJleHAiOjE3NDA1OTUyNTIsImF1dGhvcml0aWVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.mvCm9VkvRXItPPVAe8jXp_yQrdTmfyxHIcWifXTHnaw','BEARER'),(_binary '',_binary '','2025-03-06 22:28:46.270665',156,'2025-03-13 00:33:57.828431',1,'eyJhbGciOiJIUzI1NiJ9.eyJmdWxsTmFtZSI6Ik5ndXllbiBTYW5nIiwic3ViIjoiSVUyMDI5MiIsImlhdCI6MTc0MTI3NDkyNiwiZXhwIjoxNzQxMjgzNTY2LCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9BRE1JTiJ9XX0.acYLShxObWnVENEfThjKUq7-O0VnaN517w_mGEa179Y','BEARER'),(_binary '',_binary '','2025-03-13 00:33:57.863205',157,'2025-03-15 15:29:10.777688',1,'eyJhbGciOiJIUzI1NiJ9.eyJmdWxsTmFtZSI6Ik5ndXllbiBTYW5nIiwic3ViIjoiSVUyMDI5MiIsImlhdCI6MTc0MTgwMDgzNywiZXhwIjoxNzQxODA5NDc3LCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9BRE1JTiJ9XX0.xWC_zgqAu4U7_mqLEWylRdJug3YUjI7BK2w3lxJg5Y0','BEARER'),(_binary '',_binary '','2025-03-15 15:29:10.765957',158,'2025-03-15 15:36:42.177713',1,'eyJhbGciOiJIUzI1NiJ9.eyJmdWxsTmFtZSI6Ik5ndXllbiBTYW5nIiwic3ViIjoiSVUyMDI5MiIsImlhdCI6MTc0MjAyNzM1MCwiZXhwIjoxNzQyMDI3NDcwLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9BRE1JTiJ9XX0.qWUdUHz1APwBElZw7ClBgGb9VsSD3m_1DMpV111QTSM','BEARER'),(_binary '',_binary '','2025-03-15 15:36:42.218727',159,'2025-03-15 15:36:42.423788',1,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJVTIwMjkyIiwiaWF0IjoxNzQyMDI3ODAyLCJleHAiOjE3NDIwMjc5ODIsImF1dGhvcml0aWVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.3xa6czLNu10WsXSGaG5xrE4CBuB_nkyH9rO44-EjhZ8','BEARER'),(_binary '',_binary '','2025-03-15 15:37:10.776899',161,'2025-03-15 15:37:10.929594',1,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJVTIwMjkyIiwiaWF0IjoxNzQyMDI3ODMwLCJleHAiOjE3NDIwMjgwMTAsImF1dGhvcml0aWVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RsQrwUFfOZB_MyR7sfe4_WcNgJH-cW1zbA8vCW1Uxh8','BEARER'),(_binary '',_binary '','2025-03-15 15:39:29.800534',163,'2025-03-15 15:39:29.950257',1,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJVTIwMjkyIiwiaWF0IjoxNzQyMDI3OTY5LCJleHAiOjE3NDIwMjgxNDksImF1dGhvcml0aWVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.Y1pCb3p1xLZNmJia_wOeHeMAKrPA1dUH606Gp-DcySw','BEARER'),(_binary '',_binary '','2025-03-15 15:48:27.912020',165,'2025-03-15 16:12:37.574980',1,'eyJhbGciOiJIUzI1NiJ9.eyJmdWxsTmFtZSI6Ik5ndXllbiBTYW5nIiwic3ViIjoiSVUyMDI5MiIsImlhdCI6MTc0MjAyODUwNywiZXhwIjoxNzQyMDI4NjI3LCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9BRE1JTiJ9XX0.mZ805p_8m-cfapCPXZtNDXuXdQPdeofnSkHyle_reSc','BEARER'),(_binary '',_binary '','2025-03-15 16:12:37.630281',166,'2025-03-19 19:53:39.524049',1,'eyJhbGciOiJIUzI1NiJ9.eyJmdWxsTmFtZSI6Ik5ndXllbiBTYW5nIiwic3ViIjoiSVUyMDI5MiIsImlhdCI6MTc0MjAyOTk1NywiZXhwIjoxNzQyMDM4NTk3LCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9BRE1JTiJ9XX0.Zcz5QzVWhYi6xCShR0lKhIiSU8AjPbzNcgRrToToOj4','BEARER'),(_binary '',_binary '','2025-03-19 19:53:39.598062',167,'2025-03-19 19:54:48.497343',1,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJVTIwMjkyIiwiaWF0IjoxNzQyMzg4ODE5LCJleHAiOjE3NDIzOTc0NTksImF1dGhvcml0aWVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.jVfUqmou-z6TlwScOyKBHl97QNz4tbdIn1ySquhzrLg','BEARER'),(_binary '',_binary '','2025-03-19 19:55:03.392468',169,'2025-03-19 22:22:40.738440',1,'eyJhbGciOiJIUzI1NiJ9.eyJmdWxsTmFtZSI6Ik5ndXllbiBTYW5nIiwic3ViIjoiSVUyMDI5MiIsImlhdCI6MTc0MjM4ODkwMywiZXhwIjoxNzQyMzk3NTQzLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9BRE1JTiJ9XX0.SBWYQjbIghMU6XF65cOeSawOUDrnFVXtfcsj41SvuAA','BEARER'),(_binary '\0',_binary '\0','2025-03-19 22:22:40.843498',171,NULL,1,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJVTIwMjkyIiwiaWF0IjoxNzQyMzk3NzYwLCJleHAiOjE3NDI0MDY0MDAsImF1dGhvcml0aWVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.EAOTpKTNZH32FXpvWzhJZvP2gNRRF6mtfE7itYDWuTY','BEARER');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `account_locked` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_modified_date` datetime(6) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','OWNER','CO_OWNER','TEACHER','STUDENT') DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `two_factor_enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (_binary '\0',_binary '','2024-12-30 20:02:16.454405',1,'2025-03-21 20:32:49.899107','http://res.cloudinary.com/dsboloq8v/image/upload/v1735563780/sj3z1luvkou8jtqxkq7y.png','nsang0127@gmail.com','Sang','Nguyen','$2a$10$38EJ/XMNid.AxMDlQEg60OCbqoqp8E3RD7pTlzqk0AIsHZWPkC/KW','0966420942','IU20292','ADMIN','HC4O5RPRXGJWYO5E2AXF7BJN4CQOHFPO',_binary ''),(_binary '\0',_binary '','2024-12-30 20:02:45.459934',2,NULL,NULL,NULL,'Tín','Thái Trung','$2a$10$1vSpjaeaDM6w7Dy/bl23D.GaMH0xXkC8vQm/t/HDWhzPmgI6Ifpte',NULL,'0585','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:45.714355',3,'2025-02-13 00:37:52.384282',NULL,'','Nhân','Đặng Tâm','$2a$10$fE7UX4yrQVyyliFeh1qhTubjmQhxLcw1/kw3hSctS4htVIl8xVChe','','0850','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:46.020093',4,'2025-02-13 00:42:07.595751',NULL,'nqhhh@gmail.com','Nghĩa','Nguyễn Trung','$2a$10$vRrKWrK.HSAHgeHVWdg2wOFe5N/M9Bfp6M6jubmeeW.q.y34SWkPC','','0605','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:46.367153',5,NULL,NULL,NULL,'Thành','Vi Chí','$2a$10$41X2i/gsXru6qOsCnKOP3e2Z6.5PF8lsgvf/IAzoQ7DHX2rwrfkjS',NULL,'0808','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:46.566661',6,'2025-02-12 23:39:23.527488',NULL,'nqh@gmail.com','Ha','Tran Manh','$2a$10$GWag1vW9ANPhw21O1uPv8.F58AGXqinfOl5qnIePJvIZUadiPMXMe','','IT008','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:46.712101',7,NULL,NULL,NULL,'Tân','Lê Duy','$2a$10$9lSDjdvSkgjZo5VezoByEeMUAAoQmWLs2kksbJnGannJxEB9B42LS',NULL,'0701','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:46.858866',8,NULL,NULL,NULL,'Duong','Le Hai','$2a$10$I4Pp4rKkXdHeZSOHJT48bescSFlHGBgVrp6MDvnaiYOhe5Shj6rme',NULL,'0084','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:47.177550',9,NULL,NULL,NULL,'Nga','Ly Tu','$2a$10$IgeeNERodH6eTu2G58cArOfkrOfSYpr0ntvg9KPgckrqLagJevRci',NULL,'0060','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:47.323208',10,NULL,NULL,NULL,'Hạnh','Lê Thị Ngọc','$2a$10$zuTj0hRqVBTq1iSPC5R4c.tT1AOYpbDhYVk9ZYbUAkhx2xygnxlse',NULL,'0880','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:47.575851',11,NULL,NULL,NULL,'Son','Le Thanh','$2a$10$I7upSk2VGy9.igilgeVDeOeiguZA81df4TMiS1oTPZ5pFzXIIPsCe',NULL,'0036','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:47.788180',12,NULL,NULL,NULL,'Phú','Nguyễn Quang','$2a$10$YCriK4VJxii1ouxFxs7rQeaNJ7VZLyI7Hb.E.alTJz8JrWqFffYmS',NULL,'0609','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:47.933136',13,NULL,NULL,NULL,'Vân','Hồ Long','$2a$10$0UZ/wWZZ5/jlHBih8LZ5XO5YK7MlzH8Mz75CxMQxXaMZwKciI1mjK',NULL,'0879','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:48.202387',14,NULL,NULL,NULL,'Bảo','Tạ Quốc','$2a$10$N51yeDroZeTPdQ.S5H9QaO40xc8X62YW4iUwmyda2SoVA3MOXOSJK',NULL,'0662','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:48.372787',15,NULL,NULL,NULL,'Thanh','Vo Minh','$2a$10$YORSk6zeWI0z8zyWidmCa.fU70jZV3OJ2ts9YSR/gA6AoeHSy0CKy',NULL,'0083','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:48.874199',16,NULL,NULL,NULL,'Kỳ','Nguyễn Trung','$2a$10$8W4rVxHADrg6OYTQKdFFt.0ARSop.VU5xDmwsneW05OMtfip5PPGW',NULL,'0724','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:49.652430',17,NULL,NULL,NULL,'Tu','Tran Thanh','$2a$10$qgHRF58J/Ny4AxcCliSWFOiUjN/nfmm0POg5sObZkI5P7uGZPLvTW',NULL,'0403','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:50.250559',18,NULL,NULL,NULL,'Phuong','Vo Thi Luu','$2a$10$BjtP94vUpurlYrg/og6McOaIBbA2wmXo.uOYhoWJk9//KbFu/LEWC',NULL,'0062','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:50.483692',19,NULL,NULL,NULL,'Giang','Trần Lê','$2a$10$C/sQj.8ARlGGb4uKkR3zfOhSOX0YrbyWJxSA/hIyzcKR5qtmVsuuC',NULL,'0749','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2024-12-30 20:02:50.647654',20,NULL,NULL,NULL,'Lụa','Ngô Thị','$2a$10$m1X1VFI6HeUczAiYfbQ30ujTv0lEGZsMbHYBNRIk5GP1TNo9fsbri',NULL,'0644','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2025-02-12 00:07:55.402244',21,'2025-02-12 23:53:06.575928',NULL,'ititiu20292@student.hcmiu.edu.vn','Sang','Nguyen','$2a$10$V4a1d.w6JtjZYan3DrWyMu2bdgo.cKwOpw/Q5Zq5EX8p/V.STBzE6','0966420942','20292','OWNER',NULL,_binary '\0'),(_binary '\0',_binary '','2025-02-21 21:50:22.223283',22,NULL,NULL,NULL,'Minh','Trần Khai','$2a$10$Qxtsers6b7hI8ho.wg//O.riFp3I4MHPVGlQAHwm37P2hFh.gBY82',NULL,'IT017','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2025-02-21 21:50:22.714356',23,NULL,NULL,NULL,'Ân','Mai Hoàng Bảo','$2a$10$vKCRFr2PRHF0Jk9efT/Kg.TVlAaf8vg7qnEg1B0ElH.TKHfbWWcdG',NULL,'0654','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2025-02-21 21:50:22.884871',24,NULL,NULL,NULL,'Chau','Do Ngoc Phuc','$2a$10$rbAWH8cBsbQ/cByPiMkLwOusaajJdeKTN0/gbx9HMAImbG7iMgjJG',NULL,'0141','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2025-02-21 21:50:23.098658',25,NULL,NULL,NULL,'Ly','Tran Van','$2a$10$pOVbGqRBa8vfleJaU2X6o.npQhjlim83vyy09ZFEXVlp/mruIyR72',NULL,'0565','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2025-02-21 21:50:23.856066',26,NULL,NULL,NULL,'Sinh','Nguyen Van','$2a$10$w3qkzpYNvdAenBMJN2HtQuJN.IOnnVlJz6goQy74hUUE4iawTXDAC',NULL,'0074','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2025-02-21 21:50:24.068612',27,NULL,NULL,NULL,'Lam','Huynh Kim','$2a$10$FTLHzh0SfSRVxWFlnctrAu/eGf5i9wo5tlHVr2tMVD4PO2IUMXSeO',NULL,'0147','TEACHER',NULL,_binary '\0'),(_binary '\0',_binary '','2025-03-20 19:02:03.482353',32,'2025-03-20 19:04:08.295224',NULL,'user@gmail.com','Sang','Nguyen','$2a$10$Cn6JGzxpxcUdrFKzsdmjgOrXAKOhQDT.ts4Gg3zHKHFQeYAcEhSNu','0966420942','ngcongsang','STUDENT',NULL,_binary '\0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity_events`
--

DROP TABLE IF EXISTS `user_activity_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_activity_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event_type` varchar(255) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_activity_event_user_id` (`user_id`),
  KEY `idx_user_activity_event_timestamp` (`timestamp`),
  KEY `idx_user_activity_event_event_type` (`event_type`),
  CONSTRAINT `FK5g34677r5bcbjnypns5l5vard` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity_events`
--

LOCK TABLES `user_activity_events` WRITE;
/*!40000 ALTER TABLE `user_activity_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_activity_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity_log`
--

DROP TABLE IF EXISTS `user_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_activity_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `duration` bigint DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `last_activity_time` datetime(6) DEFAULT NULL,
  `start_time` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_activity_user_id` (`user_id`),
  KEY `idx_user_activity_start_time` (`start_time`),
  KEY `idx_user_activity_end_time` (`end_time`),
  KEY `idx_user_activity_date` (`date`),
  CONSTRAINT `FKs8utvax1ytt917u9xr12n0vn1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity_log`
--

LOCK TABLES `user_activity_log` WRITE;
/*!40000 ALTER TABLE `user_activity_log` DISABLE KEYS */;
INSERT INTO `user_activity_log` VALUES (1,'2025-01-01',7200,'2025-01-01 10:00:00.000000','2025-01-01 10:00:00.000000','2025-01-01 08:00:00.000000',2),(2,'2025-01-01',9000,'2025-01-01 11:30:00.000000','2025-01-01 11:30:00.000000','2025-01-01 09:00:00.000000',3),(3,'2025-01-01',7200,'2025-01-01 15:00:00.000000','2025-01-01 15:00:00.000000','2025-01-01 13:00:00.000000',4),(4,'2025-01-01',5400,'2025-01-01 16:00:00.000000','2025-01-01 16:00:00.000000','2025-01-01 14:30:00.000000',5),(5,'2025-01-01',14400,'2025-01-01 12:00:00.000000','2025-01-01 12:00:00.000000','2025-01-01 08:00:00.000000',6),(6,'2025-01-01',5400,'2025-01-01 11:00:00.000000','2025-01-01 11:00:00.000000','2025-01-01 09:30:00.000000',7),(7,'2025-01-01',7200,'2025-01-01 12:00:00.000000','2025-01-01 12:00:00.000000','2025-01-01 10:00:00.000000',8),(8,'2025-01-01',9000,'2025-01-01 14:00:00.000000','2025-01-01 14:00:00.000000','2025-01-01 11:30:00.000000',9),(9,'2025-01-01',10800,'2025-01-01 18:00:00.000000','2025-01-01 18:00:00.000000','2025-01-01 15:00:00.000000',10),(10,'2025-01-01',5400,'2025-01-01 17:30:00.000000','2025-01-01 17:30:00.000000','2025-01-01 16:00:00.000000',11),(11,'2025-01-01',6300,'2025-01-01 09:45:00.000000','2025-01-01 09:45:00.000000','2025-01-01 08:00:00.000000',12),(12,'2025-01-01',7200,'2025-01-01 12:15:00.000000','2025-01-01 12:15:00.000000','2025-01-01 10:15:00.000000',13),(13,'2025-01-01',10800,'2025-01-01 12:00:00.000000','2025-01-01 12:00:00.000000','2025-01-01 09:00:00.000000',14),(14,'2025-01-01',9000,'2025-01-01 16:30:00.000000','2025-01-01 16:30:00.000000','2025-01-01 14:00:00.000000',15),(15,'2025-01-01',9000,'2025-01-01 15:30:00.000000','2025-01-01 15:30:00.000000','2025-01-01 13:00:00.000000',16),(16,'2025-01-01',7200,'2025-01-01 10:00:00.000000','2025-01-01 10:00:00.000000','2025-01-01 08:00:00.000000',17),(17,'2025-01-01',7200,'2025-01-01 12:30:00.000000','2025-01-01 12:30:00.000000','2025-01-01 10:30:00.000000',18),(18,'2025-01-01',7200,'2025-01-01 15:30:00.000000','2025-01-01 15:30:00.000000','2025-01-01 13:30:00.000000',19),(19,'2025-01-01',7200,'2025-01-01 16:00:00.000000','2025-01-01 16:00:00.000000','2025-01-01 14:00:00.000000',20),(20,'2025-01-02',17693,'2025-01-02 18:33:56.862893','2025-01-02 13:39:03.810295','2025-01-02 13:39:03.810295',1),(21,'2025-01-02',1496,'2025-01-02 19:02:14.036257','2025-01-02 18:37:17.591956','2025-01-02 18:37:17.591956',2),(22,'2025-01-02',78,'2025-01-02 19:03:49.302476','2025-01-02 19:02:30.580612','2025-01-02 19:02:30.580612',6),(23,'2025-01-02',112,'2025-01-02 19:05:49.121617','2025-01-02 19:03:56.853126','2025-01-02 19:03:56.853126',6),(24,'2025-01-02',1385,'2025-01-02 19:29:01.931329','2025-01-02 19:05:55.934288','2025-01-02 19:05:55.934288',6),(25,'2025-01-02',509,'2025-01-02 19:37:38.306263','2025-01-02 19:29:08.354426','2025-01-02 19:29:08.354426',1),(26,'2025-01-02',3293978,'2025-02-09 23:48:07.095855','2025-01-02 20:48:28.840761','2025-01-02 20:48:28.840761',1),(27,'2025-01-03',3201889,'2025-02-09 23:48:07.095855','2025-01-03 22:23:17.240622','2025-01-03 22:23:17.240622',1),(28,'2025-01-12',2497829,'2025-02-09 23:48:07.095855','2025-01-12 01:57:37.245135','2025-01-12 01:57:37.245135',1),(29,'2025-02-09',19779,'2025-02-09 23:48:07.095855','2025-02-09 18:18:27.852402','2025-02-09 18:18:27.852402',1),(30,'2025-02-09',173583,'2025-02-12 00:08:44.664530','2025-02-09 23:55:40.831693','2025-02-09 23:55:40.831040',1),(31,'2025-02-10',173228,'2025-02-12 00:08:44.664530','2025-02-10 00:01:35.877483','2025-02-10 00:01:35.877483',1),(32,'2025-02-10',173228,'2025-02-12 00:08:44.664530','2025-02-10 00:01:35.877483','2025-02-10 00:01:35.877483',1),(33,'2025-02-10',173228,'2025-02-12 00:08:44.664530','2025-02-10 00:01:35.882017','2025-02-10 00:01:35.882017',1),(34,'2025-02-11',18785,'2025-02-12 00:08:44.664530','2025-02-11 18:55:39.414778','2025-02-11 18:55:39.414778',1),(35,'2025-02-12',408,'2025-02-12 00:08:44.664530','2025-02-12 00:01:56.194579','2025-02-12 00:01:56.194579',1),(36,'2025-02-12',8,'2025-02-12 00:10:03.187268','2025-02-12 00:09:54.754924','2025-02-12 00:09:54.754924',1),(37,'2025-02-12',88360,'2025-02-13 00:42:52.227602','2025-02-12 00:10:12.079296','2025-02-12 00:10:12.079296',21),(38,'2025-02-13',2493,'2025-02-13 00:42:52.227602','2025-02-13 00:01:19.060481','2025-02-13 00:01:19.060481',21),(39,'2025-02-13',434317,'2025-02-18 01:21:46.072385','2025-02-13 00:43:08.679411','2025-02-13 00:43:08.679411',1),(40,'2025-02-18',16,'2025-02-18 01:21:46.072385','2025-02-18 01:21:29.992572','2025-02-18 01:21:29.992572',1),(41,'2025-02-18',48,'2025-02-18 01:22:39.615178','2025-02-18 01:21:51.577531','2025-02-18 01:21:51.577531',1),(42,'2025-02-18',429,'2025-02-18 01:29:55.711868','2025-02-18 01:22:45.844571','2025-02-18 01:22:45.844571',1),(43,'2025-02-18',984,'2025-02-18 01:46:51.188444','2025-02-18 01:30:26.749877','2025-02-18 01:30:26.749877',1),(44,'2025-02-18',201,'2025-02-18 01:50:17.122245','2025-02-18 01:46:55.850214','2025-02-18 01:46:55.849663',1),(45,'2025-02-18',51866,'2025-02-18 16:15:01.515205','2025-02-18 01:50:34.874682','2025-02-18 01:50:34.874682',1),(46,'2025-02-18',2372,'2025-02-18 16:54:39.614760','2025-02-18 16:15:07.548478','2025-02-18 16:15:07.548478',1),(47,'2025-02-18',171,'2025-02-18 16:57:51.640872','2025-02-18 16:54:59.682659','2025-02-18 16:54:59.682659',1),(48,'2025-02-18',16213,'2025-02-18 21:28:38.444472','2025-02-18 16:58:25.057629','2025-02-18 16:58:25.057629',1),(49,'2025-02-18',236,'2025-02-18 21:32:39.548132','2025-02-18 21:28:43.244550','2025-02-18 21:28:43.244550',1),(50,'2025-02-18',903,'2025-02-18 21:47:55.321721','2025-02-18 21:32:51.738205','2025-02-18 21:32:51.737671',1),(51,'2025-02-18',163,'2025-02-18 21:50:44.113197','2025-02-18 21:48:00.818212','2025-02-18 21:48:00.818212',1),(52,'2025-02-18',1341,'2025-02-18 22:13:23.959642','2025-02-18 21:51:02.560790','2025-02-18 21:51:02.560790',1),(53,'2025-02-18',17,'2025-02-18 22:31:27.424873','2025-02-18 22:31:10.101388','2025-02-18 22:31:10.101388',1),(54,'2025-02-18',15,'2025-02-18 22:33:04.171833','2025-02-18 22:32:48.694971','2025-02-18 22:32:48.694971',1),(55,'2025-02-18',12,'2025-02-18 22:37:44.538250','2025-02-18 22:37:31.814820','2025-02-18 22:37:31.814820',1),(56,'2025-02-18',438,'2025-02-18 22:47:41.660643','2025-02-18 22:40:23.160989','2025-02-18 22:40:23.160989',1),(57,'2025-02-18',12,'2025-02-18 22:49:53.131612','2025-02-18 22:49:40.660184','2025-02-18 22:49:40.660184',1),(58,'2025-02-18',12,'2025-02-18 22:52:55.663218','2025-02-18 22:52:43.307752','2025-02-18 22:52:43.307200',1),(59,'2025-02-18',14,'2025-02-18 23:04:21.515280','2025-02-18 23:04:07.303414','2025-02-18 23:04:07.303414',1),(60,'2025-02-18',14,'2025-02-18 23:06:06.542864','2025-02-18 23:05:51.929414','2025-02-18 23:05:51.929414',1),(61,'2025-02-18',130,'2025-02-18 23:08:24.623519','2025-02-18 23:06:13.784756','2025-02-18 23:06:13.784756',1),(62,'2025-02-18',78,'2025-02-18 23:09:50.094510','2025-02-18 23:08:32.078760','2025-02-18 23:08:32.078760',1),(63,'2025-02-18',1043,'2025-02-18 23:33:41.139083','2025-02-18 23:16:18.068857','2025-02-18 23:16:18.068857',1),(64,'2025-02-18',87527,'2025-02-20 00:00:00.024934','2025-02-18 23:41:12.787798','2025-02-18 23:41:12.787798',1),(65,'2025-02-21',83242,'2025-02-21 23:14:37.219993','2025-02-21 00:07:15.031909','2025-02-21 00:07:15.031909',1),(66,'2025-02-21',260154,'2025-02-25 00:00:00.080605','2025-02-21 23:44:05.379772','2025-02-21 23:44:05.379772',1),(67,'2025-02-22',258456,'2025-02-25 00:00:00.080605','2025-02-22 00:12:23.623528','2025-02-22 00:12:23.623528',1),(68,'2025-02-25',20089,'2025-02-26 00:00:00.072557','2025-02-25 18:25:10.556349','2025-02-25 18:25:10.556349',1),(69,'2025-02-25',22214,'2025-02-26 00:46:11.414924','2025-02-25 18:35:57.219443','2025-02-25 18:35:57.219443',2),(70,'2025-02-26',1886015,'2025-03-19 19:54:48.533753','2025-02-26 00:01:12.543891','2025-02-26 00:01:12.543891',1),(71,'2025-02-26',2160,'2025-02-26 00:46:11.414924','2025-02-26 00:10:10.555057','2025-02-26 00:10:10.555057',2),(72,'2025-02-26',7713,'2025-02-26 03:08:06.295926','2025-02-26 00:59:32.415661','2025-02-26 00:59:32.415661',2),(73,'2025-02-26',NULL,NULL,'2025-02-26 15:40:21.146922','2025-02-26 15:40:21.146922',25),(74,'2025-02-27',1799650,'2025-03-19 19:54:48.533753','2025-02-27 00:00:38.090399','2025-02-27 00:00:38.090399',1),(75,'2025-02-27',1799650,'2025-03-19 19:54:48.533753','2025-02-27 00:00:38.147897','2025-02-27 00:00:38.147897',1),(76,'2025-03-06',1113999,'2025-03-19 19:54:48.533753','2025-03-06 22:28:09.085130','2025-03-06 22:28:09.085130',1),(77,'2025-03-13',588074,'2025-03-19 19:54:48.533753','2025-03-13 00:33:33.850121','2025-03-13 00:33:33.850121',1),(78,'2025-03-15',361555,'2025-03-19 19:54:48.533753','2025-03-15 15:28:53.450483','2025-03-15 15:28:53.450483',1),(79,'2025-03-19',68,'2025-03-19 19:54:48.533753','2025-03-19 19:53:39.749036','2025-03-19 19:53:39.749036',1),(80,'2025-03-19',20601,'2025-03-20 01:38:14.705679','2025-03-19 19:54:53.433554','2025-03-19 19:54:53.433554',1),(81,'2025-03-20',1472,'2025-03-20 01:38:14.705679','2025-03-20 01:13:42.378279','2025-03-20 01:13:42.378279',1),(82,'2025-03-20',958,'2025-03-20 02:12:11.264064','2025-03-20 01:56:12.857882','2025-03-20 01:56:12.857882',1),(83,'2025-03-20',2469,'2025-03-20 02:56:21.424535','2025-03-20 02:15:11.431185','2025-03-20 02:15:11.431185',1),(84,'2025-03-20',40,'2025-03-20 02:57:08.316143','2025-03-20 02:56:27.374470','2025-03-20 02:56:27.374470',1),(85,'2025-03-20',40,'2025-03-20 02:57:08.316143','2025-03-20 02:56:27.382697','2025-03-20 02:56:27.382697',1),(86,'2025-03-20',40,'2025-03-20 02:57:08.316143','2025-03-20 02:56:27.372298','2025-03-20 02:56:27.372298',1),(87,'2025-03-20',11,'2025-03-20 02:57:23.973253','2025-03-20 02:57:12.478336','2025-03-20 02:57:12.478336',1),(88,'2025-03-20',11,'2025-03-20 02:57:23.973253','2025-03-20 02:57:12.478336','2025-03-20 02:57:12.478336',1),(89,'2025-03-20',11,'2025-03-20 02:57:23.973253','2025-03-20 02:57:12.483406','2025-03-20 02:57:12.483406',1),(90,'2025-03-20',13,'2025-03-20 02:58:19.005327','2025-03-20 02:58:05.813969','2025-03-20 02:58:05.813969',1),(91,'2025-03-20',1006,'2025-03-20 03:17:27.323280','2025-03-20 03:00:41.039783','2025-03-20 03:00:41.039783',1),(92,'2025-03-20',0,'2025-03-20 03:18:20.031627','2025-03-20 03:18:19.938581','2025-03-20 03:18:19.938581',1),(93,'2025-03-20',0,'2025-03-20 03:18:33.400706','2025-03-20 03:18:33.376932','2025-03-20 03:18:33.376932',1),(94,'2025-03-20',89,'2025-03-20 03:20:14.765067','2025-03-20 03:18:45.307486','2025-03-20 03:18:45.307486',1),(95,'2025-03-20',395,'2025-03-20 03:27:02.221822','2025-03-20 03:20:27.089455','2025-03-20 03:20:27.089455',1),(96,'2025-03-20',204,'2025-03-20 03:30:37.432573','2025-03-20 03:27:12.993803','2025-03-20 03:27:12.993803',1),(97,'2025-03-20',606,'2025-03-20 03:40:47.671141','2025-03-20 03:30:41.569616','2025-03-20 03:30:41.569616',1),(98,'2025-03-20',53979,'2025-03-20 18:40:46.300472','2025-03-20 03:41:06.434902','2025-03-20 03:41:06.434902',1),(99,'2025-03-20',643,'2025-03-20 18:51:29.845257','2025-03-20 18:40:46.567050','2025-03-20 18:40:46.567050',1),(100,'2025-03-20',2436,'2025-03-20 19:32:08.471226','2025-03-20 18:51:31.605360','2025-03-20 18:51:31.605360',1),(101,'2025-03-20',NULL,NULL,'2025-03-20 19:03:01.757045','2025-03-20 19:03:01.757045',32),(102,'2025-03-20',0,'2025-03-20 19:35:10.907648','2025-03-20 19:35:10.845719','2025-03-20 19:35:10.845719',1),(103,'2025-03-20',4692,'2025-03-20 20:59:17.755321','2025-03-20 19:41:05.556757','2025-03-20 19:41:05.556757',1),(104,'2025-03-20',1133,'2025-03-20 21:18:11.642523','2025-03-20 20:59:17.902429','2025-03-20 20:59:17.902429',1),(105,'2025-03-20',365,'2025-03-20 21:24:18.076313','2025-03-20 21:18:12.761593','2025-03-20 21:18:12.761593',1),(106,'2025-03-21',1760,'2025-03-21 19:22:21.109634','2025-03-21 18:53:00.769856','2025-03-21 18:53:00.769856',1),(107,'2025-03-21',159,'2025-03-21 19:25:03.076641','2025-03-21 19:22:23.804633','2025-03-21 19:22:23.804633',1),(108,'2025-03-21',159,'2025-03-21 19:25:03.076641','2025-03-21 19:22:23.804633','2025-03-21 19:22:23.804633',1),(109,'2025-03-21',159,'2025-03-21 19:25:03.076641','2025-03-21 19:22:23.811225','2025-03-21 19:22:23.811225',1),(110,'2025-03-21',3506,'2025-03-21 20:23:31.376537','2025-03-21 19:25:05.314634','2025-03-21 19:25:05.314634',1),(111,'2025-03-21',3506,'2025-03-21 20:23:31.376537','2025-03-21 19:25:05.318227','2025-03-21 19:25:05.318227',1),(112,'2025-03-21',3506,'2025-03-21 20:23:31.376537','2025-03-21 19:25:05.317640','2025-03-21 19:25:05.317640',1),(113,'2025-03-21',2087,'2025-03-21 20:58:21.447638','2025-03-21 20:23:33.520316','2025-03-21 20:23:33.520316',1),(114,'2025-03-21',NULL,NULL,'2025-03-21 20:58:26.026393','2025-03-21 20:58:26.026393',1),(115,'2025-03-21',NULL,NULL,'2025-03-21 20:58:26.024741','2025-03-21 20:58:26.024741',1),(116,'2025-03-21',NULL,NULL,'2025-03-21 20:58:26.043135','2025-03-21 20:58:26.043135',1);
/*!40000 ALTER TABLE `user_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_code`
--

DROP TABLE IF EXISTS `verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_code` (
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `validated_at` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgy5dhio3a6c9me7s0x9v1y4d2` (`user_id`),
  CONSTRAINT `FKgy5dhio3a6c9me7s0x9v1y4d2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_code`
--

LOCK TABLES `verification_code` WRITE;
/*!40000 ALTER TABLE `verification_code` DISABLE KEYS */;
INSERT INTO `verification_code` VALUES ('2024-12-30 20:02:16.515189','2024-12-30 20:17:16.515189',1,1,'2024-12-30 20:02:19.031269','565940'),('2025-02-12 00:07:55.452482','2025-02-12 00:22:55.452482',2,21,'2025-02-12 00:08:17.889223','442545'),('2025-02-18 21:29:13.742312','2025-02-18 21:44:13.742312',3,1,'2025-02-18 21:29:44.890703','486299'),('2025-02-18 21:33:03.548572','2025-02-18 21:48:03.548572',4,1,NULL,'575413'),('2025-02-18 21:34:16.090586','2025-02-18 21:49:16.090586',5,1,NULL,'613713'),('2025-02-18 21:43:18.177517','2025-02-18 21:58:18.178080',6,1,'2025-02-18 21:43:35.348570','172082'),('2025-02-18 21:48:08.832400','2025-02-18 22:03:08.832400',7,1,'2025-02-18 21:49:36.837835','220383'),('2025-02-18 22:12:36.903534','2025-02-18 22:27:36.903534',8,1,'2025-02-18 22:13:16.935076','898994'),('2025-02-18 22:31:13.653124','2025-02-18 22:46:13.653124',9,1,'2025-02-18 22:31:22.904599','994329'),('2025-02-18 22:32:51.443945','2025-02-18 22:47:51.443945',10,1,'2025-02-18 22:33:00.351182','362240'),('2025-02-18 22:37:36.678088','2025-02-18 22:52:36.678088',11,1,'2025-02-18 22:37:41.835301','762735'),('2025-02-18 22:47:32.628076','2025-02-18 23:02:32.628076',12,1,'2025-02-18 22:47:38.428579','185784'),('2025-02-18 22:49:43.746030','2025-02-18 23:04:43.746030',13,1,'2025-02-18 22:49:50.202609','987313'),('2025-02-18 22:52:48.097371','2025-02-18 23:07:48.097371',14,1,'2025-02-18 22:52:53.255481','513087'),('2025-02-18 23:04:13.005455','2025-02-18 23:19:13.005455',15,1,'2025-02-18 23:04:18.651064','081985'),('2025-02-18 23:05:58.938237','2025-02-18 23:20:58.938237',16,1,'2025-02-18 23:06:03.780740','409417'),('2025-02-18 23:08:18.038273','2025-02-18 23:23:18.038273',17,1,'2025-02-18 23:08:22.212717','346571'),('2025-02-18 23:09:39.913235','2025-02-18 23:24:39.913235',18,1,'2025-02-18 23:09:46.769427','309048'),('2025-02-18 23:09:56.274594','2025-02-18 23:24:56.274594',19,1,NULL,'965951'),('2025-02-18 23:11:20.604389','2025-02-18 23:26:20.604389',20,1,NULL,'644831'),('2025-02-18 23:13:08.371810','2025-02-18 23:28:08.371810',21,1,NULL,'343811'),('2025-02-18 23:14:32.425493','2025-02-18 23:29:32.425493',22,1,NULL,'178846'),('2025-02-18 23:16:17.948559','2025-02-18 23:31:17.948559',23,1,NULL,'840331'),('2025-02-18 23:16:30.963907','2025-02-18 23:31:30.963907',24,1,NULL,'072064'),('2025-02-18 23:21:03.514812','2025-02-18 23:36:03.514812',25,1,NULL,'704223'),('2025-02-18 23:21:29.718114','2025-02-18 23:36:29.718114',26,1,NULL,'517838'),('2025-02-18 23:23:26.158770','2025-02-18 23:38:26.158770',27,1,NULL,'688770'),('2025-02-18 23:24:31.838209','2025-02-18 23:39:31.838209',28,1,NULL,'338911'),('2025-02-18 23:25:29.155114','2025-02-18 23:40:29.155114',29,1,NULL,'804673'),('2025-02-18 23:27:52.905326','2025-02-18 23:42:52.905326',30,1,NULL,'095421'),('2025-02-18 23:29:13.809300','2025-02-18 23:44:13.809300',31,1,NULL,'574342'),('2025-02-18 23:30:20.613511','2025-02-18 23:45:20.613511',32,1,'2025-02-18 23:30:37.248176','272078'),('2025-02-18 23:30:50.397942','2025-02-18 23:45:50.398463',33,1,'2025-02-18 23:30:59.831606','003640'),('2025-02-18 23:33:44.741876','2025-02-18 23:48:44.741876',34,1,'2025-02-18 23:33:53.893549','323405'),('2025-02-18 23:35:25.818067','2025-02-18 23:50:25.818067',35,1,NULL,'314945'),('2025-02-18 23:38:27.180268','2025-02-18 23:53:27.180268',36,1,NULL,'856193'),('2025-02-18 23:40:15.066359','2025-02-18 23:55:15.066359',37,1,'2025-02-18 23:40:32.867475','838029'),('2025-02-18 23:41:02.534272','2025-02-18 23:56:02.534272',38,1,NULL,'723392'),('2025-02-18 23:41:16.262523','2025-02-18 23:56:16.262523',39,1,'2025-02-18 23:41:23.743820','085224'),('2025-02-25 23:10:38.068676','2025-02-25 23:25:38.068676',40,1,'2025-02-25 23:10:53.778654','038928'),('2025-02-26 15:33:44.868502','2025-02-26 15:48:44.868502',41,1,'2025-02-26 15:33:50.266129','386521'),('2025-03-06 22:28:35.584504','2025-03-06 22:43:35.584504',42,1,'2025-03-06 22:28:46.183509','257331'),('2025-03-13 00:33:51.499900','2025-03-13 00:48:51.499900',43,1,'2025-03-13 00:33:57.761425','017180'),('2025-03-15 15:29:05.355670','2025-03-15 15:44:05.355670',44,1,'2025-03-15 15:29:10.724461','638647'),('2025-03-19 19:54:56.282616','2025-03-19 20:09:56.282616',45,1,'2025-03-19 19:55:03.372882','138579'),('2025-03-20 01:13:52.297458','2025-03-20 01:28:52.297458',46,1,'2025-03-20 01:13:57.536280','119569'),('2025-03-20 01:14:47.423866','2025-03-20 01:29:47.423866',47,1,'2025-03-20 01:14:52.528736','263855'),('2025-03-20 03:19:39.180083','2025-03-20 03:34:39.180083',48,1,'2025-03-20 03:19:44.337891','076213'),('2025-03-20 03:20:35.397988','2025-03-20 03:35:35.398625',49,1,'2025-03-20 03:20:43.236426','486650'),('2025-03-20 03:27:34.418988','2025-03-20 03:42:34.418988',50,1,'2025-03-20 03:27:42.906054','199400'),('2025-03-20 03:30:52.165149','2025-03-20 03:45:52.165149',51,1,NULL,'759619'),('2025-03-20 03:31:26.134118','2025-03-20 03:46:26.134118',52,1,NULL,'168429'),('2025-03-20 03:33:05.786874','2025-03-20 03:48:05.786874',53,1,'2025-03-20 03:33:10.461148','699966'),('2025-03-20 03:35:25.107495','2025-03-20 03:50:25.107495',54,1,'2025-03-20 03:35:31.074133','852910'),('2025-03-20 03:37:47.667085','2025-03-20 03:52:47.667085',55,1,'2025-03-20 03:38:02.104525','762061'),('2025-03-20 03:41:08.786407','2025-03-20 03:56:08.786407',56,1,'2025-03-20 03:41:15.096931','205596');
/*!40000 ALTER TABLE `verification_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-22 18:09:15
