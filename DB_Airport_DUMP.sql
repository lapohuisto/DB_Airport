-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: airport
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
-- Table structure for table `aircrafts`
--

DROP TABLE IF EXISTS `aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircrafts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `airline_id` bigint unsigned NOT NULL,
  `aircraft_model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `aircraft_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_airline_id` (`airline_id`),
  CONSTRAINT `fk_airline_id` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Самолёты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircrafts`
--

LOCK TABLES `aircrafts` WRITE;
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
INSERT INTO `aircrafts` VALUES (39,93,'Boeing 777-300ER','AA-B777-300ER'),(40,94,'Boeing 737 MAX','FD-B737-M'),(41,95,'Boeing 737-800','NS-B737-800'),(42,96,'Boeing 777-200ER','NA-B777-200ER'),(43,97,'Boeing 737-800','PA-B737-800'),(44,98,'Airbus А321','UA-A321'),(45,99,'Airbus A321','RW-A321'),(46,100,'Airbus А320 NEO','SA-А320-NEO'),(47,101,'Boeing 787-9 Dreamliner','TA-B787-9-D'),(48,102,'Embraer 170','S7-E170'),(49,102,'Airbus A321nx','S7-A321NX'),(50,102,'Boeing 737-800','S7-B737-800'),(51,93,'Boeing 767-300','AA-B767-300'),(52,93,'Boeing 757-200','AA-B757-200'),(53,93,'Boeing 737-900ER','AA-B737-900ER'),(54,93,'Boeing 737-800','AA-B737-800'),(55,94,' Boeing 737-800','FD-B737-800'),(56,95,'Boeing 737-300','NS-B737-300'),(57,96,'Boeing 777-300ER','NA-B777-300ER'),(58,96,'Airbus A330-200','NA-A330-200'),(59,96,'Airbus A330-300','NA-A330-300'),(60,96,'Airbus A321','NA-A321'),(61,96,'Airbus A321 NEO','NA-A321-NEO'),(62,96,'Boeing 737-800','NA-B737-800'),(63,97,'Airbus A321 NEO','PA-A321-200-NEO'),(64,97,'Airbus A320 NEO','PA-A320-NEO'),(65,97,'Airbus A320 CEO','PA-A320-200-CEO'),(66,98,'Airbus А320','UA-A320'),(67,98,'Airbus А319','UA-A319'),(68,98,'Airbus A320 NEO','PA-A320-NEO'),(69,98,'Airbus A321 NEO','PA-A321-NEO'),(70,99,'Sukhoi SuperJet','RW-SSJ100'),(71,99,'Boeing 777-200ER','RW-B777-200ER'),(72,100,'Boeing 737-800','SA-B737-800'),(73,100,'Boeing 737-700','SA-B737-700'),(74,101,'Airbus A319-132/100','TA-A319-132/100'),(75,101,'Boeing 737 MAX 9','TA-B737-MAX-9'),(76,101,'Boeing 737 MAX 8','TA-B737-MAX-8');
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `aircrafts_airlines`
--

DROP TABLE IF EXISTS `aircrafts_airlines`;
/*!50001 DROP VIEW IF EXISTS `aircrafts_airlines`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `aircrafts_airlines` AS SELECT 
 1 AS `airline`,
 1 AS `models`,
 1 AS `numbers`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlines` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone` char(11) DEFAULT NULL,
  `adress` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `airlines_chk_1` CHECK (regexp_like(`phone`,_utf8mb4'^[0-9]{11}$'))
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Авиакомпании';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlines`
--

LOCK TABLES `airlines` WRITE;
/*!40000 ALTER TABLE `airlines` DISABLE KEYS */;
INSERT INTO `airlines` VALUES (93,'Azur Air',NULL,NULL),(94,'flydubai','89286331730',NULL),(95,'NordStar','88792233051','Airport complex'),(96,'Nordwind Airlines','84954887777',NULL),(97,'Pegasus Airlines',NULL,NULL),(98,'Ural Airlines','87933338811',NULL),(99,'Red Wings','88003509977','Airport complex'),(100,'Smartavia','88002000055',NULL),(101,'Turkish Airlines','83832410200','Novosibirsk, Michurina str., 17'),(102,'S7 Airlines',NULL,NULL),(103,'Uzbekistan Airways','88793363636','Pyatigorsk, ul. Kraynogo, 49, office 314'),(104,'Azerbaijan Airlines','88792233090','Airport complex, 2nd floor, AZAL office'),(105,'Azimuth',NULL,NULL),(106,'Armenia',NULL,NULL),(107,'Icarus',NULL,NULL),(108,'Aeroflot','88792258920','Airport complex, 2nd floor'),(109,'Izhavia','73412630609',NULL),(110,'Victory',NULL,NULL),(111,'Russia','83832169899','Tolmachevo Airport, Sector A, 3rd floor'),(112,'RusLine','83726681009',NULL),(113,'Severstal','88202530900',NULL),(114,'UTair','88792233052','Airport complex, office 206'),(115,'Yamal',NULL,NULL);
/*!40000 ALTER TABLE `airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `city_id` bigint unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_city_id` (`city_id`),
  CONSTRAINT `fk_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Аэропорты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` VALUES (1,1,'Sheremetyevo'),(2,2,'Zhulyany'),(3,3,'Minsk International 1'),(4,4,'Islam Karimov Tashkent International'),(5,5,'Nursultan'),(6,6,'Haneda'),(7,7,'Bolling AFB'),(8,8,'Rockcliffe'),(9,9,'London City'),(10,10,'Orly');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `avg_prices`
--

DROP TABLE IF EXISTS `avg_prices`;
/*!50001 DROP VIEW IF EXISTS `avg_prices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `avg_prices` AS SELECT 
 1 AS `AVG(econom_class)`,
 1 AS `AVG(business_class)`,
 1 AS `AVG(first_class)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gmt` time NOT NULL COMMENT 'Среднее Время По Гринвичу',
  `sign_gmt` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_country_id` (`country_id`),
  CONSTRAINT `fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Города';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Moscow','03:00:00','+'),(2,2,'Kiev','03:00:00','+'),(3,3,'Minsk','03:00:00','+'),(4,4,'Tashkent','05:00:00','+'),(5,5,'Nur-Sultan','06:00:00','+'),(6,6,'Tokyo','09:00:00','+'),(7,7,'Washington','05:00:00','-'),(8,8,'Ottawa','05:00:00','-'),(9,9,'London','00:00:00','+'),(10,10,'Paris','01:00:00','+');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `city_view`
--

DROP TABLE IF EXISTS `city_view`;
/*!50001 DROP VIEW IF EXISTS `city_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `city_view` AS SELECT 
 1 AS `country`,
 1 AS `code`,
 1 AS `city`,
 1 AS `sign`,
 1 AS `GMT`,
 1 AS `airport`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Страны';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Russia','RU'),(2,'Ukraine','UA'),(3,'Belarus','BY'),(4,'Uzbekistan','UZ'),(5,'Kazakhstan','KZ'),(6,'Japan','JP'),(7,'USA','US'),(8,'Canada','CA'),(9,'United Kingdom','GB'),(10,'France','FR');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_cities` BEFORE DELETE ON `countries` FOR EACH ROW BEGIN
  DELETE FROM cities WHERE country_id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `docs`
--

DROP TABLE IF EXISTS `docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL COMMENT 'Описание',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Документы, удостоверяющие личность';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs`
--

LOCK TABLES `docs` WRITE;
/*!40000 ALTER TABLE `docs` DISABLE KEYS */;
INSERT INTO `docs` VALUES (1,'Паспорт гражданина РФ','10 цифр, серия и номер без пробелов'),(2,'Заграничный паспорт','11 цифр');
/*!40000 ALTER TABLE `docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='События, связанные с самолётом';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'По расписанию'),(2,'Регистрация'),(3,'Идёт посадка'),(4,'Посадка завершена'),(5,'Вылетел'),(6,'Рейс прибыл'),(7,'Рейс задерживается'),(8,'Рейс отменён'),(9,'Вылет задерживается'),(10,'Рейс завершён');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(10) DEFAULT NULL COMMENT 'Номер рейса',
  `flight_type` varchar(20) DEFAULT NULL,
  `airline_id` bigint unsigned NOT NULL,
  `aircraft_id` bigint unsigned NOT NULL,
  `airport_id` bigint unsigned NOT NULL,
  `city_id` bigint unsigned NOT NULL,
  `scheduled_datetime_start` datetime DEFAULT NULL COMMENT 'Время вылета по расписанию',
  `estimated_datetime_start` datetime DEFAULT NULL COMMENT 'Расчётное время вылета',
  `duration` time DEFAULT NULL COMMENT 'Продолжительность рейса',
  `scheduled_datetime_arrival` datetime NOT NULL COMMENT 'Время прилёта по расписанию',
  `estimated_datetime_arrival` datetime DEFAULT NULL COMMENT 'Расчётное время прилёта',
  `sector` enum('A','B') NOT NULL,
  `reception` int unsigned DEFAULT NULL COMMENT 'Стойка регистрации',
  `registration` datetime DEFAULT NULL COMMENT 'Начало регистрации',
  `boarding` datetime DEFAULT NULL COMMENT 'Посадка на борт',
  `boarding_sector` int unsigned DEFAULT NULL COMMENT 'Сектор выхода на посадку',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_flight_number` (`flight_number`),
  KEY `fk_flights_aircraft_id` (`airline_id`),
  KEY `fk_flights_aircraftid` (`aircraft_id`),
  KEY `fk_flights_airport_id` (`airport_id`),
  KEY `fk_flights_city_id` (`city_id`),
  CONSTRAINT `fk_flights_aircraft_id` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`),
  CONSTRAINT `fk_flights_aircraftid` FOREIGN KEY (`aircraft_id`) REFERENCES `aircrafts` (`id`),
  CONSTRAINT `fk_flights_airport_id` FOREIGN KEY (`airport_id`) REFERENCES `airports` (`id`),
  CONSTRAINT `fk_flights_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Рейсы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'S7 2166','Outgoing',102,48,1,4,'2022-04-26 13:05:00','2022-04-26 13:15:00','05:20:00','2022-04-26 18:25:00','2022-04-26 18:30:00','A',6,'2022-04-26 10:47:00','2022-04-26 12:25:00',1),(2,'U6 206','Outgoing',98,44,2,3,'2022-04-17 18:30:00','2022-04-17 18:55:00',NULL,'2022-04-18 01:35:00','2022-04-18 01:36:00','A',3,'2022-04-17 16:30:00','2022-04-17 17:50:00',2),(3,'FZ 977','Incoming',94,40,9,5,NULL,NULL,NULL,'2022-04-18 02:30:00','2022-04-18 02:23:00','B',NULL,NULL,NULL,NULL),(4,'NS 1526','Outgoing',95,41,8,2,'2022-04-18 23:05:00','2022-04-18 22:45:00','04:20:00','2022-04-19 03:25:00','2022-04-19 03:30:00','B',14,'2022-04-17 20:45:00','2022-04-17 22:20:00',6),(5,'WZ 1133','Incoming',99,45,7,1,NULL,NULL,NULL,'2022-04-19 09:35:00','2022-04-19 09:32:00','A',NULL,NULL,NULL,NULL),(6,'PA 0205','Outgoing',97,43,5,10,'2022-04-20 23:05:00','2022-04-20 23:15:00','05:20:00','2022-04-21 04:25:00','2022-04-21 03:05:00','A',16,'2022-04-20 20:37:00','2022-04-20 22:35:00',4),(7,'N4 163','Incoming',96,42,6,8,NULL,NULL,NULL,'2022-04-20 12:30:00','2022-04-20 11:47:00','A',NULL,NULL,NULL,NULL),(8,'A3 3736','Incoming',93,39,3,6,NULL,NULL,NULL,'2022-04-21 10:25:00','2022-04-21 09:55:00','A',NULL,NULL,NULL,NULL),(9,'SA 4647','Outgoing',100,46,4,9,'2022-04-22 05:05:00','2022-04-22 05:00:00','04:30:00','2022-04-22 09:35:00','2022-04-22 08:46:00','A',11,'2022-04-22 03:36:00','2022-04-22 04:25:00',3),(10,'TA 7778','Outgoing',101,47,10,7,'2022-04-17 13:05:00','2022-04-17 13:15:00','05:20:00','2022-04-17 18:25:00','2022-04-17 18:30:00','A',12,'2022-04-17 10:47:00','2022-04-17 12:25:00',5),(11,'S7 2166','Outgoing',102,49,3,7,'2022-04-26 19:20:00','2022-04-26 19:25:00','04:25:00','2022-04-26 23:45:00','2022-04-26 23:20:00','B',5,'2022-04-26 16:15:00','2022-04-26 18:40:00',3);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `flight_duration` BEFORE INSERT ON `flights` FOR EACH ROW BEGIN 
	IF (NEW.scheduled_datetime_start IS NOT NULL) AND (NEW.scheduled_datetime_arrival IS NOT NULL) 
	THEN
		SET NEW.duration = TIMEDIFF(NEW.scheduled_datetime_arrival, NEW.scheduled_datetime_start);
	-- SET NEW.duration = convert (DateDiff('h', NEW.scheduled_datetime_arrival, NEW.scheduled_datetime_start));
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `flight_id` bigint unsigned NOT NULL,
  `passenger_id` bigint unsigned NOT NULL,
  `payment_id` bigint unsigned NOT NULL COMMENT 'Способ оплаты',
  `phone` char(11) NOT NULL COMMENT 'Актуальный номер телефона',
  `email` varchar(150) NOT NULL COMMENT 'Эл. адрес почты для доставки',
  `class` enum('Econom','Business','First') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `fk_orders_passenger_id` (`passenger_id`),
  KEY `fk_orders_flight_id` (`flight_id`),
  KEY `fk_orders_payment_id` (`payment_id`),
  CONSTRAINT `fk_orders_flight_id` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`),
  CONSTRAINT `fk_orders_passenger_id` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`),
  CONSTRAINT `fk_orders_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  CONSTRAINT `fk_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_chk_1` CHECK (regexp_like(`phone`,_utf8mb4'^[0-9]{11}$'))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,21,1,'89199254781','uvarov@ya.ru','Econom','2022-04-21 20:52:15','2022-04-21 20:52:15'),(2,3,3,22,2,'89520689712','lukin@gmail.com','First','2022-04-21 20:52:15','2022-04-21 20:52:15'),(3,4,4,23,1,'89521789712','milisalar@gmail.com','First','2022-04-21 20:52:15','2022-04-21 20:52:15'),(4,6,6,24,5,'89545851235','polianna@mail.ru','Business','2022-04-21 20:52:15','2022-04-21 20:52:15'),(5,1,1,25,1,'89199254781','uvarov@ya.ru','Econom','2022-04-21 20:52:15','2022-04-21 20:52:15'),(6,3,3,26,2,'89520689712','lukin@gmail.com','First','2022-04-21 20:52:15','2022-04-21 20:52:15'),(7,1,1,11,1,'89199254781','uvarov@ya.ru','Econom','2022-04-21 20:52:15','2022-04-21 20:52:15'),(8,2,2,16,4,'89506854545','fokin@mail.ru','Business','2022-04-21 20:52:15','2022-04-21 20:52:15'),(9,3,3,12,2,'89520689712','lukin@gmail.com','First','2022-04-21 20:52:15','2022-04-21 20:52:15'),(10,4,4,17,1,'89521789712','milisalar@gmail.com','First','2022-04-21 20:52:15','2022-04-21 20:52:15'),(11,5,5,13,3,'89523678459','hohlov@yandex.ru','Econom','2022-04-21 20:52:15','2022-04-21 20:52:15'),(12,6,6,18,5,'89545851235','polianna@mail.ru','Business','2022-04-21 20:52:15','2022-04-21 20:52:15'),(13,7,7,14,3,'89567845215','kozlova@mail.ru','Econom','2022-04-21 20:52:15','2022-04-21 20:52:15'),(14,8,8,19,4,'89547863215','trofimova@ya.ru','First','2022-04-21 20:52:15','2022-04-21 20:52:15'),(15,9,9,15,1,'89567887215','albinad@mail.ru','First','2022-04-21 20:52:15','2022-04-21 20:52:15'),(16,10,10,20,1,'89561237851','kara@yandex.ru','Business','2022-04-21 20:52:15','2022-04-21 20:52:15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `doc_id` bigint unsigned NOT NULL,
  `firstname` varchar(150) NOT NULL,
  `middlename` varchar(150) DEFAULT NULL COMMENT 'Если есть',
  `lastname` varchar(150) NOT NULL,
  `birthday` date NOT NULL COMMENT 'Дата рождения',
  `gender` enum('Female','Male','Not defined') NOT NULL,
  `doc_code` bigint unsigned NOT NULL COMMENT 'Серия и/или номер документа',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `doc_code` (`doc_code`),
  KEY `fk_passengers_doc_id` (`doc_id`),
  CONSTRAINT `fk_passengers_doc_id` FOREIGN KEY (`doc_id`) REFERENCES `docs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пассажиры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (11,1,'Тимур','Германнович','Уваров','1980-10-05','Male',9854123654),(12,2,'Аскольд','Михаилович','Лукин','1956-12-31','Male',95631159753),(13,2,'Болеслав','Константинович','Хохлов','1993-04-05','Male',78954632574),(14,1,'Эля','Викторовна','Козлова','2000-11-28','Female',7895456125),(15,2,'Альбина','Владленовна','Дьячкова','2001-10-30','Female',78942598712),(16,1,'Ибрагил','Христофорович','Фокин','1974-05-06','Male',7896125423),(17,1,'Милиса','Робертовна','Ларионова','1999-07-10','Female',4562879456),(18,2,'Полианна','Платоновна','Александрова','1983-08-15','Female',48456523691),(19,1,'Индира','Михайловна','Трофимова','1997-02-28','Female',1235478951),(20,2,'Кара','Николаевна','Аксёнова','1982-06-27','Female',14785236954),(21,2,'Исаак','Улебович','Кулаков','1989-12-25','Male',98547859541),(22,2,'Татьяна','Парфеньевна','Павлова','2000-01-23','Female',12581236545),(23,2,'Кира',NULL,'Калинина','2002-02-13','Female',12243336548),(24,1,'Гордий','Донатович','Блинов','2005-09-22','Male',5554383674),(25,1,'Донат',NULL,'Емельянов','1996-07-15','Male',1882523653),(26,2,'Исмаил','Абрамович','Лукин','2009-04-30','Male',11547859991);
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_doc_code_passengers` BEFORE INSERT ON `passengers` FOR EACH ROW BEGIN 
	IF (NEW.doc_id = 1) AND (NEW.doc_code != 10) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The id = 1 document code contains only 10 characters.';
	END IF;
	
	IF (NEW.doc_id = 2) AND (NEW.doc_code != 11) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The id = 2 document code contains only 11 characters.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_birthd_before_insert` BEFORE INSERT ON `passengers` FOR EACH ROW BEGIN 
	IF NEW.birthday >= NOW() THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update Canceled. Birthday must be in the past!';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_doc_code_passengers_insert` BEFORE INSERT ON `passengers` FOR EACH ROW BEGIN 
	-- проверка для паспорта РФ
	IF (NEW.doc_id = 1) AND (LENGTH(NEW.doc_code) != 10) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The id = 1 document code contains only 10 characters.'; 
	END IF;
	-- проверка для заграна
	IF (NEW.doc_id = 2) AND (LENGTH(NEW.doc_code) != 11) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The id = 2 document code contains only 11 characters.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_birthd_before_update` BEFORE UPDATE ON `passengers` FOR EACH ROW BEGIN 
	IF NEW.birthday >= NOW() THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update Canceled. Birthday must be in the past!';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_doc_code_passengers_update` BEFORE UPDATE ON `passengers` FOR EACH ROW BEGIN 
	-- проверка для паспорта РФ
	IF (NEW.doc_id = 1) AND (LENGTH(NEW.doc_code) != 10) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The id = 1 document code contains only 10 characters.'; 
	END IF;
	-- проверка для заграна
	IF (NEW.doc_id = 2) AND (LENGTH(NEW.doc_code) != 11) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The id = 2 document code contains only 11 characters.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(50) DEFAULT NULL,
  `addcost` decimal(4,2) DEFAULT NULL COMMENT 'Наценка',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Способ оплаты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'Оплата картой',0.00),(2,'Оплата наличными',0.00),(3,'Оплата через СБП',0.00),(4,'Оплата через PayPal',0.05),(5,'Оплата наложным платежом',0.15);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `flight_id` bigint unsigned NOT NULL,
  `flight_number` varchar(10) DEFAULT NULL,
  `econom_class` decimal(11,2) DEFAULT NULL,
  `business_class` decimal(11,2) DEFAULT NULL,
  `first_class` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_prices_flight_id` (`flight_id`),
  KEY `fk_prices_flight_number` (`flight_number`),
  CONSTRAINT `fk_prices_flight_id` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`),
  CONSTRAINT `fk_prices_flight_number` FOREIGN KEY (`flight_number`) REFERENCES `flights` (`flight_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Цены';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,1,'S7 2166',7300.00,14200.00,29500.00),(2,2,'U6 206',10500.00,21300.00,45050.00),(3,3,'FZ 977',3659.00,6578.00,12459.00),(4,4,'NS 1526',5950.00,11590.00,24590.00),(5,5,'WZ 1133',5650.00,10800.00,21500.00),(6,6,'PA 0205',7950.00,14900.00,30100.00),(7,7,'N4 163',8010.00,16790.00,35300.00),(8,8,'A3 3736',4230.00,9550.00,19900.00),(9,9,'SA 4647',10900.00,22100.00,46700.00),(10,10,'TA 7778',12500.00,27900.00,45300.00);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(150) NOT NULL,
  `middlename` varchar(150) DEFAULT NULL,
  `lastname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` char(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `users_chk_1` CHECK (regexp_like(`phone`,_utf8mb4'^[0-9]{11}$'))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Тимур','Германнович','Уваров','uvarov@ya.ru','89199254781','2022-04-18 15:39:11','2022-04-18 15:39:11'),(2,'Ибрагил','Христофорович','Фокин','fokin@mail.ru','89506854545','2022-04-18 15:39:11','2022-04-18 15:39:11'),(3,'Аскольд','Михаилович','Лукин','lukin@gmail.com','89520689712','2022-04-18 15:39:11','2022-04-18 15:39:11'),(4,'Милиса','Робертовна','Ларионова','milisalar@gmail.com','89521789712','2022-04-18 15:39:11','2022-04-18 15:39:11'),(5,'Болеслав','Константинович','Хохлов','hohlov@yandex.ru','89523678459','2022-04-18 15:39:11','2022-04-18 15:39:11'),(6,'Полианна','Платоновна','Александрова','polianna@mail.ru','89545851235','2022-04-18 15:39:11','2022-04-18 15:39:11'),(7,'Эля','Викторовна','Козлова','kozlova@mail.ru','89567845215','2022-04-18 15:39:11','2022-04-18 15:39:11'),(8,'Индира','Михайловна','Трофимова','trofimova@ya.ru','89547863215','2022-04-18 15:39:11','2022-04-18 15:39:11'),(9,'Альбина','Владленовна','Дьячкова','albinad@mail.ru','89567887215','2022-04-18 15:39:11','2022-04-18 15:39:11'),(10,'Кара','Николаевна','Аксёнова','kara@yandex.ru','89561237851','2022-04-18 15:39:11','2022-04-18 15:39:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_user_contacts_insert` BEFORE INSERT ON `users` FOR EACH ROW BEGIN 
	IF(NEW.phone IS NULL) OR (NEW.email IS NULL) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: The phone and email are NULL. Pleace, fill in one or both.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_user_contacts_update` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
  	IF(NEW.phone IS NULL) AND (NEW.email IS NULL) THEN 
  		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: The phone and email are NULL. Pleace, fill in one or both.';
  	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `aircrafts_airlines`
--

/*!50001 DROP VIEW IF EXISTS `aircrafts_airlines`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `aircrafts_airlines` AS select `a2`.`name` AS `airline`,`a`.`aircraft_model` AS `models`,`a`.`aircraft_number` AS `numbers` from (`aircrafts` `a` join `airlines` `a2` on((`a2`.`id` = `a`.`airline_id`))) order by `a2`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `avg_prices`
--

/*!50001 DROP VIEW IF EXISTS `avg_prices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `avg_prices` AS select avg(`prices`.`econom_class`) AS `AVG(econom_class)`,avg(`prices`.`business_class`) AS `AVG(business_class)`,avg(`prices`.`first_class`) AS `AVG(first_class)` from `prices` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `city_view`
--

/*!50001 DROP VIEW IF EXISTS `city_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `city_view` AS select `c1`.`name` AS `country`,`c1`.`code` AS `code`,`c2`.`name` AS `city`,`c2`.`sign_gmt` AS `sign`,`c2`.`gmt` AS `GMT`,`a`.`name` AS `airport` from ((`countries` `c1` join `cities` `c2` on((`c2`.`country_id` = `c1`.`id`))) join `airports` `a` on((`a`.`city_id` = `c2`.`id`))) order by `c1`.`name` */;
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

-- Dump completed on 2022-04-27 20:27:51
