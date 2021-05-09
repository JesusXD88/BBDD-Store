CREATE DATABASE  IF NOT EXISTS `Practica03` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `Practica03`;
-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Practica03
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorias` (
  `idCategoria` int(1) NOT NULL,
  `Nombre` text NOT NULL,
  `Secciones_idSeccion` int(11) NOT NULL,
  PRIMARY KEY (`idCategoria`,`Secciones_idSeccion`),
  KEY `fk_Categorias_Secciones1_idx` (`Secciones_idSeccion`),
  CONSTRAINT `fk_Categorias_Secciones1` FOREIGN KEY (`Secciones_idSeccion`) REFERENCES `Secciones` (`idSeccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (0,'Portatiles',0),(1,'Portatiles Gaming',0),(2,'CPUs',0),(3,'GPUs',0),(4,'RAMs',0),(5,'Monitores PC',1),(6,'Monitores High End PC',1),(7,'Proyectores',1),(8,'Televisones',1),(9,'Paneles',1),(10,'Lavavadoras',2),(11,'Lavavajillas',2),(12,'Planchas',2),(13,'Frigorificos',2),(14,'Congeladores',2),(15,'Sistemas de sonido',3),(16,'Reproductores multimedia',3),(17,'Musica',3),(18,'Peliculas',3),(19,'Tarjetas suscripcion',3),(20,'Carne',4),(21,'Pescado',4),(22,'Fruta y verdura',4),(23,'Alcohol alcohol alcohooool',4),(24,'Papas fritas',4);
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `Login` varchar(15) NOT NULL,
  `Correo Electronico` varchar(24) NOT NULL,
  `Password` varchar(16) NOT NULL,
  `NombreCompleto` varchar(45) NOT NULL,
  PRIMARY KEY (`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES ('Aleix','y9vgfv3zh@teacher.com','bD3cM1hB','Aleix Paniagua Santana'),('Begoña','ektvu57w8m@blu.it','lL2dB4fJ','Begoña Varela Bermudez'),('cliente','cliente@cliente.com','cliente','Cliente Cuenta'),('Manuela','ukezi@unforgettable.com','dH2bB4nJ','Manuela Ramos Calderon'),('Pakito23','pakitillo22@tumail.com','awaDeOwo','Paco Perico');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compras`
--

DROP TABLE IF EXISTS `Compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compras` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `fechaRealizacion` date NOT NULL,
  `totalCompra` int(11) NOT NULL,
  `fechaEnvio` date DEFAULT NULL,
  `fechaRecepcion` date DEFAULT NULL,
  `estadoCompra` enum('pendientes','enviadas','recibidas') NOT NULL,
  `Cliente_Login` varchar(15) NOT NULL,
  `Empresa de Transporte_Nombre` varchar(20) NOT NULL,
  `Direccion_idDireccion` int(11) NOT NULL,
  PRIMARY KEY (`idCompra`,`Cliente_Login`,`Empresa de Transporte_Nombre`,`Direccion_idDireccion`),
  KEY `fk_Compras_Cliente1_idx` (`Cliente_Login`),
  KEY `fk_Compras_Empresa de Transporte1_idx` (`Empresa de Transporte_Nombre`),
  KEY `fk_Compras_Direccion1_idx` (`Direccion_idDireccion`),
  CONSTRAINT `fk_Compras_Cliente1` FOREIGN KEY (`Cliente_Login`) REFERENCES `Cliente` (`Login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Compras_Direccion1` FOREIGN KEY (`Direccion_idDireccion`) REFERENCES `Direccion` (`idDireccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compras_Empresa de Transporte1` FOREIGN KEY (`Empresa de Transporte_Nombre`) REFERENCES `Empresa de Transporte` (`Nombre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compras`
--

LOCK TABLES `Compras` WRITE;
/*!40000 ALTER TABLE `Compras` DISABLE KEYS */;
INSERT INTO `Compras` VALUES (1,'2003-05-03',60,'2003-05-16','2003-05-23','pendientes','cliente','Gauleck Sa',0),(2,'2016-02-22',350,'2016-02-28','2016-03-04','pendientes','cliente','Tipland Sa',0),(3,'2019-03-16',1200,'2019-05-23','2019-04-06','pendientes','cliente','Hascope Sl',0),(4,'2013-09-03',1600,'2013-05-10','2013-09-23','pendientes','Aleix','Hascope Sl',0),(5,'2016-06-20',550,'2016-06-28','2016-07-04','pendientes','Aleix','Gauleck Sa',0),(6,'2019-10-15',150,'2019-10-25','2019-10-30','pendientes','Aleix','Domimint Sl',0),(7,'2011-02-06',426,'2011-02-16','2011-02-24','pendientes','Begoña','Gauleck Sa',0),(8,'2014-11-12',350,'2014-11-13','2014-11-18','pendientes','Begoña','Gauleck Sa',0),(9,'2009-07-04',20,'2009-07-08','2009-07-16','pendientes','Begoña','Hascope Sl',0),(10,'2008-01-15',236,'2008-01-16','2008-01-26','pendientes','Manuela','Tipland Sa',0),(11,'2015-07-21',948,'2015-07-22','2015-07-26','pendientes','Manuela','Gauleck Sa',0),(12,'2020-09-05',63,'2020-09-06','2020-09-28','pendientes','Manuela','Hascope Sl',0),(13,'2005-05-05',46,'2005-05-11','2005-05-25','pendientes','Pakito23','Gauleck Sa',0),(14,'2017-05-04',573,'2017-05-08','2017-05-28','pendientes','Pakito23','Tipland Sa',0),(15,'2018-05-19',1395,'2018-05-22','2018-05-25','pendientes','Pakito23','Domimint Sl',0);
/*!40000 ALTER TABLE `Compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Direccion`
--

DROP TABLE IF EXISTS `Direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Direccion` (
  `idDireccion` int(11) NOT NULL AUTO_INCREMENT,
  `Calle` varchar(45) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Piso` int(11) NOT NULL,
  `Letra` varchar(1) NOT NULL,
  `Codigo Postal` varchar(5) NOT NULL,
  `Ciudad` varchar(20) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `Cliente_Login` varchar(15) NOT NULL,
  PRIMARY KEY (`idDireccion`,`Cliente_Login`),
  KEY `fk_Direccion_Cliente_idx` (`Cliente_Login`),
  CONSTRAINT `fk_Direccion_Cliente` FOREIGN KEY (`Cliente_Login`) REFERENCES `Cliente` (`Login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Direccion`
--

LOCK TABLES `Direccion` WRITE;
/*!40000 ALTER TABLE `Direccion` DISABLE KEYS */;
INSERT INTO `Direccion` VALUES (1,'Camino Catalunya',34,5,'A','17425','Girona','622201622','Pakito23'),(2,'Alameda Horno',93,2,'E','45001','Toledo','790692795','cliente'),(3,'Jardins Real',4,1,'B','50010','Zaragoza','618999069','Pakito23'),(4,'Kalea Madrid',63,8,'F','17425','Albacete','661155712','Aleix'),(5,'Passeig Horno',38,5,'C','22410','Huesca','627659049','Manuela'),(6,'Barrio Catalunya',21,7,'G','14748','Córdoba','626108051','cliente'),(7,'Plaza Madrid',34,5,'A','17425','Girona','622201622','Pakito23'),(8,'Camí Mayor',46,2,'F','10957','Cáceres','755490439','Begoña'),(9,'Glorieta Nueva',0,3,'E','24156','León','614861438','Pakito23'),(10,'Urbanización Horno',60,9,'H','25085','Lleida','709034159','Aleix'),(11,'Carrer Mayor',86,0,'A','02324','Albacete','735232761','Manuela'),(12,'Plaza Nueva',17,6,'D','44385','Teruel','636600972','Begoña'),(13,'Cuesta Real',26,5,'B','09665','Burgos','681785585','cliente'),(14,'Poblado Mayor',70,4,'E','06298','Badajoz','720090375','Manuela'),(15,'Rúa Nueva',69,3,'C','20038','Gipuzkoa','635254258','Pakito23');
/*!40000 ALTER TABLE `Direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa de Transporte`
--

DROP TABLE IF EXISTS `Empresa de Transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empresa de Transporte` (
  `Nombre` varchar(20) NOT NULL,
  `Telefono` varchar(9) NOT NULL,
  `Ciudad` varchar(20) NOT NULL,
  `Correo Electronico` varchar(24) NOT NULL,
  `Login` varchar(15) NOT NULL,
  `Password` varchar(16) NOT NULL,
  PRIMARY KEY (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa de Transporte`
--

LOCK TABLES `Empresa de Transporte` WRITE;
/*!40000 ALTER TABLE `Empresa de Transporte` DISABLE KEYS */;
INSERT INTO `Empresa de Transporte` VALUES ('Domimint Sl','959955007','Elantxobe','wd8td1zvr@lycos.it','Puig','cH6cH1jE'),('empresa','912263134','Almeria','adadasd@adfsdfs.com','empresa','empresa'),('Gauleck Sa','960073135','Teruel','5d16zdlr@email.com','Jairo','fN1oF2sB'),('Hascope Sl','975972943','Alicante','jih05fna@lycos.de','Noelia','bE6bH6pG'),('Tipland Sa','972962134','Campezo','emskf5z2w@btinternet.com','Emilia','nJ5dB1uG');
/*!40000 ALTER TABLE `Empresa de Transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mensajes`
--

DROP TABLE IF EXISTS `Mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mensajes` (
  `idMensaje` int(11) NOT NULL,
  `Texto` varchar(45) NOT NULL,
  `Empresa de Transporte_Nombre` varchar(20) NOT NULL,
  `Compras_idCompra` int(11) NOT NULL,
  PRIMARY KEY (`idMensaje`,`Empresa de Transporte_Nombre`,`Compras_idCompra`),
  KEY `fk_Mensajes_Empresa de Transporte1_idx` (`Empresa de Transporte_Nombre`),
  KEY `fk_Mensajes_Compras1_idx` (`Compras_idCompra`),
  CONSTRAINT `fk_Mensajes_Compras1` FOREIGN KEY (`Compras_idCompra`) REFERENCES `Compras` (`idCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mensajes_Empresa de Transporte1` FOREIGN KEY (`Empresa de Transporte_Nombre`) REFERENCES `Empresa de Transporte` (`Nombre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mensajes`
--

LOCK TABLES `Mensajes` WRITE;
/*!40000 ALTER TABLE `Mensajes` DISABLE KEYS */;
INSERT INTO `Mensajes` VALUES (1,'Realizado','Gauleck Sa',15),(2,'Perfecto','Domimint Sl',14),(3,'A la espera de ser enviado','Gauleck Sa',13),(4,'Comprado','Domimint Sl',12),(5,'Sin recibir','Hascope Sl',11),(6,'Reventado','Tipland Sa',10),(7,'En mal estado','Tipland Sa',9),(8,'Sin opinion','Domimint Sl',8),(9,'Encantado','Tipland Sa',7),(10,'Sin identificar','Hascope Sl',6),(11,'Listo para partir','Tipland Sa',5),(12,'Declarado','Domimint Sl',4),(13,'No revisado','Gauleck Sa',3),(14,'Preparando','Domimint Sl',2),(15,'Entregado','Hascope Sl',1),(16,'Hola','Hascope Sl',1);
/*!40000 ALTER TABLE `Mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Objetivos`
--

DROP TABLE IF EXISTS `Objetivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Objetivos` (
  `seccionesObjetivo` varchar(30) DEFAULT NULL,
  `fechaSuperacion` date DEFAULT NULL,
  `Secciones_idSeccion` int(11) NOT NULL,
  KEY `fk_Objetivos_Secciones1_idx` (`Secciones_idSeccion`),
  CONSTRAINT `fk_Objetivos_Secciones1` FOREIGN KEY (`Secciones_idSeccion`) REFERENCES `Secciones` (`idSeccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Objetivos`
--

LOCK TABLES `Objetivos` WRITE;
/*!40000 ALTER TABLE `Objetivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Objetivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Productos` (
  `Codigo` int(3) NOT NULL,
  `Nombre` varchar(33) NOT NULL,
  `Descripcion` varchar(26) NOT NULL,
  `Precio` int(5) NOT NULL,
  `Fabricante` varchar(22) NOT NULL,
  `Categorias_idCategoria` int(1) NOT NULL,
  `Proveedores_idProveedor` int(1) NOT NULL,
  PRIMARY KEY (`Codigo`,`Categorias_idCategoria`,`Proveedores_idProveedor`),
  KEY `fk_Productos_Categorias1_idx` (`Categorias_idCategoria`),
  KEY `fk_Productos_Proveedores1_idx` (`Proveedores_idProveedor`),
  CONSTRAINT `fk_Productos_Categorias1` FOREIGN KEY (`Categorias_idCategoria`) REFERENCES `Categorias` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Productos_Proveedores1` FOREIGN KEY (`Proveedores_idProveedor`) REFERENCES `Proveedores` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (0,'Ceronium','rekkles',200,'Faker',21,7),(1,'shina','naves',200,'raggo',0,2),(2,'ovvodaver','kifilat',100,'zhirat',0,3),(3,'frar','arentat',500,'yolak',0,4),(4,'torik','sathe',600,'lainajin',0,0),(5,'OMEN 15','Freidora 95',1300,'HP',1,2),(6,'ROG Strix','Mola',1500,'ASUS',1,0),(7,'Legion 17','Meh',1400,'Lenovo',1,4),(8,'Predator','Guapo',1000,'Acer',1,0),(9,'XTREME','Molaa',2000,'MSI',1,0),(10,'i3','Patata',100,'Intel',2,0),(11,'i5','Meh',300,'Intel',2,0),(12,'i7','Pontente pero freidora',500,'Intel',2,0),(13,'Ryzen 7','Bicho',520,'AMD',2,0),(14,'i9','Bicharracooo',900,'Intel',2,0),(15,'GTX 1080 Ti','Molaa',700,'NVIDIA',3,0),(16,'RX 380','Meh',400,'AMD',3,0),(17,'RTX 2060','GG',400,'NVIDIA',3,0),(18,'RTX 2080 Ti','Bicho',800,'NVIDIA',3,1),(19,'RTX 3090','Bicharracoo',1500,'NVIDIA',3,3),(20,'Corsair 8','8',150,'Corsair',4,0),(21,'Corsair 16','300',400,'Corsair',4,0),(22,'MSI 16','16',280,'MSI',4,0),(23,'MSI 32','MM',500,'MSI',4,0),(24,'Corsair 64','Bicho',600,'Corsair',4,3),(25,'aaa','aaa',515,'aaa',5,0),(26,'asdasd','asdasd',200,'sasdasd',5,2),(27,'ohat','thesemrat',2727,'chostokh',5,3),(28,'dfasdfasdf','sfsafasdf',300,'dsafsdafas',5,4),(29,'asdano','asdano',555,'asdano',5,1),(30,'gurzum','krutgalu',400,'bagurut',6,0),(31,'luguu','gunkh',600,'grish',6,1),(32,'gimor','galagaakh',100,'guluk',6,1),(33,'ghautundu','talkrish',800,'gorguz',6,4),(34,'throg','nazagal',100,'tiinkil',6,1),(35,'makhgal','nazgal',1000,'krinudurz',7,0),(36,'shaekarra','viselyx',600,'rhaelael',7,3),(37,'elaelaera','vaenelyx',666,'jahaerel',7,0),(38,'naegelon','jahaenela',777,'saell',7,0),(39,'balaerys','aulara',500,'vagelys',7,1),(40,'gerto','walsk',110,'dester',8,1),(41,'krinudurz','dush',360,'dagal',8,4),(42,'krubagd','throg',0,'srimat',0,0),(43,'gorgalug','talatu',700,'shar',8,4),(44,'lugun','baghakai',120,'drumperme',8,1),(45,'aldorta','linya',300,'alkonye',9,0),(46,'omevann','arith',420,'nieldo',9,1),(47,'arnien','koion',0,'nieren',9,2),(48,'karaglad','fenna',700,'innalinde',9,1),(49,'turkar','gilor',900,'erelda',9,0),(50,'gorondirn','radil',50,'gorwend',10,1),(51,'durnakin','celmo',130,'elfir',10,1),(52,'elfir','breth',144,'forind',10,3),(53,'smar','stele',75,'glas',10,0),(54,'fienor','forbulm',600,'malch',10,3),(55,'nivran','gwalendar',300,'glariond',11,4),(56,'elfatin','isiadog',200,'samaruin',11,0),(57,'alas','morn',60,'echer',11,1),(58,'belfin','celeb',150,'morn',11,3),(59,'mith','bombratar',90,'halloth',11,2),(60,'dayancon','land',70,'bhalf',12,0),(61,'harvals','torn',100,'clessa',12,2),(62,'quarles','azzanfrel',150,'dory',12,0),(63,'beaker','dautt',90,'rezza',12,2),(64,'myra','kandic',200,'marso',12,4),(65,'shagle','jayard',500,'ermanceno',13,0),(66,'andbro','whien',660,'duste II',13,4),(67,'oaket','destiffor',120,'learry',13,1),(68,'grah','tatair',0,'edmundra',13,0),(69,'edmundra','creennys',400,'renne',13,2),(70,'flivant','plangell',440,'silil',14,0),(71,'deliveran','fleus',300,'xennympos',14,0),(72,'krent','malle',550,'grina',14,3),(73,'burm','hepudge',290,'micks',14,3),(74,'swelia','arant',630,'rolianks',14,0),(75,'nuridge','abes',360,'evanks',15,4),(76,'fill','pomar',500,'flitch',15,0),(77,'plack','treas',777,'kingers',15,4),(78,'snages','johopplas',440,'holey',15,0),(79,'evey','quarrise',780,'affinne',15,4),(80,'affinne','battedwee',99,'twizack',16,0),(81,'wizarge','fuddy',360,'maliand',16,0),(82,'regus','pomor',220,'leant',16,3),(83,'scres','abble',90,'minalde',16,2),(84,'hepudger','petombes',50,'scat',16,0),(85,'Avicii Levels','Levels',20,'Avicii',17,4),(86,'INNA Be My Lover','Be My Lover',17,'INNA',17,4),(87,'ABBA Gimme Gimme Gimme','Gimme Gimme Gimme',20,'ABBA',17,1),(88,'Avicii Rapture New Generation Mix','Rapture New Generation Mix',20,'Avicii',17,4),(89,'LP Leave Out All The Rest','Leave Out All The Rest',27,'Leave Out All The Rest',17,4),(90,'50 Sombras de Grey','XD',0,'Pelicula',18,0),(91,'rego','rostus',12,'silforell',18,1),(92,'fillocks','ruffir',30,'doleus',18,3),(93,'holotagoy','geody',50,'batervan',18,4),(94,'olys','ola',21,'durs',18,2),(95,'Steam 50','awa',50,'Steam',19,0),(96,'PSN 20','ewe',20,'Sony',19,3),(97,'Amazon 100','iwi',100,'Amazon',19,1),(98,'LoL 20','owo',20,'Riot',19,0),(99,'Paysafe 10','uwu',10,'Paysafe',19,4),(100,'Chuletas de cordero','Mu ricas',20,'La Alpujarra',20,0),(101,'Lomo de cerdo','Ricoo',15,'Carnicas Ugijar',20,3),(102,'Salchichon','Buenissimo',10,'Pena Cruz',20,1),(103,'Costilla','Buena',13,'Carnicas Almeria',20,0),(104,'Jamon Iberico','Mu rico',70,'Trevelez',20,4),(105,'Mero','Bueno',40,'Mar',21,0),(106,'Sargo','Bueno al horno',30,'Mar',21,2),(107,'Navajas','Ricas de la Ria de Arouxa',36,'Galicia',21,4),(108,'Almejas','Buenas al vapor',30,'Carril',21,4),(109,'Gambon Rojo','ummmm',90,'Garrucha',21,4),(110,'Lentejas','Te las dejas',5,'Luengo',22,1),(111,'Setas','Alucinogenas',20,'UwU',22,3),(112,'Naranjas','Bien Naranjitas',4,'Arbol',22,2),(113,'Cebolla','Lloro',2,'Campo',22,1),(114,'Mandarinas','Pequenitas',6,'Arbol',22,4),(115,'Jaegger','xd',10,'Jaeegerminster',23,0),(116,'Ron','Ronald',16,'Ronald',23,3),(117,'Ginebra','Gin',14,'Larios',23,2),(118,'Liquorix','Licor',14,'Liquor',23,0),(119,'Vodka','Russia',17,'Vodkom',23,4),(120,'Pringles Cebolla','Ricas',2,'Pringles',24,0),(121,'Ruffles Jamon','Ricas',1,'Ruffles',24,1),(122,'Papas','Papas',1,'Pasy',24,2),(123,'Doritos Chilli','Pican pero estan ricos',2,'Doritos',24,4),(124,'Bits','Fernando Alonsoo',1,'Bits',24,4),(136,'Caro','Caro',1000006,'Caro',4,6),(140,'Caro','Caro',10004896,'Caro',3,7),(141,'Caro','Caro',10004896,'Caro',3,4);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos Favoritos`
--

DROP TABLE IF EXISTS `Productos Favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Productos Favoritos` (
  `Cliente_Login` varchar(15) NOT NULL,
  `Productos_Codigo` int(3) NOT NULL,
  PRIMARY KEY (`Cliente_Login`,`Productos_Codigo`),
  KEY `fk_Productos Favoritos_Cliente1_idx` (`Cliente_Login`),
  KEY `fk_Productos Favoritos_Productos1_idx` (`Productos_Codigo`),
  CONSTRAINT `fk_Productos Favoritos_Cliente1` FOREIGN KEY (`Cliente_Login`) REFERENCES `Cliente` (`Login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Productos Favoritos_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `Productos` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos Favoritos`
--

LOCK TABLES `Productos Favoritos` WRITE;
/*!40000 ALTER TABLE `Productos Favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Productos Favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos de la Compra`
--

DROP TABLE IF EXISTS `Productos de la Compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Productos de la Compra` (
  `Cantidad` int(11) NOT NULL,
  `estadoDevolucion` enum('Sin devolver','Pendiente de devolver','Ya ha sido devuelto') NOT NULL,
  `Compras_idCompra` int(11) NOT NULL,
  `Productos_Codigo` int(3) NOT NULL,
  PRIMARY KEY (`Compras_idCompra`,`Productos_Codigo`),
  KEY `fk_Productos de la Compra_Compras1_idx` (`Compras_idCompra`),
  KEY `fk_Productos de la Compra_Productos1_idx` (`Productos_Codigo`),
  CONSTRAINT `fk_Productos de la Compra_Compras1` FOREIGN KEY (`Compras_idCompra`) REFERENCES `Compras` (`idCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Productos de la Compra_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `Productos` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos de la Compra`
--

LOCK TABLES `Productos de la Compra` WRITE;
/*!40000 ALTER TABLE `Productos de la Compra` DISABLE KEYS */;
INSERT INTO `Productos de la Compra` VALUES (2,'Sin devolver',1,6),(1,'Sin devolver',1,30),(1,'Sin devolver',2,20),(6,'Sin devolver',2,50),(7,'Sin devolver',2,95),(4,'Pendiente de devolver',3,50),(3,'Ya ha sido devuelto',3,100),(7,'Sin devolver',4,34),(3,'Sin devolver',4,38),(6,'Sin devolver',4,55),(5,'Sin devolver',5,33),(4,'Sin devolver',5,56),(6,'Sin devolver',5,60),(54,'Sin devolver',6,73),(55,'Sin devolver',6,74),(1,'Pendiente de devolver',6,75),(55,'Sin devolver',6,77),(2,'Ya ha sido devuelto',6,111),(6,'Sin devolver',7,5),(6,'Sin devolver',7,6),(8,'Sin devolver',7,36),(6,'Sin devolver',7,43),(3,'Sin devolver',7,44),(1,'Sin devolver',7,60),(3,'Sin devolver',8,48),(3,'Sin devolver',8,91),(10,'Sin devolver',8,123),(8,'Pendiente de devolver',9,11),(1,'Ya ha sido devuelto',9,18),(3,'Sin devolver',9,49),(33,'Sin devolver',9,50),(36,'Sin devolver',10,50),(9,'Sin devolver',10,59),(3,'Sin devolver',10,72),(2,'Sin devolver',11,81),(1,'Sin devolver',11,104),(10,'Pendiente de devolver',12,4),(5,'Ya ha sido devuelto',12,22),(2,'Sin devolver',13,53),(4,'Sin devolver',13,88),(1,'Sin devolver',14,76),(2,'Sin devolver',14,97),(2,'Pendiente de devolver',15,2),(3,'Ya ha sido devuelto',15,124);
/*!40000 ALTER TABLE `Productos de la Compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger RefreshSaldoSeccion
after insert on `Productos de la Compra`
for each row begin
	declare iSec int(2);
    declare fecha date;
    declare imp int(10);
    declare precio int(10);

	select Categorias.Secciones_idSeccion into iSec from Categorias 
    inner join Productos on Categorias.idCategoria = Productos.Categorias_idCategoria
    where Productos.Codigo = new.Productos_Codigo;
    
    select Compras.fechaRealizacion into fecha from Compras 
    where Compras.idCompra = new.Compras_idCompra;
    
	select Productos.Precio into precio from Productos 
    where Productos.Codigo = new.Productos_Codigo;
	
    set imp = new.Cantidad;
    
    update SaldoSeccion
		set SaldoSeccion.fechaActualizacion = fecha,
		SaldoSeccion.totalCompras = SaldoSeccion.totalCompras + imp
	where idSeccion in 
		(select Categorias.Secciones_idSeccion from Categorias
		inner join Productos on Categorias.idCategoria = Productos.Categorias_idCategoria
        where Productos.Codigo = new.Productos_Codigo);

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Productos del Carrito`
--

DROP TABLE IF EXISTS `Productos del Carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Productos del Carrito` (
  `Cantidad` int(11) NOT NULL,
  `Cliente_Login` varchar(15) NOT NULL,
  `Productos_Codigo` int(3) NOT NULL,
  PRIMARY KEY (`Cliente_Login`,`Productos_Codigo`),
  KEY `fk_Productos del Carrito_Cliente1_idx` (`Cliente_Login`),
  KEY `fk_Productos del Carrito_Productos1_idx` (`Productos_Codigo`),
  CONSTRAINT `fk_Productos del Carrito_Cliente1` FOREIGN KEY (`Cliente_Login`) REFERENCES `Cliente` (`Login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Productos del Carrito_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `Productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos del Carrito`
--

LOCK TABLES `Productos del Carrito` WRITE;
/*!40000 ALTER TABLE `Productos del Carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Productos del Carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proveedores` (
  `idProveedor` int(1) NOT NULL,
  `Nombre` varchar(26) NOT NULL,
  `Direccion` varchar(78) NOT NULL,
  `Correo Electronico` varchar(24) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `CIF` varchar(9) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (0,'Aina Trujillo','Passeig Enrique, 6, Entre suelo 3','','994954761','03106132F'),(1,'Hugo Luevano','Travessera Roybal, 3, Atico 3','','687937730','81983168X'),(2,'Maria Reyes','Cami Iglesia, 83, 37762, Serradilla Del Arroyo(salamanca)','','766956453','04133989E'),(3,'Juan Jesus Losada Cuadrado','Passatge Real, 72, 17660, Llado(girona)','','795628593','52606412F'),(4,'Manuel Medina Izquierdo','Carretera Madrid, 80, 19017, Hita(guadalajara)','','769097830','85727024K'),(5,'Benjamin Cruz Reyes','Carretera Nueva, 67, 43898, Poboleda(tarragona)','','796276528','74800732V'),(6,'Eneko Coll Recio','Travesia Catalunya, 96, 24621, Roperuelos Del Paramo(leon)','','734696168','70358379E'),(7,'Alexander Arevalo Figueroa','Kalea Iglesia, 76, 37510, Cubo De Don Sancho, El(salamanca)','','782456723','91500365V'),(8,'Rafaela Dorado Davila','Praza Iglesia, 29, 01858, San Millan/donemiliaga(araba/alava)','','674818600','96684594T'),(9,'Simon Redondo Marquez','Travesia Madrid, 43, 26207, Ajamil De Cameros(rioja, La)','','684570025','40578600E');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SaldoSeccion`
--

DROP TABLE IF EXISTS `SaldoSeccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SaldoSeccion` (
  `fechaActualizacion` date DEFAULT NULL,
  `totalCompras` int(11) DEFAULT NULL,
  `idSeccion` int(11) NOT NULL,
  PRIMARY KEY (`idSeccion`),
  KEY `idSeccion` (`idSeccion`),
  CONSTRAINT `SaldoSeccion_ibfk_1` FOREIGN KEY (`idSeccion`) REFERENCES `Secciones` (`idSeccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SaldoSeccion`
--

LOCK TABLES `SaldoSeccion` WRITE;
/*!40000 ALTER TABLE `SaldoSeccion` DISABLE KEYS */;
INSERT INTO `SaldoSeccion` VALUES ('2021-05-09',35045,0),('2021-05-09',2803,1),('2011-02-06',2170,2),('2016-02-22',2450,3),('2021-05-08',433,4);
/*!40000 ALTER TABLE `SaldoSeccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger UpdateSaldoTienda
before update on SaldoSeccion
for each row begin
	insert into SaldoTiendaVirtual (saldo, fechaSaldo, SaldoSeccion_idSeccion) 
    values (new.totalCompras, new.fechaActualizacion, new.idSeccion);
end */;;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger ActualizarObjetivos
after update on SaldoSeccion
for each row begin
	if new.totalCompras > 100000
    then
			insert into Objetivos (totalCompras,  fechaSuperacion, Secciones_idSeccion)
            values (new.totalCompras, new.fechaActualizacion, new.idSeccion);
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SaldoTiendaVirtual`
--

DROP TABLE IF EXISTS `SaldoTiendaVirtual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SaldoTiendaVirtual` (
  `saldo` float DEFAULT NULL,
  `fechaSaldo` date DEFAULT NULL,
  `SaldoSeccion_idSeccion` int(11) NOT NULL,
  KEY `fk_SaldoTiendaVirtual_SaldoSeccion1_idx` (`SaldoSeccion_idSeccion`),
  CONSTRAINT `fk_SaldoTiendaVirtual_SaldoSeccion1` FOREIGN KEY (`SaldoSeccion_idSeccion`) REFERENCES `SaldoSeccion` (`idSeccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SaldoTiendaVirtual`
--

LOCK TABLES `SaldoTiendaVirtual` WRITE;
/*!40000 ALTER TABLE `SaldoTiendaVirtual` DISABLE KEYS */;
INSERT INTO `SaldoTiendaVirtual` VALUES (0,NULL,0),(12000,'2003-05-03',0),(1600,'2003-05-03',1),(1200,'2016-02-22',2),(1400,'2016-02-22',3),(240,'2019-03-16',4),(15000,'2003-05-03',0),(2000,'2003-05-03',1),(1500,'2016-02-22',2),(1750,'2016-02-22',3),(300,'2019-03-16',4),(18000,'2003-05-03',0),(2400,'2003-05-03',1),(1800,'2016-02-22',2),(2100,'2016-02-22',3),(360,'2019-03-16',4),(21000,'2003-05-03',0),(2800,'2003-05-03',1),(2100,'2016-02-22',2),(2450,'2016-02-22',3),(420,'2019-03-16',4),(2133,'2009-07-04',2),(2169,'2008-01-15',2),(2170,'2011-02-06',2),(27988,'2019-10-15',0),(34976,'2008-01-15',0),(34977,'2021-05-08',0),(34978,'2021-05-08',0),(34979,'2021-05-08',0),(34980,'2021-05-08',0),(34983,'2021-05-08',0),(34985,'2021-05-08',0),(34987,'2021-05-08',0),(430,'2021-05-08',4),(34990,'2021-05-08',0),(34993,'2021-05-08',0),(433,'2021-05-08',4),(35003,'2021-05-08',0),(35010,'2021-05-09',0),(35016,'2021-05-09',0),(35021,'2021-05-09',0),(35030,'2021-05-09',0),(35034,'2021-05-09',0),(35036,'2021-05-09',0),(35039,'2021-05-09',0),(35045,'2021-05-09',0),(2803,'2021-05-09',1);
/*!40000 ALTER TABLE `SaldoTiendaVirtual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Secciones`
--

DROP TABLE IF EXISTS `Secciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Secciones` (
  `idSeccion` int(11) NOT NULL,
  `Nombre` varchar(37) NOT NULL,
  PRIMARY KEY (`idSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Secciones`
--

LOCK TABLES `Secciones` WRITE;
/*!40000 ALTER TABLE `Secciones` DISABLE KEYS */;
INSERT INTO `Secciones` VALUES (0,'Informatica'),(1,'Monitores, proyectores y televisiones'),(2,'Electrodomesticos'),(3,'Multimedia'),(4,'Comida');
/*!40000 ALTER TABLE `Secciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Practica03'
--

--
-- Dumping routines for database 'Practica03'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-09 22:44:16
