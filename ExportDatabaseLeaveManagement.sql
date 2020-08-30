-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sys
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_id_UNIQUE` (`department_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Sales',44),(2,'HR',45),(4,'Marketing',46),(5,'Design',47),(6,'Development',43),(7,'Testing',48),(8,'',41),(9,'Research',50),(10,'Operations',51),(11,'CEO',41),(19,'TEST',68);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `leave_type_code` int DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `period` int DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `requests_ibfk_1` (`department_id`),
  KEY `requests_ibfk_2` (`user_id`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (42,53,2,1,'disapproved','2020-08-23','2020-08-28',6),(43,53,2,1,'disapproved','2020-08-23','2020-08-28',6),(44,45,2,5,'approved','2020-08-31','2020-09-05',6),(45,45,2,1,'pending approval','2020-08-25','2020-08-29',5),(46,45,2,1,'disapproved','2020-08-25','2020-08-26',2),(47,45,2,1,'pending approval','2020-08-25','2020-08-26',2),(71,41,11,1,'pending approval','2021-05-25','2021-06-16',24),(72,41,11,1,'pending approval','2021-05-25','2021-06-16',24),(73,53,2,1,'approved','2021-06-04','2021-06-09',7),(74,53,2,1,'pending approval','2020-08-30','2020-09-03',6),(75,53,2,1,'approved','2021-05-27','2021-06-05',11),(76,53,2,5,'pending approval','2021-06-07','2021-06-17',12),(77,53,2,1,'pending approval','2021-06-27','2021-07-06',10),(78,45,2,1,'approved','2020-11-02','2020-11-11',10),(79,83,5,1,'approved','2021-05-27','2021-06-03',8),(80,53,2,1,'pending approval','2020-09-01','2020-09-14',14),(81,53,2,1,'pending approval','2020-09-03','2020-09-15',13),(82,53,2,1,'pending approval','2020-09-03','2020-09-13',11),(83,53,2,1,'pending approval','2020-09-01','2020-09-14',14),(84,53,2,1,'pending approval','2020-08-31','2020-09-06',7);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_leave`
--

DROP TABLE IF EXISTS `type_of_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_leave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `leave_type_code_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_leave`
--

LOCK TABLES `type_of_leave` WRITE;
/*!40000 ALTER TABLE `type_of_leave` DISABLE KEYS */;
INSERT INTO `type_of_leave` VALUES (1,'Casual Leave'),(3,'Unpaid Leave'),(4,'Sick Leave'),(5,'Public Holiday');
/*!40000 ALTER TABLE `type_of_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_user`
--

DROP TABLE IF EXISTS `type_of_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_user` (
  `user_type_code` int NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_type_code`),
  UNIQUE KEY `user_type_code_UNIQUE` (`user_type_code`),
  UNIQUE KEY `user_type_name_UNIQUE` (`user_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_user`
--

LOCK TABLES `type_of_user` WRITE;
/*!40000 ALTER TABLE `type_of_user` DISABLE KEYS */;
INSERT INTO `type_of_user` VALUES (3,'Admin'),(2,'Manager'),(1,'Worker');
/*!40000 ALTER TABLE `type_of_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `department_id` int DEFAULT NULL,
  `user_type_code` int DEFAULT NULL,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(5000) DEFAULT NULL,
  `job_name` varchar(100) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `days_left` int DEFAULT '30',
  `periods_left` int DEFAULT '3',
  `holiday1June31August` int DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `users_ibfk_1` (`department_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (41,11,3,'Claudia','Muscalu','admin@yahoo.ro','089896e9394d11bfc75907bbbf063558d71b949376dd531a351ee465108874f32fb2d33e94efee278614c737b45310ca5132ae4c9a33b3fe2b2d59faffcd8134','CEO',41,0,0,0),(43,6,2,'Alexandra','Donici','alexandra@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(44,1,2,'Constatin','Romano','constantin.romano@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Sales Manager',44,30,3,0),(45,2,2,'Ana-Maria','Asmarandei','ana.asmarandei@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','HR Consultant',45,20,2,0),(46,4,2,'Lavinia','Nour','lavinia.nour@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Marketing Specialist',46,30,3,0),(47,5,2,'Laura','Cozma','laura.cozma@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Design Specialist',47,30,3,0),(48,7,2,'Andrei','Manolache','andrei.manolache@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Tester',48,30,3,0),(49,8,2,'Alex','Maftei','alex.maftei@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Accounting Manager',49,30,3,0),(50,9,2,'Oana','Todirica','oana.todirica@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Research Manager',50,30,3,0),(51,10,2,'Vlad','Dimisca','vlad.dimisca@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Operations Manager',51,30,3,0),(52,1,1,'Petronela','Neacsu','petronela.neacsu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Sales Analyst',44,30,3,0),(53,2,1,'Ioana','Buzau','ioana.buzau@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','HR Analyst',45,9,1,1),(54,1,1,'Ciobanu','Razvan','razvan.ciobanu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Sales Analyst',44,30,3,0),(55,1,1,'Irina','Sandu','irina.sandu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Sales Representative',44,30,3,0),(56,1,1,'Ana','Cojocariu','ana.cojocariu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Sales Operations Analyst',44,30,3,0),(57,2,1,'Irina','Francu','irina.francu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','HR Recruiter ',45,30,3,0),(58,2,1,'Iasmina','Pal','iasmina.pal@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','HR Generalist',45,30,3,0),(59,4,1,'Andreea','Nicolae','andreea.nicolae@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Marketing Specialist',46,30,3,0),(60,4,1,'Sabina','Rotaru','sabina.rotaru@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Marketing Illustrator',46,30,3,0),(61,4,1,'Vlad','Negoescu','vlad.negoescu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Online Marketing Specialist',46,30,3,0),(62,5,1,'Vlad','Avadanei','vlad.avadanei@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Graphic Designer',47,30,3,0),(63,5,1,'Ionut','Cezar','ionut.cezar@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','3D Designer',47,30,3,0),(64,5,1,'Adina','Soltuz','adina.soltuz@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Desenator CAD',47,30,3,0),(65,6,1,'Diana','Plai','diana.plai@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(66,6,1,'Ioana','Burca','ioana.burca@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(67,6,1,'Monica','Martinas','monica.martinas@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(68,6,1,'Matei','Tizu','matei.tizu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(69,6,1,'Elvin','Ghiuzdan','elvin.ghiuzdan@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(70,6,1,'Alin','Danca','alin.danca@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(71,6,1,'Giuliano','Dumitru','giuliano.dumitru@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(72,6,1,'Cosmin','Lapusneanu','cosmin.lapusneanu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(73,6,1,'Codrin','Lebada','codrin.lebada@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(74,6,1,'George','Apetrei','george.apetrei@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0),(75,8,1,'Alex','Andries','alex.andries@techsys.ro','089896e9394d11bfc75907bbbf063558d71b949376dd531a351ee465108874f32fb2d33e94efee278614c737b45310ca5132ae4c9a33b3fe2b2d59faffcd8134','Developer',41,30,3,0),(83,5,1,'test','test','test@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Assistent',47,22,2,1),(84,19,1,'test1','test1','test1@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','aaa',68,30,3,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sys'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-30 21:29:09
