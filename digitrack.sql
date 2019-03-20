CREATE DATABASE  IF NOT EXISTS `digitrack` /*!40100 DEFAULT CHARACTER SET cp850 */;
USE `digitrack`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: digitrack
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
-- Table structure for table `action_plan`
--

DROP TABLE IF EXISTS `action_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `action_plan` (
  `rec_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `importance` smallint(6) NOT NULL,
  `criticality_type` smallint(6) NOT NULL,
  `notification_interval` smallint(6) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `action_plan_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `notification_interval` (`notification_interval`),
  KEY `status` (`status`),
  KEY `importance` (`importance`),
  KEY `criticality_type` (`criticality_type`),
  KEY `owner` (`owner`),
  KEY `manager` (`manager`),
  KEY `node` (`node`),
  CONSTRAINT `action_plan_ibfk_1` FOREIGN KEY (`notification_interval`) REFERENCES `notification_interval` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `action_plan_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `action_plan_ibfk_3` FOREIGN KEY (`importance`) REFERENCES `importance` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `action_plan_ibfk_4` FOREIGN KEY (`criticality_type`) REFERENCES `criticality_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `action_plan_ibfk_5` FOREIGN KEY (`owner`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `action_plan_ibfk_6` FOREIGN KEY (`manager`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `action_plan_ibfk_7` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_plan`
--

LOCK TABLES `action_plan` WRITE;
/*!40000 ALTER TABLE `action_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_plan_action`
--

DROP TABLE IF EXISTS `action_plan_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `action_plan_action` (
  `rec_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `action_status` varchar(255) DEFAULT NULL,
  `action_plan` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `action_plan` (`action_plan`),
  KEY `status` (`status`),
  CONSTRAINT `action_plan_action_ibfk_1` FOREIGN KEY (`action_plan`) REFERENCES `action_plan` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `action_plan_action_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_plan_action`
--

LOCK TABLES `action_plan_action` WRITE;
/*!40000 ALTER TABLE `action_plan_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_plan_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_type`
--

DROP TABLE IF EXISTS `activity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `activity_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_type`
--

LOCK TABLES `activity_type` WRITE;
/*!40000 ALTER TABLE `activity_type` DISABLE KEYS */;
INSERT INTO `activity_type` VALUES (1,'Alpha'),(2,'Predecessor'),(3,'Successor'),(4,'Omega');
/*!40000 ALTER TABLE `activity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL DEFAULT '0',
  `address_code` int(11) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `address_line_3` varchar(255) DEFAULT NULL,
  `address_line_4` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_minute`
--

DROP TABLE IF EXISTS `agenda_minute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agenda_minute` (
  `rec_id` int(11) NOT NULL,
  `meeting_agenda` int(11) DEFAULT NULL,
  `minute` varchar(1024) DEFAULT NULL,
  `agenda_minute_status` varchar(25) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  KEY `meeting_agenda` (`meeting_agenda`),
  CONSTRAINT `agenda_minute_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agenda_minute_ibfk_2` FOREIGN KEY (`meeting_agenda`) REFERENCES `meeting_agenda` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_minute`
--

LOCK TABLES `agenda_minute` WRITE;
/*!40000 ALTER TABLE `agenda_minute` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda_minute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_resolution`
--

DROP TABLE IF EXISTS `agenda_resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agenda_resolution` (
  `rec_id` int(11) NOT NULL,
  `assignee` varchar(255) DEFAULT NULL,
  `trackbase_type` int(11) DEFAULT NULL,
  `trackbase_id` int(11) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `meeting_agenda` int(11) DEFAULT NULL,
  `resolution` varchar(1024) DEFAULT NULL,
  `resolution_status` varchar(25) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  KEY `meeting_agenda` (`meeting_agenda`),
  KEY `trackbase_type` (`trackbase_type`),
  KEY `end_game` (`end_game`),
  KEY `assignee` (`assignee`),
  CONSTRAINT `agenda_resolution_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agenda_resolution_ibfk_2` FOREIGN KEY (`meeting_agenda`) REFERENCES `meeting_agenda` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agenda_resolution_ibfk_3` FOREIGN KEY (`trackbase_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agenda_resolution_ibfk_4` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agenda_resolution_ibfk_5` FOREIGN KEY (`assignee`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_resolution`
--

LOCK TABLES `agenda_resolution` WRITE;
/*!40000 ALTER TABLE `agenda_resolution` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda_resolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_resolution_assignee`
--

DROP TABLE IF EXISTS `agenda_resolution_assignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agenda_resolution_assignee` (
  `rec_id` int(11) NOT NULL,
  `agenda_resolution` int(11) DEFAULT NULL,
  `assignee_id` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  KEY `agenda_resolution` (`agenda_resolution`),
  CONSTRAINT `agenda_resolution_assignee_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agenda_resolution_assignee_ibfk_2` FOREIGN KEY (`agenda_resolution`) REFERENCES `agenda_resolution` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_resolution_assignee`
--

LOCK TABLES `agenda_resolution_assignee` WRITE;
/*!40000 ALTER TABLE `agenda_resolution_assignee` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda_resolution_assignee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_method`
--

DROP TABLE IF EXISTS `application_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `application_method` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_method`
--

LOCK TABLES `application_method` WRITE;
/*!40000 ALTER TABLE `application_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_status`
--

DROP TABLE IF EXISTS `application_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `application_status` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_status`
--

LOCK TABLES `application_status` WRITE;
/*!40000 ALTER TABLE `application_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asset` (
  `rec_id` int(11) NOT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `trackbase_type` int(11) DEFAULT NULL,
  `trackbase_id` int(11) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `current_value` decimal(10,0) DEFAULT NULL,
  `date_acquired` datetime DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `model_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `importance` smallint(6) NOT NULL,
  `criticality_type` smallint(6) NOT NULL,
  `infrastructure` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `manager` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `infrastructure` (`infrastructure`),
  KEY `status` (`status`),
  KEY `importance` (`importance`),
  KEY `criticality_type` (`criticality_type`),
  KEY `owner` (`owner`),
  KEY `manager` (`manager`),
  KEY `trackpoint_node` (`trackpoint_node`),
  KEY `trackbase_type` (`trackbase_type`),
  KEY `end_game` (`end_game`),
  KEY `trackpoint_user` (`trackpoint_user`),
  CONSTRAINT `asset_ibfk_1` FOREIGN KEY (`infrastructure`) REFERENCES `infrastructure` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_ibfk_10` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `asset_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_ibfk_3` FOREIGN KEY (`importance`) REFERENCES `importance` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_ibfk_4` FOREIGN KEY (`criticality_type`) REFERENCES `criticality_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_ibfk_5` FOREIGN KEY (`owner`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_ibfk_6` FOREIGN KEY (`manager`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_ibfk_7` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_ibfk_8` FOREIGN KEY (`trackbase_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_ibfk_9` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_provider`
--

DROP TABLE IF EXISTS `asset_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asset_provider` (
  `rec_id` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `fax_no` varchar(255) DEFAULT NULL,
  `contact_person_fullnames` varchar(255) DEFAULT NULL,
  `contact_person_email` varchar(255) DEFAULT NULL,
  `contact_person_mobile_no` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `reg_no` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `telephone_no` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `province` smallint(6) NOT NULL,
  `postal_address_code` smallint(6) DEFAULT NULL,
  `postal_address_line_one` varchar(255) DEFAULT NULL,
  `postal_address_line_two` varchar(255) DEFAULT NULL,
  `postal_address_line_three` varchar(255) DEFAULT NULL,
  `physical_address_code` smallint(6) DEFAULT NULL,
  `physical_address_line_one` varchar(255) DEFAULT NULL,
  `physical_address_line_two` varchar(255) DEFAULT NULL,
  `physical_address_line_three` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  CONSTRAINT `asset_provider_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_provider`
--

LOCK TABLES `asset_provider` WRITE;
/*!40000 ALTER TABLE `asset_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_objective`
--

DROP TABLE IF EXISTS `business_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `business_objective` (
  `rec_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_objective`
--

LOCK TABLES `business_objective` WRITE;
/*!40000 ALTER TABLE `business_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_app_exception`
--

DROP TABLE IF EXISTS `c_app_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c_app_exception` (
  `rec_id` int(11) NOT NULL DEFAULT '0',
  `exception_timestamp` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `parameter_map` varchar(255) DEFAULT NULL,
  `stack_trace` varchar(1024) DEFAULT NULL,
  `uri_requested` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_app_exception`
--

LOCK TABLES `c_app_exception` WRITE;
/*!40000 ALTER TABLE `c_app_exception` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_app_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_document_purpose`
--

DROP TABLE IF EXISTS `c_document_purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c_document_purpose` (
  `rec_id` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT 'active',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_document_purpose`
--

LOCK TABLES `c_document_purpose` WRITE;
/*!40000 ALTER TABLE `c_document_purpose` DISABLE KEYS */;
INSERT INTO `c_document_purpose` VALUES (1,NULL,'storage','active'),(2,NULL,'routing to hod','active');
/*!40000 ALTER TABLE `c_document_purpose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_document_type`
--

DROP TABLE IF EXISTS `c_document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c_document_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_document_type`
--

LOCK TABLES `c_document_type` WRITE;
/*!40000 ALTER TABLE `c_document_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_object_type`
--

DROP TABLE IF EXISTS `c_object_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c_object_type` (
  `rec_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT 'active',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_object_type`
--

LOCK TABLES `c_object_type` WRITE;
/*!40000 ALTER TABLE `c_object_type` DISABLE KEYS */;
INSERT INTO `c_object_type` VALUES (1,NULL,'document','active'),(2,NULL,'meeting','active'),(3,NULL,'task','active'),(4,NULL,'action','active'),(5,NULL,'process','active'),(6,NULL,'process step','active'),(7,NULL,'resolution','active'),(8,NULL,'project','active'),(9,NULL,'milestone','active'),(10,NULL,'query','active'),(11,NULL,'timeline ','active'),(12,NULL,'sequence','active'),(13,NULL,'action plan','active'),(14,NULL,'checklist ','active'),(15,NULL,'sla','active'),(16,NULL,'policy','active'),(17,NULL,'asset','active'),(18,NULL,'quote','active'),(19,NULL,'invoice','active'),(20,NULL,'business letter','active'),(21,NULL,'submission requisition ','active'),(22,NULL,'annual report','active'),(23,NULL,'operational plan','active'),(24,NULL,'annual performance plan','active'),(25,NULL,'proposal','active'),(26,NULL,'job application ','active'),(27,NULL,'registry files','active'),(28,NULL,'risk','active'),(29,NULL,'expenditure','active'),(30,NULL,'meeting resolution','active'),(31,NULL,'service request','active'),(32,NULL,'end game','active'),(33,NULL,'business objective','active'),(34,NULL,'priority','active'),(35,NULL,'sequence','active'),(36,NULL,'sequence step','active'),(37,NULL,'sequence step activity','active');
/*!40000 ALTER TABLE `c_object_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_objective`
--

DROP TABLE IF EXISTS `c_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c_objective` (
  `rec_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `code_value` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `FK_c_objective` (`node`),
  CONSTRAINT `FK_c_objective` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_objective`
--

LOCK TABLES `c_objective` WRITE;
/*!40000 ALTER TABLE `c_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_property`
--

DROP TABLE IF EXISTS `c_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c_property` (
  `group_id` varchar(255) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `encrypt_ind` varchar(255) DEFAULT NULL,
  `property_value` varchar(255) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`,`property_name`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_property`
--

LOCK TABLES `c_property` WRITE;
/*!40000 ALTER TABLE `c_property` DISABLE KEYS */;
INSERT INTO `c_property` VALUES ('core','alert.callout.email','n','notify@epwp.cloud',NULL),('core','authenticate','n','y',NULL),('core','authenticate.method','n','local',NULL),('core','environment','n','development',NULL),('core','file.upload.dir','n','/home/ubuntu/webappfilesystem/digitrack',NULL),('core','server.url','n','http://localhost:6080',NULL),('mail','mail.from.noreply','n','notify@epwp.cloud',NULL),('mail','mail.password','n','cumlaude##1012',NULL),('mail','mail.smtp.host','n','smtp.gmail.com',NULL),('mail','mail.smtp.port','n','587',NULL),('mail','mail.user','n','notify@epwp.cloud',NULL),('report.template','admin.technical.support','n','admintechnicalsupportreport.jasper',NULL),('report.template','consolidated.placement','n','consolidatedplacementreport.jasper',NULL),('report.template','detailed.posts','n','detailedpostsreport.jasper',NULL),('report.template','dt.report.logo','n','c:tempwebappfilesystemdoctracker\reporttemplatesdt.jpg',NULL),('report.template','gauteng.coa.logo','n','c:tempwebappfilesystemprovinces_coagauteng.png',NULL),('report.template','incident.report','n','incidentreport.jasper',NULL),('report.template','interventions.report','n','interventionsreport.jasper',NULL),('report.template','long.list.report','n','dtclonglistreport.jasper',NULL),('report.template','staff.report','n','dtcstaffreport.jasper',NULL),('template','password.reset.template','n','resetpassword.html',NULL),('template','password.uuid.reset.template','n','uuidresetpassword.html',NULL),('template','template.base.dir','n','/home/ubuntu/webappfilesystem/digitrack/emailtemplates',NULL),('template','template.footer','n','emailfooterimage.jpg',NULL),('template','template.header','n','emailheaderimage.png',NULL),('template','verify.reg.template','n','registrationvalidation.html',NULL),('user','user.store.dir','n','c:sandbox',NULL);
/*!40000 ALTER TABLE `c_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role`
--

DROP TABLE IF EXISTS `c_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c_role` (
  `role_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role`
--

LOCK TABLES `c_role` WRITE;
/*!40000 ALTER TABLE `c_role` DISABLE KEYS */;
INSERT INTO `c_role` VALUES (1,'user with all priveleges to the application','super.user',1),(2,'admin','admin',1),(3,'support','support',1),(4,'asset owner','asset.owner',1),(5,'asset manager','asset.manager',1),(6,'infrastructure owner','infrastructure.owner',1),(7,'infrastructure manager','infrastructure.manager',1),(8,'internal service provider','internal.service.provider',1),(9,'external service providers','external.service.provider',1),(10,'team leader','team.leader',1),(11,'project manager','project.manager',1),(12,'supply chain','supply.chain',1);
/*!40000 ALTER TABLE `c_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_user`
--

DROP TABLE IF EXISTS `c_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c_user` (
  `user_id` varchar(255) NOT NULL,
  `account_status` varchar(255) DEFAULT NULL,
  `date_email_verified` datetime DEFAULT NULL,
  `date_last_successful_login` datetime DEFAULT NULL,
  `date_password_request` datetime DEFAULT NULL,
  `date_registered` datetime DEFAULT NULL,
  `employee_ind` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_request_from_ip` varchar(255) DEFAULT NULL,
  `registration_key` varchar(255) DEFAULT NULL,
  `temp_password` varchar(255) DEFAULT NULL,
  `verified_from_ip` varchar(255) DEFAULT NULL,
  `wrong_password_retry_count` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `disability` varchar(255) DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL,
  `identification_no` varchar(16) DEFAULT NULL,
  `initials` varchar(255) DEFAULT NULL,
  `first_names` varchar(255) DEFAULT NULL,
  `nationality` smallint(6) NOT NULL,
  `race` smallint(6) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `telephone_no` varchar(255) DEFAULT NULL,
  `employee_no` varchar(250) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `account_authorized_ind` varchar(125) DEFAULT 'n',
  `uuid` varchar(512) DEFAULT NULL,
  `date_uuid_request` datetime DEFAULT NULL,
  `province` smallint(6) NOT NULL,
  `postal_address_code` smallint(6) DEFAULT NULL,
  `postal_address_line_one` varchar(255) DEFAULT NULL,
  `postal_address_line_two` varchar(255) DEFAULT NULL,
  `postal_address_line_three` varchar(255) DEFAULT NULL,
  `physical_address_code` smallint(6) DEFAULT NULL,
  `physical_address_line_one` varchar(255) DEFAULT NULL,
  `physical_address_line_two` varchar(255) DEFAULT NULL,
  `physical_address_line_three` varchar(255) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_start_datetime` datetime DEFAULT NULL,
  `token_end_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `race` (`race`),
  KEY `nationality` (`nationality`),
  CONSTRAINT `c_user_ibfk_1` FOREIGN KEY (`race`) REFERENCES `race` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_user_ibfk_2` FOREIGN KEY (`nationality`) REFERENCES `nationality` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_user`
--

LOCK TABLES `c_user` WRITE;
/*!40000 ALTER TABLE `c_user` DISABLE KEYS */;
INSERT INTO `c_user` VALUES ('nhlalucky9@gmail.com','active',NULL,'2018-11-05 20:51:29',NULL,NULL,'n','nhlalucky9@gmail.com','0734084441','c4ca4238a0b92382dcc509a6f75849b',NULL,'c4ca4238a0b92382dcc509a6f75849b',NULL,NULL,0,NULL,NULL,1,NULL,'L','Lucky',1,1,'Hlakaza',NULL,'0000',NULL,'0',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'c1115793-3bb2-43e4-a3e9-7806c8ab8b21','2018-11-05 20:51:29','2018-11-06 04:51:29'),('p.sibanda@gmail.com','active',NULL,'2018-11-06 08:11:06',NULL,NULL,'n','p.sibanda@gmail.com','0738396920','c4ca4238a0b92382dcc509a6f75849b',NULL,'c4ca4238a0b92382dcc509a6f75849b',NULL,NULL,0,NULL,NULL,1,NULL,'p','phathi',1,1,'sibanda',NULL,NULL,NULL,'n',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'4aee4340-421b-4d12-a5ea-8952bd2c75dc','2018-11-06 08:11:06','2018-11-06 16:11:06'),('tebogomolusi@gmail.com','active',NULL,NULL,NULL,NULL,'n',NULL,'0824570492','c4ca4238a0b92382dcc509a6f75849b',NULL,'c4ca4238a0b92382dcc509a6f75849b',NULL,NULL,NULL,NULL,NULL,1,NULL,'tm','tebogo',1,1,'molusi',NULL,NULL,NULL,'n',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `c_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_user_role`
--

DROP TABLE IF EXISTS `c_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_c_user_role_1` (`role_id`),
  KEY `fk_c_user_role_2` (`user_id`),
  CONSTRAINT `fk_c_user_role_1` FOREIGN KEY (`role_id`) REFERENCES `c_role` (`role_id`),
  CONSTRAINT `fk_c_user_role_2` FOREIGN KEY (`user_id`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_user_role`
--

LOCK TABLES `c_user_role` WRITE;
/*!40000 ALTER TABLE `c_user_role` DISABLE KEYS */;
INSERT INTO `c_user_role` VALUES (1,'nhlalucky9@gmail.com'),(1,'p.sibanda@gmail.com'),(1,'tebogomolusi@gmail.com'),(2,'nhlalucky9@gmail.com'),(2,'p.sibanda@gmail.com'),(2,'tebogomolusi@gmail.com'),(3,'nhlalucky9@gmail.com'),(3,'p.sibanda@gmail.com'),(3,'tebogomolusi@gmail.com');
/*!40000 ALTER TABLE `c_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `checklist` (
  `rec_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `importance` smallint(6) NOT NULL,
  `criticality_type` smallint(6) NOT NULL,
  `notification_interval` smallint(6) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `alpha_node` int(11) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `checklist_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `notification_interval` (`notification_interval`),
  KEY `status` (`status`),
  KEY `importance` (`importance`),
  KEY `criticality_type` (`criticality_type`),
  KEY `owner` (`owner`),
  KEY `manager` (`manager`),
  KEY `node` (`node`),
  KEY `checklist_ibfk_8` (`alpha_node`),
  CONSTRAINT `checklist_ibfk_1` FOREIGN KEY (`notification_interval`) REFERENCES `notification_interval` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_ibfk_3` FOREIGN KEY (`importance`) REFERENCES `importance` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_ibfk_4` FOREIGN KEY (`criticality_type`) REFERENCES `criticality_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_ibfk_5` FOREIGN KEY (`owner`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_ibfk_6` FOREIGN KEY (`manager`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_ibfk_7` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_ibfk_8` FOREIGN KEY (`alpha_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_item`
--

DROP TABLE IF EXISTS `checklist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `checklist_item` (
  `rec_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `action_status` varchar(255) DEFAULT NULL,
  `checklist` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `checklist` (`checklist`),
  KEY `status` (`status`),
  CONSTRAINT `checklist_item_ibfk_1` FOREIGN KEY (`checklist`) REFERENCES `checklist` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_item_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_item`
--

LOCK TABLES `checklist_item` WRITE;
/*!40000 ALTER TABLE `checklist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultant_type`
--

DROP TABLE IF EXISTS `consultant_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `consultant_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultant_type`
--

LOCK TABLES `consultant_type` WRITE;
/*!40000 ALTER TABLE `consultant_type` DISABLE KEYS */;
INSERT INTO `consultant_type` VALUES (1,'electrical engineering'),(2,'structural engineering'),(3,'civil engineering'),(4,'architecture'),(5,'mechanical engineering');
/*!40000 ALTER TABLE `consultant_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_type`
--

DROP TABLE IF EXISTS `contractor_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contractor_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_type`
--

LOCK TABLES `contractor_type` WRITE;
/*!40000 ALTER TABLE `contractor_type` DISABLE KEYS */;
INSERT INTO `contractor_type` VALUES (1,'ce'),(2,'eb'),(3,'ep'),(4,'gb'),(5,'me');
/*!40000 ALTER TABLE `contractor_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criticality_type`
--

DROP TABLE IF EXISTS `criticality_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `criticality_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criticality_type`
--

LOCK TABLES `criticality_type` WRITE;
/*!40000 ALTER TABLE `criticality_type` DISABLE KEYS */;
INSERT INTO `criticality_type` VALUES (1,'high'),(2,'medium'),(3,'low');
/*!40000 ALTER TABLE `criticality_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `document` (
  `rec_id` int(11) NOT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `trackbase_type` int(11) DEFAULT NULL,
  `trackbase_id` int(11) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_recieved` date DEFAULT NULL,
  `deadline_date` date DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `document_status` varchar(255) DEFAULT NULL,
  `origination` varchar(55) DEFAULT 'Internal',
  `node` int(11) DEFAULT NULL,
  `c_document_type` smallint(6) NOT NULL,
  `submitted_by` varchar(255) DEFAULT NULL,
  `submitted_by_name` varchar(255) DEFAULT NULL,
  `submitted_by_surname` varchar(255) DEFAULT NULL,
  `submitted_by_id` varchar(255) DEFAULT NULL,
  `submitted_by_email` varchar(255) DEFAULT NULL,
  `submitted_by_contact_no` varchar(255) DEFAULT NULL,
  `submitted_by_org` varchar(255) DEFAULT NULL,
  `priority` varchar(55) DEFAULT NULL,
  `priority_reason` varchar(512) DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL,
  `ref_no` varchar(55) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `attention` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `approver` varchar(255) DEFAULT NULL,
  `support_approver` varchar(255) DEFAULT NULL,
  `application` int(11) DEFAULT NULL,
  `submission_requisition` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `node` (`node`),
  KEY `status` (`status`),
  KEY `c_document_type` (`c_document_type`),
  KEY `trackpoint_node` (`trackpoint_node`),
  KEY `trackbase_type` (`trackbase_type`),
  KEY `end_game` (`end_game`),
  KEY `trackpoint_user` (`trackpoint_user`),
  KEY `submitted_by` (`submitted_by`),
  KEY `attention` (`attention`),
  KEY `author` (`author`),
  KEY `approver` (`approver`),
  KEY `support_approver` (`support_approver`),
  CONSTRAINT `document_ibfk_1` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk_10` FOREIGN KEY (`author`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `document_ibfk_11` FOREIGN KEY (`approver`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `document_ibfk_12` FOREIGN KEY (`support_approver`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `document_ibfk_2` FOREIGN KEY (`c_document_type`) REFERENCES `c_document_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk_3` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk_4` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk_5` FOREIGN KEY (`trackbase_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk_6` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk_7` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `document_ibfk_8` FOREIGN KEY (`submitted_by`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `document_ibfk_9` FOREIGN KEY (`attention`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_attention`
--

DROP TABLE IF EXISTS `document_attention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `document_attention` (
  `rec_id` int(11) NOT NULL,
  `person` varchar(255) DEFAULT NULL,
  `document` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `document` (`document`),
  KEY `person` (`person`),
  CONSTRAINT `document_attention_ibfk_1` FOREIGN KEY (`document`) REFERENCES `document` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_attention_ibfk_2` FOREIGN KEY (`person`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_attention`
--

LOCK TABLES `document_attention` WRITE;
/*!40000 ALTER TABLE `document_attention` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_attention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `end_game`
--

DROP TABLE IF EXISTS `end_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `end_game` (
  `rec_id` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `node` (`node`),
  KEY `status` (`status`),
  CONSTRAINT `end_game_ibfk_1` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `end_game_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `end_game`
--

LOCK TABLES `end_game` WRITE;
/*!40000 ALTER TABLE `end_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `end_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenditure`
--

DROP TABLE IF EXISTS `expenditure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `expenditure` (
  `rec_id` int(11) NOT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `trackbase_type` int(11) DEFAULT NULL,
  `trackbase_id` int(11) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `amount_required` decimal(10,0) DEFAULT NULL,
  `funded_from` varchar(255) DEFAULT NULL,
  `date_required` date DEFAULT NULL,
  `spend_start_date` date DEFAULT NULL,
  `spend_end_date` date DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `expenditure_status` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `node` (`node`),
  KEY `status` (`status`),
  KEY `trackpoint_node` (`trackpoint_node`),
  KEY `trackbase_type` (`trackbase_type`),
  KEY `end_game` (`end_game`),
  KEY `trackpoint_user` (`trackpoint_user`),
  CONSTRAINT `expenditure_ibfk_1` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenditure_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenditure_ibfk_3` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenditure_ibfk_4` FOREIGN KEY (`trackbase_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenditure_ibfk_5` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenditure_ibfk_6` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenditure`
--

LOCK TABLES `expenditure` WRITE;
/*!40000 ALTER TABLE `expenditure` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenditure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gov_entity`
--

DROP TABLE IF EXISTS `gov_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gov_entity` (
  `rec_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `used` varchar(255) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gov_entity`
--

LOCK TABLES `gov_entity` WRITE;
/*!40000 ALTER TABLE `gov_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `gov_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importance`
--

DROP TABLE IF EXISTS `importance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `importance` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importance`
--

LOCK TABLES `importance` WRITE;
/*!40000 ALTER TABLE `importance` DISABLE KEYS */;
INSERT INTO `importance` VALUES (1,'available constantly'),(2,'available most of the time and on demand'),(3,'available sometimes'),(4,'available infrequently and on a flexible schedule');
/*!40000 ALTER TABLE `importance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infrastructure`
--

DROP TABLE IF EXISTS `infrastructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `infrastructure` (
  `rec_id` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `worth` decimal(10,0) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `importance` smallint(6) NOT NULL,
  `criticality_type` smallint(6) NOT NULL,
  `infrastructure_type` smallint(6) NOT NULL,
  `infrastructure_status` varchar(160) DEFAULT NULL,
  `location` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `manager` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `infrastructure_type` (`infrastructure_type`),
  KEY `location` (`location`),
  KEY `status` (`status`),
  KEY `importance` (`importance`),
  KEY `criticality_type` (`criticality_type`),
  KEY `owner` (`owner`),
  KEY `manager` (`manager`),
  CONSTRAINT `infrastructure_ibfk_1` FOREIGN KEY (`infrastructure_type`) REFERENCES `infrastructure_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `infrastructure_ibfk_2` FOREIGN KEY (`location`) REFERENCES `location` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `infrastructure_ibfk_3` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `infrastructure_ibfk_4` FOREIGN KEY (`importance`) REFERENCES `importance` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `infrastructure_ibfk_5` FOREIGN KEY (`criticality_type`) REFERENCES `criticality_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `infrastructure_ibfk_6` FOREIGN KEY (`owner`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `infrastructure_ibfk_7` FOREIGN KEY (`manager`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infrastructure`
--

LOCK TABLES `infrastructure` WRITE;
/*!40000 ALTER TABLE `infrastructure` DISABLE KEYS */;
INSERT INTO `infrastructure` VALUES (51,'p.sibanda@gmail.com','2018-09-26 13:33:27','2018-09-27 05:38:23',NULL,'library b',NULL,NULL,1,1,1,1,NULL,50,'p.sibanda@gmail.com','p.sibanda@gmail.com',NULL);
/*!40000 ALTER TABLE `infrastructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infrastructure_type`
--

DROP TABLE IF EXISTS `infrastructure_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `infrastructure_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infrastructure_type`
--

LOCK TABLES `infrastructure_type` WRITE;
/*!40000 ALTER TABLE `infrastructure_type` DISABLE KEYS */;
INSERT INTO `infrastructure_type` VALUES (1,'library'),(2,'butt hut'),(3,'swimming pool'),(4,'theatre'),(5,'hospital'),(6,'office block'),(7,'fire station'),(8,'tennis court'),(9,'recreational centre'),(10,'stadium');
/*!40000 ALTER TABLE `infrastructure_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_application`
--

DROP TABLE IF EXISTS `job_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_application` (
  `rec_id` int(11) NOT NULL,
  `post` int(11) DEFAULT NULL,
  `application_method` smallint(6) DEFAULT NULL,
  `appplicant` varchar(255) DEFAULT NULL,
  `date_received` datetime DEFAULT NULL,
  `application_status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `post` (`post`),
  KEY `appplicant` (`appplicant`),
  KEY `application_method` (`application_method`),
  KEY `application_status` (`application_status`),
  CONSTRAINT `job_application_ibfk_1` FOREIGN KEY (`post`) REFERENCES `post` (`rec_id`),
  CONSTRAINT `job_application_ibfk_2` FOREIGN KEY (`appplicant`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `job_application_ibfk_3` FOREIGN KEY (`application_method`) REFERENCES `application_method` (`rec_id`),
  CONSTRAINT `job_application_ibfk_4` FOREIGN KEY (`application_status`) REFERENCES `application_status` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_application`
--

LOCK TABLES `job_application` WRITE;
/*!40000 ALTER TABLE `job_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jpagen_generators`
--

DROP TABLE IF EXISTS `jpagen_generators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jpagen_generators` (
  `name` varchar(255) NOT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpagen_generators`
--

LOCK TABLES `jpagen_generators` WRITE;
/*!40000 ALTER TABLE `jpagen_generators` DISABLE KEYS */;
INSERT INTO `jpagen_generators` VALUES ('action_plan_action_gen_id',100),('action_plan_gen_id',100),('address_gen_id',100),('agenda_minute_gen_id',100),('agenda_resolution_assignee_gen_id',100),('agenda_resolution_gen_id',100),('asset_gen_id',100),('asset_provider_gen_id',100),('business_objective_gen_id',100),('checklist_gen_id',100),('checklist_item_gen_id',100),('c_role_gen_id',100),('c_user_gen_id',100),('document_gen_id',100),('end_game_gen_id',100),('expenditure_gen_id',100),('infrastructure_gen_id',100),('job_application_gen_id',100),('location_gen_id',100),('meeting_agenda_gen_id',100),('meeting_attendee_gen_id',100),('meeting_gen_id',100),('node_gen_id',100),('panel_gen_id',100),('panel_service_provider_gen_id',100),('participant_gen_id',100),('policy_gen_id',100),('post_gen_id',100),('process_gen_id',100),('process_phase_action_outcome_gen_id',100),('process_step_action_outcome_gen_id',100),('process_step_gen_id',100),('process_step_phase_gen_id',100),('process_step_user_gen_id',100),('process_track_gen_id',100),('process_track_hist_gen_id',100),('process_track_step_gen_id',100),('process_track_step_phase_gen_id',100),('product_gen_id',100),('project_gen_id',100),('project_service_provider_gen_id',100),('project_stage_gen_id',100),('project_stage_milestone_gen_id',100),('query_gen_id',100),('risk_gen_id',100),('sequence_gen_id',100),('sequence_step_activity_gen_id',100),('sequence_step_gen_id',100),('service_provider_gen_id',100),('service_request_gen_id',100),('sla_gen_id',100),('task_gen_id',100),('timeline_gen_id',100);
/*!40000 ALTER TABLE `jpagen_generators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
  `rec_id` int(11) NOT NULL,
  `contact_fax` varchar(255) DEFAULT NULL,
  `contact_tel` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `province` smallint(6) NOT NULL,
  `postal_address_code` varchar(8) DEFAULT NULL,
  `postal_address_line_one` varchar(255) DEFAULT NULL,
  `postal_address_line_two` varchar(255) DEFAULT NULL,
  `postal_address_line_three` varchar(255) DEFAULT NULL,
  `physical_address_code` varchar(8) DEFAULT NULL,
  `physical_address_line_one` varchar(255) DEFAULT NULL,
  `physical_address_line_two` varchar(255) DEFAULT NULL,
  `physical_address_line_three` varchar(255) DEFAULT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `node` (`node`),
  KEY `status` (`status`),
  KEY `province` (`province`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `location_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `location_ibfk_3` FOREIGN KEY (`province`) REFERENCES `province` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (50,NULL,NULL,NULL,'2018-09-25 10:06:11','2018-09-27 20:42:11','p.sibanda@gmail.com','home 2',1,1,1,NULL,NULL,NULL,NULL,'1459','16 frazer avenue','comet','boksburg','-26.20408','28.24436000000003'),(52,NULL,NULL,NULL,'2018-09-27 21:07:27',NULL,'p.sibanda@gmail.com','mpofu home',1,1,1,NULL,NULL,NULL,NULL,'1401','25 ebony road',NULL,NULL,'-26.18458','28.168800000000033');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_category_type`
--

DROP TABLE IF EXISTS `maintenance_category_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `maintenance_category_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_category_type`
--

LOCK TABLES `maintenance_category_type` WRITE;
/*!40000 ALTER TABLE `maintenance_category_type` DISABLE KEYS */;
INSERT INTO `maintenance_category_type` VALUES (1,'minor',1),(2,'major',1);
/*!40000 ALTER TABLE `maintenance_category_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_item_type`
--

DROP TABLE IF EXISTS `maintenance_item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `maintenance_item_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_item_type`
--

LOCK TABLES `maintenance_item_type` WRITE;
/*!40000 ALTER TABLE `maintenance_item_type` DISABLE KEYS */;
INSERT INTO `maintenance_item_type` VALUES (1,'infrastructure'),(2,'asset');
/*!40000 ALTER TABLE `maintenance_item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `meeting` (
  `rec_id` int(11) NOT NULL,
  `node` int(11) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator_id` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actual_start_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `start_time` varchar(25) DEFAULT NULL,
  `end_time` varchar(25) DEFAULT NULL,
  `actual_start_time` varchar(25) DEFAULT NULL,
  `actual_end_time` varchar(25) DEFAULT NULL,
  `quorum_status` smallint(6) DEFAULT NULL,
  `meeting_status` varchar(25) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  KEY `node` (`node`),
  KEY `owner_id` (`owner_id`),
  KEY `quorum_status` (`quorum_status`),
  CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_ibfk_2` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_ibfk_4` FOREIGN KEY (`quorum_status`) REFERENCES `quorum_status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_agenda`
--

DROP TABLE IF EXISTS `meeting_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `meeting_agenda` (
  `rec_id` int(11) NOT NULL,
  `meeting` int(11) DEFAULT NULL,
  `agenda_no` varchar(25) DEFAULT NULL,
  `agenda` varchar(1024) DEFAULT NULL,
  `agenda_status` varchar(25) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  KEY `meeting` (`meeting`),
  CONSTRAINT `meeting_agenda_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_agenda_ibfk_2` FOREIGN KEY (`meeting`) REFERENCES `meeting` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_agenda`
--

LOCK TABLES `meeting_agenda` WRITE;
/*!40000 ALTER TABLE `meeting_agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_attendee`
--

DROP TABLE IF EXISTS `meeting_attendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `meeting_attendee` (
  `rec_id` int(11) NOT NULL,
  `meeting` int(11) DEFAULT NULL,
  `attendee_id` varchar(255) DEFAULT NULL,
  `attendance_status` varchar(25) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  KEY `meeting` (`meeting`),
  KEY `attendee_id` (`attendee_id`),
  CONSTRAINT `meeting_attendee_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_attendee_ibfk_2` FOREIGN KEY (`meeting`) REFERENCES `meeting` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_attendee_ibfk_3` FOREIGN KEY (`attendee_id`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_attendee`
--

LOCK TABLES `meeting_attendee` WRITE;
/*!40000 ALTER TABLE `meeting_attendee` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_attendee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nationality` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationality`
--

LOCK TABLES `nationality` WRITE;
/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` VALUES (1,'south africa'),(2,'botswana');
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `node` (
  `rec_id` int(11) NOT NULL,
  `node_name` varchar(255) DEFAULT NULL,
  `parent_node` int(11) DEFAULT NULL,
  `contact_person_fullnames` varchar(255) DEFAULT NULL,
  `contact_person_email` varchar(255) DEFAULT NULL,
  `contact_person_mobile_no` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `internal_code` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `node_type` smallint(6) NOT NULL,
  `annual_year_start_month` varchar(255) DEFAULT NULL,
  `annual_year_start_year` int(11) DEFAULT NULL,
  `annual_year_end_year` int(11) DEFAULT NULL,
  `annual_year_end_month` varchar(255) DEFAULT NULL,
  `work_days` varchar(255) DEFAULT NULL,
  `work_hours` int(11) DEFAULT NULL,
  `sphere_national_value` varchar(512) DEFAULT NULL,
  `sphere_provincial_value` varchar(512) DEFAULT NULL,
  `sphere_local_value` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  KEY `node_type` (`node_type`),
  KEY `parent_node` (`parent_node`),
  CONSTRAINT `node_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `node_ibfk_2` FOREIGN KEY (`node_type`) REFERENCES `node_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `node_ibfk_3` FOREIGN KEY (`parent_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'test node',1,NULL,NULL,NULL,NULL,'2018-09-20 08:49:41','2018-09-27 05:53:16','tebogomolusi@gmail.com',NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'node 1',1,NULL,NULL,NULL,NULL,NULL,'2018-09-27 05:53:25','tebogomolusi@gmail.com',NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'sssssss',56,NULL,NULL,NULL,NULL,'2018-09-25 08:33:01',NULL,'p.sibanda@gmail.com',NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'node 3',1,NULL,NULL,NULL,NULL,'2018-09-25 08:36:02','2018-09-27 05:53:32','tebogomolusi@gmail.com',NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'dddddddddddddddddddxx',56,NULL,NULL,NULL,NULL,'2018-09-25 08:36:21',NULL,'p.sibanda@gmail.com',NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'ddddddd 20ddd',1,NULL,NULL,NULL,NULL,'2018-09-25 08:48:09','2018-09-25 10:46:02','p.sibanda@gmail.com',NULL,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'ddddddd 20ddd',1,NULL,NULL,NULL,NULL,'2018-09-25 08:53:15','2018-09-25 10:37:35','p.sibanda@gmail.com',NULL,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_type`
--

DROP TABLE IF EXISTS `node_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `node_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_type`
--

LOCK TABLES `node_type` WRITE;
/*!40000 ALTER TABLE `node_type` DISABLE KEYS */;
INSERT INTO `node_type` VALUES (1,'component'),(2,'entity');
/*!40000 ALTER TABLE `node_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_interval`
--

DROP TABLE IF EXISTS `notification_interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notification_interval` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_interval`
--

LOCK TABLES `notification_interval` WRITE;
/*!40000 ALTER TABLE `notification_interval` DISABLE KEYS */;
INSERT INTO `notification_interval` VALUES (1,'10% interval'),(2,'20% interval'),(3,'25% interval'),(4,'50% interval'),(5,'70% interval'),(6,'100% interval');
/*!40000 ALTER TABLE `notification_interval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel`
--

DROP TABLE IF EXISTS `panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `panel` (
  `rec_id` int(11) NOT NULL,
  `capex_amount` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `opex_amount` int(11) DEFAULT NULL,
  `service_provider_type` smallint(6) NOT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `capex_amount_value` varchar(255) DEFAULT NULL,
  `opex_amount_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `service_provider_type` (`service_provider_type`),
  KEY `status` (`status`),
  CONSTRAINT `panel_ibfk_1` FOREIGN KEY (`service_provider_type`) REFERENCES `service_provider_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `panel_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel`
--

LOCK TABLES `panel` WRITE;
/*!40000 ALTER TABLE `panel` DISABLE KEYS */;
INSERT INTO `panel` VALUES (50,0,'p.sibanda@gmail.com','2018-09-27 13:48:05',NULL,NULL,NULL,'ddddsdsdsd',0,1,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel_service_provider`
--

DROP TABLE IF EXISTS `panel_service_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `panel_service_provider` (
  `panel_id` int(11) NOT NULL,
  `service_provider_id` int(11) NOT NULL,
  PRIMARY KEY (`panel_id`,`service_provider_id`),
  KEY `service_provider` (`service_provider_id`),
  CONSTRAINT `panel_service_provider_ibfk_1` FOREIGN KEY (`panel_id`) REFERENCES `panel` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `panel_service_provider_ibfk_2` FOREIGN KEY (`service_provider_id`) REFERENCES `service_provider` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel_service_provider`
--

LOCK TABLES `panel_service_provider` WRITE;
/*!40000 ALTER TABLE `panel_service_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `panel_service_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `participant` (
  `rec_id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `participant_type` smallint(6) NOT NULL,
  `object_type` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `role` varchar(512) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `participant_type` (`participant_type`),
  KEY `object_type` (`object_type`),
  KEY `status` (`status`),
  KEY `user` (`user`),
  CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`object_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participant_ibfk_2` FOREIGN KEY (`participant_type`) REFERENCES `participant_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participant_ibfk_3` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participant_ibfk_4` FOREIGN KEY (`user`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_type`
--

DROP TABLE IF EXISTS `participant_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `participant_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_type`
--

LOCK TABLES `participant_type` WRITE;
/*!40000 ALTER TABLE `participant_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `participant_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `policy` (
  `rec_id` int(11) NOT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `trackbase_type` int(11) DEFAULT NULL,
  `trackbase_id` int(11) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `owner_type` varchar(255) DEFAULT 'internal',
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `action_status` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `trackpoint_node` (`trackpoint_node`),
  KEY `node` (`node`),
  KEY `status` (`status`),
  KEY `trackbase_type` (`trackbase_type`),
  KEY `end_game` (`end_game`),
  KEY `trackpoint_user` (`trackpoint_user`),
  CONSTRAINT `policy_ibfk_1` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `policy_ibfk_2` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `policy_ibfk_3` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `policy_ibfk_4` FOREIGN KEY (`trackbase_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `policy_ibfk_5` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `policy_ibfk_6` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post` (
  `rec_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `post_status` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `node` (`node`),
  KEY `status` (`status`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priority_type`
--

DROP TABLE IF EXISTS `priority_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `priority_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority_type`
--

LOCK TABLES `priority_type` WRITE;
/*!40000 ALTER TABLE `priority_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `priority_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process` (
  `rec_id` bigint(20) NOT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aud_create_date` datetime DEFAULT NULL,
  `aud_create_user` varchar(255) DEFAULT NULL,
  `aud_modify_date` datetime DEFAULT NULL,
  `aud_modify_user` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `next_process_id` bigint(20) DEFAULT NULL,
  `node_hierarchy_id` bigint(20) DEFAULT NULL,
  `object_type_id` bigint(20) DEFAULT NULL,
  `parent_process_id` bigint(20) DEFAULT NULL,
  `purpose_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_phase_action_outcome`
--

DROP TABLE IF EXISTS `process_phase_action_outcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process_phase_action_outcome` (
  `rec_id` bigint(20) NOT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aud_create_date` datetime DEFAULT NULL,
  `aud_create_user` varchar(255) DEFAULT NULL,
  `aud_modify_date` datetime DEFAULT NULL,
  `aud_modify_user` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_type_id` bigint(20) DEFAULT NULL,
  `process_phase_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_phase_action_outcome`
--

LOCK TABLES `process_phase_action_outcome` WRITE;
/*!40000 ALTER TABLE `process_phase_action_outcome` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_phase_action_outcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_step`
--

DROP TABLE IF EXISTS `process_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process_step` (
  `rec_id` bigint(20) NOT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aud_create_date` datetime DEFAULT NULL,
  `aud_create_user` varchar(255) DEFAULT NULL,
  `aud_modify_date` datetime DEFAULT NULL,
  `aud_modify_user` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `next_process_step_id` bigint(20) DEFAULT NULL,
  `parent_ind` varchar(255) DEFAULT NULL,
  `parent_process_step_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `process_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_ampk6nrg21xff2nl95a66ka7l` (`process_id`),
  CONSTRAINT `fk_ampk6nrg21xff2nl95a66ka7l` FOREIGN KEY (`process_id`) REFERENCES `process` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_step`
--

LOCK TABLES `process_step` WRITE;
/*!40000 ALTER TABLE `process_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_step_action_outcome`
--

DROP TABLE IF EXISTS `process_step_action_outcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process_step_action_outcome` (
  `rec_id` bigint(20) NOT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aud_create_date` datetime DEFAULT NULL,
  `aud_create_user` varchar(255) DEFAULT NULL,
  `aud_modify_date` datetime DEFAULT NULL,
  `aud_modify_user` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_type_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `process_step_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_n6uu3ahli9yk36y5d3mhrfqkm` (`process_step_id`),
  CONSTRAINT `fk_n6uu3ahli9yk36y5d3mhrfqkm` FOREIGN KEY (`process_step_id`) REFERENCES `process_step` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_step_action_outcome`
--

LOCK TABLES `process_step_action_outcome` WRITE;
/*!40000 ALTER TABLE `process_step_action_outcome` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_step_action_outcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_step_phase`
--

DROP TABLE IF EXISTS `process_step_phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process_step_phase` (
  `rec_id` bigint(20) NOT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aud_create_date` datetime DEFAULT NULL,
  `aud_create_user` varchar(255) DEFAULT NULL,
  `aud_modify_date` datetime DEFAULT NULL,
  `aud_modify_user` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `next_process_phase_id` bigint(20) DEFAULT NULL,
  `parent_process_phase_id` bigint(20) DEFAULT NULL,
  `phase_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `process_step_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_nydokl9ok3nfha7jilyt8vvfj` (`user_id`),
  KEY `fk_4d5o31mnp7bcqu3w33isbpsxe` (`process_step_id`),
  CONSTRAINT `fk_4d5o31mnp7bcqu3w33isbpsxe` FOREIGN KEY (`process_step_id`) REFERENCES `process_step` (`rec_id`),
  CONSTRAINT `fk_nydokl9ok3nfha7jilyt8vvfj` FOREIGN KEY (`user_id`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_step_phase`
--

LOCK TABLES `process_step_phase` WRITE;
/*!40000 ALTER TABLE `process_step_phase` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_step_phase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_step_user`
--

DROP TABLE IF EXISTS `process_step_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process_step_user` (
  `rec_id` bigint(20) NOT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aud_create_date` datetime DEFAULT NULL,
  `aud_create_user` varchar(255) DEFAULT NULL,
  `aud_modify_date` datetime DEFAULT NULL,
  `aud_modify_user` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `process_step_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_k4fcn7aygvrbjvl2moq9ok7qo` (`user_id`),
  KEY `fk_bbwelcwrhpvin7n9vb2jvlwht` (`process_step_id`),
  CONSTRAINT `fk_bbwelcwrhpvin7n9vb2jvlwht` FOREIGN KEY (`process_step_id`) REFERENCES `process_step` (`rec_id`),
  CONSTRAINT `fk_k4fcn7aygvrbjvl2moq9ok7qo` FOREIGN KEY (`user_id`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_step_user`
--

LOCK TABLES `process_step_user` WRITE;
/*!40000 ALTER TABLE `process_step_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_step_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_track`
--

DROP TABLE IF EXISTS `process_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process_track` (
  `rec_id` bigint(20) NOT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aud_create_date` datetime DEFAULT NULL,
  `aud_create_user` varchar(255) DEFAULT NULL,
  `aud_modify_date` datetime DEFAULT NULL,
  `aud_modify_user` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_type_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `process_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_gd0ggxid0g5u1ojhj4nq1lb9i` (`user_id`),
  KEY `fk_jsyjt54w682r3v68r10bguk8s` (`process_id`),
  CONSTRAINT `fk_gd0ggxid0g5u1ojhj4nq1lb9i` FOREIGN KEY (`user_id`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `fk_jsyjt54w682r3v68r10bguk8s` FOREIGN KEY (`process_id`) REFERENCES `process` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_track`
--

LOCK TABLES `process_track` WRITE;
/*!40000 ALTER TABLE `process_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_track_hist`
--

DROP TABLE IF EXISTS `process_track_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process_track_hist` (
  `rec_id` bigint(20) NOT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aud_create_date` varchar(255) DEFAULT NULL,
  `aud_create_user` varchar(255) DEFAULT NULL,
  `aud_modify_date` varchar(255) DEFAULT NULL,
  `aud_modify_user` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_type_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `process_id` bigint(20) DEFAULT NULL,
  `process_step_id` bigint(20) DEFAULT NULL,
  `process_step_phase_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_s9rgadxqipfl7k6syvksub844` (`user_id`),
  KEY `fk_92es74iabmlc3gsdabexcfcnf` (`process_id`),
  KEY `fk_cte4lsyjg5jfqgqm3vr07px2y` (`process_step_id`),
  KEY `fk_cb6wgcp277hchpn6ixmn0ve13` (`process_step_phase_id`),
  CONSTRAINT `fk_92es74iabmlc3gsdabexcfcnf` FOREIGN KEY (`process_id`) REFERENCES `process` (`rec_id`),
  CONSTRAINT `fk_cb6wgcp277hchpn6ixmn0ve13` FOREIGN KEY (`process_step_phase_id`) REFERENCES `process_step_phase` (`rec_id`),
  CONSTRAINT `fk_cte4lsyjg5jfqgqm3vr07px2y` FOREIGN KEY (`process_step_id`) REFERENCES `process_step` (`rec_id`),
  CONSTRAINT `fk_s9rgadxqipfl7k6syvksub844` FOREIGN KEY (`user_id`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_track_hist`
--

LOCK TABLES `process_track_hist` WRITE;
/*!40000 ALTER TABLE `process_track_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_track_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_track_step`
--

DROP TABLE IF EXISTS `process_track_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process_track_step` (
  `rec_id` bigint(20) NOT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aud_create_date` datetime DEFAULT NULL,
  `aud_create_user` varchar(255) DEFAULT NULL,
  `aud_modify_date` datetime DEFAULT NULL,
  `aud_modify_user` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `process_step_id` bigint(20) DEFAULT NULL,
  `process_track_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_o6okhohbm9dxb4jxusri4lkl1` (`process_step_id`),
  KEY `fk_8eyyxc397sxepyet9vor0tccm` (`process_track_id`),
  CONSTRAINT `fk_8eyyxc397sxepyet9vor0tccm` FOREIGN KEY (`process_track_id`) REFERENCES `process_track` (`rec_id`),
  CONSTRAINT `fk_o6okhohbm9dxb4jxusri4lkl1` FOREIGN KEY (`process_step_id`) REFERENCES `process_step` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_track_step`
--

LOCK TABLES `process_track_step` WRITE;
/*!40000 ALTER TABLE `process_track_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_track_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_track_step_phase`
--

DROP TABLE IF EXISTS `process_track_step_phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process_track_step_phase` (
  `rec_id` bigint(20) NOT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aud_create_date` datetime DEFAULT NULL,
  `aud_create_user` varchar(255) DEFAULT NULL,
  `aud_modify_date` datetime DEFAULT NULL,
  `aud_modify_user` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `process_step_phase_id` bigint(20) DEFAULT NULL,
  `process_track_step_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_fpp32sai9qenq65ww2hpvxwjt` (`process_step_phase_id`),
  KEY `fk_938wfmqdvfjipqtyq6deki61t` (`process_track_step_id`),
  CONSTRAINT `fk_938wfmqdvfjipqtyq6deki61t` FOREIGN KEY (`process_track_step_id`) REFERENCES `process_track_step` (`rec_id`),
  CONSTRAINT `fk_fpp32sai9qenq65ww2hpvxwjt` FOREIGN KEY (`process_step_phase_id`) REFERENCES `process_step_phase` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_track_step_phase`
--

LOCK TABLES `process_track_step_phase` WRITE;
/*!40000 ALTER TABLE `process_track_step_phase` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_track_step_phase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `rec_id` int(11) NOT NULL,
  `description` varchar(512) NOT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project` (
  `rec_id` bigint(20) NOT NULL,
  `actual_end_date` datetime DEFAULT NULL,
  `actual_start_date` datetime DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_cell_no` varchar(255) DEFAULT NULL,
  `owner_email` varchar(255) DEFAULT NULL,
  `owner_landline_no` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `planned_budget_cost` varchar(255) DEFAULT NULL,
  `planned_end_date` datetime DEFAULT NULL,
  `planned_start_date` datetime DEFAULT NULL,
  `project_status` varchar(255) DEFAULT NULL,
  `project_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `project_manager_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_kb3130ecutfdwam8mf4yrvkml` (`project_manager_id`),
  CONSTRAINT `fk_kb3130ecutfdwam8mf4yrvkml` FOREIGN KEY (`project_manager_id`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_service_provider`
--

DROP TABLE IF EXISTS `project_service_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project_service_provider` (
  `rec_id` bigint(20) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `service_provider_id` int(11) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_lhgrf3yaaquvemgth38fmktdo` (`project_id`),
  KEY `fk_ov3cjn8knwavhygaqxej2h744` (`service_provider_id`),
  CONSTRAINT `fk_lhgrf3yaaquvemgth38fmktdo` FOREIGN KEY (`project_id`) REFERENCES `project` (`rec_id`),
  CONSTRAINT `fk_ov3cjn8knwavhygaqxej2h744` FOREIGN KEY (`service_provider_id`) REFERENCES `service_provider` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_service_provider`
--

LOCK TABLES `project_service_provider` WRITE;
/*!40000 ALTER TABLE `project_service_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_service_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_stage`
--

DROP TABLE IF EXISTS `project_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project_stage` (
  `rec_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_stage_id` decimal(19,2) DEFAULT NULL,
  `project_stage_status` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_aychtuxk1xw9mns5n54062mn7` (`project_id`),
  CONSTRAINT `fk_aychtuxk1xw9mns5n54062mn7` FOREIGN KEY (`project_id`) REFERENCES `project` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_stage`
--

LOCK TABLES `project_stage` WRITE;
/*!40000 ALTER TABLE `project_stage` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_stage_milestone`
--

DROP TABLE IF EXISTS `project_stage_milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project_stage_milestone` (
  `rec_id` bigint(20) NOT NULL,
  `actual_end_date` datetime DEFAULT NULL,
  `actual_start_date` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `planned_budget_cost` varchar(255) DEFAULT NULL,
  `planned_end_date` datetime DEFAULT NULL,
  `planned_start_date` datetime DEFAULT NULL,
  `project_stage_milestone_id` decimal(19,2) DEFAULT NULL,
  `project_stage_milestone_status` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `project_stage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `fk_545n9grdd8i35wvrw93mo940a` (`project_stage_id`),
  CONSTRAINT `fk_545n9grdd8i35wvrw93mo940a` FOREIGN KEY (`project_stage_id`) REFERENCES `project_stage` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_stage_milestone`
--

LOCK TABLES `project_stage_milestone` WRITE;
/*!40000 ALTER TABLE `project_stage_milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_stage_milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `province` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'gauteng','-26.270760','28.112268'),(2,'northen cape','-29.046681','21.856859'),(3,'north west','?-25.853161','25.2838'),(4,'mpumalanga','-25.5653','30.5279'),(5,'eastern cape','-33.9326','25.57'),(6,'free state','-28.4541','26.7968'),(7,'limpopo','-23.4013','29.4179'),(8,'kwazulu natal','-28.5306','30.8958'),(9,'western cape','-33.2278','21.8569');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query`
--

DROP TABLE IF EXISTS `query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `query` (
  `rec_id` int(11) NOT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `trackbase_type` int(11) DEFAULT NULL,
  `trackbase_id` int(11) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `date_registered` date DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `query_status` varchar(255) DEFAULT NULL,
  `query_type` smallint(6) NOT NULL,
  `priority_type` smallint(6) NOT NULL,
  `assignedto` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `node` (`node`),
  KEY `query_type` (`query_type`),
  KEY `priority_type` (`priority_type`),
  KEY `assignedto` (`assignedto`),
  KEY `status` (`status`),
  KEY `trackpoint_node` (`trackpoint_node`),
  KEY `trackbase_type` (`trackbase_type`),
  KEY `end_game` (`end_game`),
  KEY `trackpoint_user` (`trackpoint_user`),
  CONSTRAINT `query_ibfk_1` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `query_ibfk_2` FOREIGN KEY (`query_type`) REFERENCES `query_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `query_ibfk_3` FOREIGN KEY (`priority_type`) REFERENCES `priority_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `query_ibfk_4` FOREIGN KEY (`assignedto`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `query_ibfk_5` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `query_ibfk_6` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `query_ibfk_7` FOREIGN KEY (`trackbase_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `query_ibfk_8` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `query_ibfk_9` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query`
--

LOCK TABLES `query` WRITE;
/*!40000 ALTER TABLE `query` DISABLE KEYS */;
/*!40000 ALTER TABLE `query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_type`
--

DROP TABLE IF EXISTS `query_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `query_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_type`
--

LOCK TABLES `query_type` WRITE;
/*!40000 ALTER TABLE `query_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quorum_status`
--

DROP TABLE IF EXISTS `quorum_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `quorum_status` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quorum_status`
--

LOCK TABLES `quorum_status` WRITE;
/*!40000 ALTER TABLE `quorum_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `quorum_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `race` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (1,'black'),(2,'white');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registry_record`
--

DROP TABLE IF EXISTS `registry_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registry_record` (
  `rec_id` int(11) NOT NULL,
  `document` int(11) DEFAULT NULL,
  `registry_status` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_received` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `employee` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `copies` int(11) NOT NULL,
  `notes` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `document` (`document`),
  KEY `employee` (`employee`),
  KEY `node` (`node`),
  CONSTRAINT `registry_record_rr_1` FOREIGN KEY (`document`) REFERENCES `document` (`rec_id`),
  CONSTRAINT `registry_record_rr_2` FOREIGN KEY (`employee`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `registry_record_rr_3` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registry_record`
--

LOCK TABLES `registry_record` WRITE;
/*!40000 ALTER TABLE `registry_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `registry_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_type`
--

DROP TABLE IF EXISTS `resource_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `resource_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_type`
--

LOCK TABLES `resource_type` WRITE;
/*!40000 ALTER TABLE `resource_type` DISABLE KEYS */;
INSERT INTO `resource_type` VALUES (1,'asset manager'),(2,'asset owner'),(3,'infrastructure manager'),(4,'infrastructure owner'),(5,'external service provider'),(6,'internal service provider'),(7,'inspector');
/*!40000 ALTER TABLE `resource_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk`
--

DROP TABLE IF EXISTS `risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `risk` (
  `rec_id` int(11) NOT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `trackbase_type` int(11) DEFAULT NULL,
  `trackbase_id` int(11) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `date_registered` date DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `risk_status` varchar(255) DEFAULT NULL,
  `risk_type` smallint(6) NOT NULL,
  `risk_motivate` varchar(512) DEFAULT NULL,
  `assignedto` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `node` (`node`),
  KEY `risk_type` (`risk_type`),
  KEY `assignedto` (`assignedto`),
  KEY `status` (`status`),
  KEY `trackpoint_node` (`trackpoint_node`),
  KEY `trackbase_type` (`trackbase_type`),
  KEY `end_game` (`end_game`),
  KEY `trackpoint_user` (`trackpoint_user`),
  CONSTRAINT `risk_ibfk_1` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `risk_ibfk_2` FOREIGN KEY (`risk_type`) REFERENCES `risk_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `risk_ibfk_3` FOREIGN KEY (`assignedto`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `risk_ibfk_4` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `risk_ibfk_5` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `risk_ibfk_6` FOREIGN KEY (`trackbase_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `risk_ibfk_7` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `risk_ibfk_8` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk`
--

LOCK TABLES `risk` WRITE;
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_type`
--

DROP TABLE IF EXISTS `risk_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `risk_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_type`
--

LOCK TABLES `risk_type` WRITE;
/*!40000 ALTER TABLE `risk_type` DISABLE KEYS */;
INSERT INTO `risk_type` VALUES (1,'high'),(2,'medium'),(3,'low');
/*!40000 ALTER TABLE `risk_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sequence` (
  `rec_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `type` varchar(55) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `manager_id` varchar(255) DEFAULT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `sequence_status` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `parent_sequence` int(11) DEFAULT NULL,
  `next_sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `node` (`node`),
  KEY `status` (`status`),
  KEY `trackpoint_user` (`trackpoint_user`),
  KEY `trackpoint_node` (`trackpoint_node`),
  CONSTRAINT `sequence_ibfk_1` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sequence_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sequence_ibfk_3` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sequence_ibfk_4` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_status`
--

DROP TABLE IF EXISTS `sequence_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sequence_status` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_status`
--

LOCK TABLES `sequence_status` WRITE;
/*!40000 ALTER TABLE `sequence_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_step`
--

DROP TABLE IF EXISTS `sequence_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sequence_step` (
  `rec_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `manager_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `sequence_step_status` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `parent_sequence_step` int(11) DEFAULT NULL,
  `next_sequence_step` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `node` (`node`),
  KEY `status` (`status`),
  KEY `sequence` (`sequence`),
  CONSTRAINT `sequence_step_ibfk_1` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sequence_step_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sequence_step_ibfk_3` FOREIGN KEY (`sequence`) REFERENCES `sequence` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_step`
--

LOCK TABLES `sequence_step` WRITE;
/*!40000 ALTER TABLE `sequence_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_step_activity`
--

DROP TABLE IF EXISTS `sequence_step_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sequence_step_activity` (
  `rec_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `manager_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `sequence_step_activity_status` varchar(255) DEFAULT NULL,
  `sequence_step_id` int(11) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `parent_sequence_step_activity` int(11) DEFAULT NULL,
  `next_sequence_step_activity` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `node` (`node`),
  KEY `status` (`status`),
  KEY `sequence_step_id` (`sequence_step_id`),
  CONSTRAINT `sequence_step_activity_ibfk_1` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sequence_step_activity_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sequence_step_activity_ibfk_3` FOREIGN KEY (`sequence_step_id`) REFERENCES `sequence_step` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_step_activity`
--

LOCK TABLES `sequence_step_activity` WRITE;
/*!40000 ALTER TABLE `sequence_step_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_step_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_type`
--

DROP TABLE IF EXISTS `sequence_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sequence_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_type`
--

LOCK TABLES `sequence_type` WRITE;
/*!40000 ALTER TABLE `sequence_type` DISABLE KEYS */;
INSERT INTO `sequence_type` VALUES (1,'process'),(2,'procedure'),(3,'cycle');
/*!40000 ALTER TABLE `sequence_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service` (
  `rec_id` int(11) NOT NULL,
  `description` varchar(512) NOT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider`
--

DROP TABLE IF EXISTS `service_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_provider` (
  `rec_id` int(11) NOT NULL,
  `bbbee` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `fax_no` varchar(255) DEFAULT NULL,
  `grading` varchar(255) DEFAULT NULL,
  `contact_person_fullnames` varchar(255) DEFAULT NULL,
  `contact_person_email` varchar(255) DEFAULT NULL,
  `contact_person_mobile_no` varchar(255) DEFAULT NULL,
  `pr_registration` varchar(255) DEFAULT NULL,
  `reg_no` varchar(255) DEFAULT NULL,
  `registered_name` varchar(255) DEFAULT NULL,
  `service_provider_type` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `telephone_no` varchar(255) DEFAULT NULL,
  `trading_name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `province` smallint(6) NOT NULL,
  `postal_address_code` smallint(6) DEFAULT NULL,
  `postal_address_line_one` varchar(255) DEFAULT NULL,
  `postal_address_line_two` varchar(255) DEFAULT NULL,
  `postal_address_line_three` varchar(255) DEFAULT NULL,
  `physical_address_code` smallint(6) DEFAULT NULL,
  `physical_address_line_one` varchar(255) DEFAULT NULL,
  `physical_address_line_two` varchar(255) DEFAULT NULL,
  `physical_address_line_three` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  CONSTRAINT `service_provider_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider`
--

LOCK TABLES `service_provider` WRITE;
/*!40000 ALTER TABLE `service_provider` DISABLE KEYS */;
INSERT INTO `service_provider` VALUES (50,NULL,'p.sibanda@gmail.com','2018-09-27 17:19:49',NULL,NULL,'sss@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'333333','eeeeee','professional_services',1,NULL,'eeeee',NULL,0,0,NULL,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `service_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider_product_assoc`
--

DROP TABLE IF EXISTS `service_provider_product_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_provider_product_assoc` (
  `service_provider` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  PRIMARY KEY (`service_provider`,`product`),
  KEY `product` (`product`),
  CONSTRAINT `service_provider_product_assoc_ibfk_1` FOREIGN KEY (`service_provider`) REFERENCES `service_provider` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_provider_product_assoc_ibfk_2` FOREIGN KEY (`product`) REFERENCES `product` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider_product_assoc`
--

LOCK TABLES `service_provider_product_assoc` WRITE;
/*!40000 ALTER TABLE `service_provider_product_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_provider_product_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider_service_assoc`
--

DROP TABLE IF EXISTS `service_provider_service_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_provider_service_assoc` (
  `service_provider` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  PRIMARY KEY (`service_provider`,`service`),
  KEY `service` (`service`),
  CONSTRAINT `service_provider_service_assoc_ibfk_1` FOREIGN KEY (`service_provider`) REFERENCES `service_provider` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_provider_service_assoc_ibfk_2` FOREIGN KEY (`service`) REFERENCES `service` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider_service_assoc`
--

LOCK TABLES `service_provider_service_assoc` WRITE;
/*!40000 ALTER TABLE `service_provider_service_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_provider_service_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider_type`
--

DROP TABLE IF EXISTS `service_provider_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_provider_type` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider_type`
--

LOCK TABLES `service_provider_type` WRITE;
/*!40000 ALTER TABLE `service_provider_type` DISABLE KEYS */;
INSERT INTO `service_provider_type` VALUES (1,'contractor'),(2,'professional services');
/*!40000 ALTER TABLE `service_provider_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_request`
--

DROP TABLE IF EXISTS `service_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_request` (
  `rec_id` int(11) NOT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_resolved` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `resolution` varchar(1024) DEFAULT NULL,
  `creator_id` varchar(255) DEFAULT NULL,
  `assigned_user_id` varchar(255) DEFAULT NULL,
  `subject` varchar(1024) DEFAULT NULL,
  `sla` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  KEY `node` (`node`),
  KEY `sla` (`sla`),
  KEY `trackpoint_node` (`trackpoint_node`),
  KEY `end_game` (`end_game`),
  KEY `trackpoint_user` (`trackpoint_user`),
  CONSTRAINT `service_request_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_request_ibfk_2` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_request_ibfk_3` FOREIGN KEY (`sla`) REFERENCES `sla` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_request_ibfk_4` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_request_ibfk_6` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_request_ibfk_7` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_request`
--

LOCK TABLES `service_request` WRITE;
/*!40000 ALTER TABLE `service_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sla`
--

DROP TABLE IF EXISTS `sla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sla` (
  `rec_id` int(11) NOT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `trackbase_type` int(11) DEFAULT NULL,
  `trackbase_id` int(11) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `importance` smallint(6) NOT NULL,
  `criticality_type` smallint(6) NOT NULL,
  `notification_interval` smallint(6) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `sla_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `notification_interval` (`notification_interval`),
  KEY `status` (`status`),
  KEY `importance` (`importance`),
  KEY `criticality_type` (`criticality_type`),
  KEY `owner` (`owner`),
  KEY `manager` (`manager`),
  KEY `node` (`node`),
  KEY `trackpoint_node` (`trackpoint_node`),
  KEY `trackbase_type` (`trackbase_type`),
  KEY `end_game` (`end_game`),
  KEY `trackpoint_user` (`trackpoint_user`),
  CONSTRAINT `sla_ibfk_1` FOREIGN KEY (`notification_interval`) REFERENCES `notification_interval` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sla_ibfk_10` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sla_ibfk_11` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `sla_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sla_ibfk_3` FOREIGN KEY (`importance`) REFERENCES `importance` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sla_ibfk_4` FOREIGN KEY (`criticality_type`) REFERENCES `criticality_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sla_ibfk_5` FOREIGN KEY (`owner`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sla_ibfk_6` FOREIGN KEY (`manager`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sla_ibfk_7` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sla_ibfk_8` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sla_ibfk_9` FOREIGN KEY (`trackbase_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla`
--

LOCK TABLES `sla` WRITE;
/*!40000 ALTER TABLE `sla` DISABLE KEYS */;
/*!40000 ALTER TABLE `sla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status` (
  `rec_id` smallint(6) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Active'),(2,'Disabled'),(3,'Deleted');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_requisition`
--

DROP TABLE IF EXISTS `submission_requisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `submission_requisition` (
  `rec_id` int(11) NOT NULL,
  `objective` int(11) DEFAULT NULL,
  `business_case` varchar(1024) DEFAULT NULL,
  `impact` varchar(1024) DEFAULT NULL,
  `benefits` varchar(1024) DEFAULT NULL,
  `risk_analysis` varchar(1024) DEFAULT NULL,
  `cost_implications` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `objective` (`objective`),
  CONSTRAINT `submission_requisition_1` FOREIGN KEY (`objective`) REFERENCES `c_objective` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_requisition`
--

LOCK TABLES `submission_requisition` WRITE;
/*!40000 ALTER TABLE `submission_requisition` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_requisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task` (
  `rec_id` int(11) NOT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `trackbase_type` int(11) DEFAULT NULL,
  `trackbase_id` int(11) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_resolved` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `resolution` varchar(1024) DEFAULT NULL,
  `creator_id` varchar(255) DEFAULT NULL,
  `assigned_user_id` varchar(255) DEFAULT NULL,
  `subject` varchar(1024) DEFAULT NULL,
  `object_type_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `status` (`status`),
  KEY `trackpoint_node` (`trackpoint_node`),
  KEY `trackbase_type` (`trackbase_type`),
  KEY `end_game` (`end_game`),
  KEY `trackpoint_user` (`trackpoint_user`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`trackbase_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_4` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_5` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline`
--

DROP TABLE IF EXISTS `timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `timeline` (
  `rec_id` int(11) NOT NULL,
  `trackpoint_node` int(11) DEFAULT NULL,
  `trackpoint_user` varchar(255) DEFAULT NULL,
  `trackbase_type` int(11) DEFAULT NULL,
  `trackbase_id` int(11) DEFAULT NULL,
  `end_game` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `importance` smallint(6) NOT NULL,
  `criticality_type` smallint(6) NOT NULL,
  `notification_interval` smallint(6) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `notification_interval` (`notification_interval`),
  KEY `status` (`status`),
  KEY `importance` (`importance`),
  KEY `criticality_type` (`criticality_type`),
  KEY `owner` (`owner`),
  KEY `manager` (`manager`),
  KEY `node` (`node`),
  KEY `trackpoint_node` (`trackpoint_node`),
  KEY `trackbase_type` (`trackbase_type`),
  KEY `end_game` (`end_game`),
  KEY `trackpoint_user` (`trackpoint_user`),
  CONSTRAINT `timeline_ibfk_1` FOREIGN KEY (`notification_interval`) REFERENCES `notification_interval` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timeline_ibfk_10` FOREIGN KEY (`end_game`) REFERENCES `end_game` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timeline_ibfk_11` FOREIGN KEY (`trackpoint_user`) REFERENCES `c_user` (`user_id`),
  CONSTRAINT `timeline_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timeline_ibfk_3` FOREIGN KEY (`importance`) REFERENCES `importance` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timeline_ibfk_4` FOREIGN KEY (`criticality_type`) REFERENCES `criticality_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timeline_ibfk_5` FOREIGN KEY (`owner`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timeline_ibfk_6` FOREIGN KEY (`manager`) REFERENCES `c_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timeline_ibfk_7` FOREIGN KEY (`node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timeline_ibfk_8` FOREIGN KEY (`trackpoint_node`) REFERENCES `node` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timeline_ibfk_9` FOREIGN KEY (`trackbase_type`) REFERENCES `c_object_type` (`rec_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline`
--

LOCK TABLES `timeline` WRITE;
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'digitrack'
--

--
-- Dumping routines for database 'digitrack'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-16  6:05:02
