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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (42,53,2,1,'disapproved','2020-08-23','2020-08-28',6),(43,53,2,1,'disapproved','2020-08-23','2020-08-28',6),(45,45,2,1,'pending approval','2020-08-25','2020-08-29',5),(46,45,2,1,'disapproved','2020-08-25','2020-08-26',2),(47,45,2,1,'pending approval','2020-08-25','2020-08-26',2),(71,41,11,1,'pending approval','2021-05-25','2021-06-16',24),(72,41,11,1,'pending approval','2021-05-25','2021-06-16',24),(74,53,2,1,'approved','2020-08-30','2020-09-03',6),(85,53,2,1,'approved','2020-09-13','2020-09-20',8),(86,87,2,1,'approved','2020-09-15','2020-09-21',7),(87,87,2,1,'approved','2020-10-11','2020-10-16',6),(88,57,2,5,'approved','2020-09-07','2020-09-20',14),(89,57,2,1,'approved','2020-10-04','2020-10-16',13),(90,58,2,1,'approved','2020-09-09','2020-09-14',6),(91,58,2,1,'approved','2020-10-01','2020-10-17',17),(92,45,2,1,'approved','2020-09-15','2020-09-22',8);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
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
  `favcolor` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `users_ibfk_1` (`department_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (41,11,3,'Claudia','Muscalu','admin@yahoo.ro','089896e9394d11bfc75907bbbf063558d71b949376dd531a351ee465108874f32fb2d33e94efee278614c737b45310ca5132ae4c9a33b3fe2b2d59faffcd8134','CEO',41,0,0,0,'#e1ff00 '),(43,6,2,'Alexandra','Donici','alexandra@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#26541d '),(44,1,2,'Constatin','Romano','constantin.romano@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Sales Manager',44,30,3,0,'#f27d7d'),(45,2,2,'Ana-Maria','Asmarandei','ana.asmarandei@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','HR Consultant',45,22,2,0,'#00ff08 '),(46,4,2,'Lavinia','Nour','lavinia.nour@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Marketing Specialist',46,30,3,0,'#1E2EDE'),(47,5,2,'Laura','Cozma','laura.cozma@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Design Specialist',47,30,3,0,'#6A041D'),(48,7,2,'Andrei','Manolache','andrei.manolache@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Tester',48,30,3,0,'#F5B841'),(49,8,2,'Alex','Maftei','alex.maftei@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Accounting Manager',49,30,3,0,'#1E2EDE'),(50,9,2,'Oana','Todirica','oana.todirica@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Research Manager',50,30,3,0,'#00ffcc '),(51,10,2,'Vlad','Dimisca','vlad.dimisca@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Operations Manager',51,30,3,0,NULL),(52,1,1,'Petronela','Neacsu','petronela.neacsu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Sales Analyst',44,30,3,0,NULL),(53,2,1,'Ioana','Buzau','ioana.buzau@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','HR Analyst',45,22,2,1,'#ffa200 '),(54,1,1,'Ciobanu','Razvan','razvan.ciobanu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Sales Analyst',44,30,3,0,NULL),(55,1,1,'Irina','Sandu','irina.sandu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Sales Representative',44,30,3,0,NULL),(56,1,1,'Ana','Cojocariu','ana.cojocariu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Sales Operations Analyst',44,30,3,0,NULL),(57,2,1,'Irina','Francu','irina.francu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','HR Recruiter ',45,3,1,0,'#f71d1d  '),(58,2,1,'Iasmina','Pal','iasmina.pal@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','HR Generalist',45,7,1,0,'#fbff00 '),(59,4,1,'Andreea','Nicolae','andreea.nicolae@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Marketing Specialist',46,30,3,0,NULL),(60,4,1,'Sabina','Rotaru','sabina.rotaru@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Marketing Illustrator',46,30,3,0,NULL),(61,4,1,'Vlad','Negoescu','vlad.negoescu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Online Marketing Specialist',46,30,3,0,NULL),(62,5,1,'Vlad','Avadanei','vlad.avadanei@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Graphic Designer',47,30,3,0,NULL),(63,5,1,'Ionut','Cezar','ionut.cezar@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','3D Designer',47,30,3,0,NULL),(64,5,1,'Adina','Soltuz','adina.soltuz@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Desenator CAD',47,30,3,0,NULL),(65,6,1,'Diana','Plai','diana.plai@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#f27d7d'),(66,6,1,'Ioana','Burca','ioana.burca@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#7300ff '),(67,6,1,'Monica','Martinas','monica.martinas@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#753e3e '),(68,6,1,'Matei','Tizu','matei.tizu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#0033ff '),(69,6,1,'Elvin','Ghiuzdan','elvin.ghiuzdan@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#00e1ff '),(70,6,1,'Alin','Danca','alin.danca@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#62198a '),(71,6,1,'Giuliano','Dumitru','giuliano.dumitru@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#ff8800 '),(72,6,1,'Cosmin','Lapusneanu','cosmin.lapusneanu@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#fff700 '),(73,6,1,'Codrin','Lebada','codrin.lebada@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#ff00f7 '),(74,6,1,'George','Apetrei','george.apetrei@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#59034e '),(75,8,1,'Alex','Andries','alex.andries@techsys.ro','089896e9394d11bfc75907bbbf063558d71b949376dd531a351ee465108874f32fb2d33e94efee278614c737b45310ca5132ae4c9a33b3fe2b2d59faffcd8134','Developer',41,30,3,0,'#0091ff '),(83,5,1,'test','test','test@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Assistent',47,30,3,1,NULL),(84,19,1,'test1','test1','test1@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','aaa',68,30,3,0,NULL),(85,6,1,'Alex','Andries','alex.andries@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#665757 '),(86,6,1,'George','Glod','george.glod@techsys.ro','c5ded4642ddbf832a5eff64b608510dda4ba3841cb997df1b69fd4042232b577e80be7755b697419062ca598d3ba51abcd4426ff0c92ae651f989cb80e550b5e','Developer',43,30,3,0,'#001eff'),(87,2,1,'Lazar','Constantin','lazar.constantin@techsys.ro','d690466e170ff3f256a0d76678bdfddf73fe19b964c5ff1b8f466d9ef7d721dc9c29c409caf74862ed228a06e8f8bab3aaab475265b0f04cc436632160f0cd6c','Sale ',45,17,1,0,'#4659b9');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `waits_global_by_latency`
--

DROP TABLE IF EXISTS `waits_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `waits_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waits_global_by_latency` AS SELECT 
 1 AS `events`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_by_host_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_by_host_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_by_host_by_current_bytes` AS SELECT 
 1 AS `host`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'sys'
--

--
-- Final view structure for view `waits_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `waits_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `waits_global_by_latency` (`events`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_by_host_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_by_host_by_current_bytes` (`host`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_host_by_event_name` group by if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-31 22:58:21
