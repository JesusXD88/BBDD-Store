CREATE DATABASE  IF NOT EXISTS `BBDD-DB` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `BBDD-DB`;
-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: BBDD-DB
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
INSERT INTO `Compras` VALUES (1,'2003-05-03',60,'2003-05-16','2003-05-23','pendientes','cliente','Gauleck Sa',4),(2,'2016-02-22',350,'2016-02-28','2016-03-04','pendientes','cliente','Tipland Sa',3),(3,'2019-03-16',1200,'2019-05-23','2019-04-06','pendientes','cliente','Hascope Sl',1),(4,'2013-09-03',1600,'2013-05-10','2013-09-23','pendientes','Aleix','Hascope Sl',2),(5,'2016-06-20',550,'2016-06-28','2016-07-04','pendientes','Aleix','Gauleck Sa',7),(6,'2019-10-15',150,'2019-10-25','2019-10-30','pendientes','Aleix','Domimint Sl',8),(7,'2011-02-06',426,'2011-02-16','2011-02-24','pendientes','Begoña','Gauleck Sa',1),(8,'2014-11-12',350,'2014-11-13','2014-11-18','pendientes','Begoña','Gauleck Sa',6),(9,'2009-07-04',20,'2009-07-08','2009-07-16','recibidas','Begoña','Hascope Sl',12),(10,'2008-01-15',236,'2008-01-16','2008-01-26','pendientes','Manuela','Tipland Sa',10),(11,'2015-07-21',948,'2015-07-22','2015-07-26','pendientes','Manuela','Gauleck Sa',4),(12,'2020-09-05',63,'2020-09-06','2020-09-28','pendientes','Manuela','Hascope Sl',2),(13,'2005-05-05',46,'2005-05-11','2005-05-25','pendientes','Pakito23','Gauleck Sa',14),(14,'2017-05-04',573,'2017-05-08','2017-05-28','pendientes','Pakito23','Tipland Sa',5),(15,'2018-05-19',1395,'2018-05-22','2018-05-25','pendientes','Pakito23','Domimint Sl',12),(16,'2021-06-10',2600,'2021-07-12','2021-07-01','pendientes','cliente','Domimint Sl',2),(17,'2021-06-10',26,'2021-06-18','2021-07-19','pendientes','cliente','Domimint Sl',2),(18,'2021-06-10',4200,'2021-08-01','2021-07-15','enviadas','cliente','Hascope Sl',6),(19,'2021-06-10',90,'2021-06-13','2021-06-21','pendientes','cliente','Tipland Sa',13);
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
INSERT INTO `Mensajes` VALUES (1,'Realizado','Gauleck Sa',15),(2,'Perfecto','Domimint Sl',14),(3,'A la espera de ser enviado','Gauleck Sa',13),(4,'Comprado','Domimint Sl',12),(5,'Sin recibir','Hascope Sl',11),(6,'Reventado','Tipland Sa',10),(7,'En mal estado','Tipland Sa',9),(8,'Sin opinion','Domimint Sl',8),(9,'Encantado','Tipland Sa',7),(10,'Sin identificar','Hascope Sl',6),(11,'Listo para partir','Tipland Sa',5),(12,'Declarado','Domimint Sl',4),(13,'No revisado','Gauleck Sa',3),(14,'Preparando','Domimint Sl',2),(15,'Entregado','Hascope Sl',1),(16,'Hola','Hascope Sl',1),(17,'Lets gooo!!','Hascope Sl',12);
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
INSERT INTO `Productos` VALUES (1,'Dell XPS 15','Portatil mas potente',999,'Dell',0,2),(2,'IdeaPad 3','Lenovo uso normal',579,'Lenovo',0,3),(3,'HP 15s','HP oficina',619,'HP',0,4),(4,'Asus VivoBook 14','Asus Potente',749,'Asus',0,0),(5,'OMEN 15','Freidora 95',1300,'HP',1,2),(6,'ROG Strix','Mola',1500,'ASUS',1,0),(7,'Legion 17','Meh',1400,'Lenovo',1,4),(8,'Predator','Guapo',1000,'Acer',1,0),(9,'XTREME','Molaa',2000,'MSI',1,0),(10,'i3','Patata',100,'Intel',2,0),(11,'i5','Meh',300,'Intel',2,0),(12,'i7','Pontente pero freidora',500,'Intel',2,0),(13,'Ryzen 7','Bicho',520,'AMD',2,0),(14,'i9','Bicharracooo',900,'Intel',2,0),(15,'GTX 1080 Ti','Molaa',700,'NVIDIA',3,0),(16,'RX 380','Meh',400,'AMD',3,0),(17,'RTX 2060','GG',400,'NVIDIA',3,0),(18,'RTX 2080 Ti','Bicho',800,'NVIDIA',3,1),(19,'RTX 3090','Bicharracoo',1500,'NVIDIA',3,3),(20,'Corsair 8','8',150,'Corsair',4,0),(21,'Corsair 16','300',400,'Corsair',4,0),(22,'MSI 16','16',280,'MSI',4,0),(23,'MSI 32','MM',500,'MSI',4,0),(24,'Corsair 64','Bicho',600,'Corsair',4,3),(25,'Asus VP228DE','Monitor PC basico',108,'Asus',5,0),(26,'Samsung LS22','Samsung LED Monitor',109,'Samsung',5,2),(27,'Acer KA220HQ','Monitor de 21.5\"',113,'Acer',5,3),(28,'AOC 22B2H','Monitor moderno de 21,5\"',128,'AOC',5,4),(29,'Xiaomi Mi Desktop 1C','Monitor Full HD IPS',190,'Xiaomi',5,1),(30,'MSI Optix G24C4','eSports de MSI',199,'MSI',6,0),(31,'Dell S Series S27','Monitor para juegos curvo',229,'Dell',6,1),(32,'Acer KG251','Monitor TN 165Hz',219,'Acer',6,1),(33,'Samsung Odyssey G5','Monitor 34\" QHD 165Hz',800,'Samsung',6,4),(34,'AOC 24G2U','AOC 144Hz Gaming',239,'AOC',6,1),(35,'LG PH30JG','Proyector LG CineBeam',219,'LG',7,0),(36,'Optoma HD28e','Proyector de alto brillo',649,'Optoma',7,3),(37,'Epson EH TW610','Disfruta de pelis fav',449,'Epson',7,0),(38,'Benq MX536','Proyector Profesional',394,'Benq',7,0),(39,'Acer Essential',' Los colores realistas',286,'Acer',7,1),(40,'Xiaomi Mi TV 4A','Smart TV para todos',221,'Xiaomi',8,1),(41,'Samsung UE55','Contenido HDR10+',459,'Samsung',8,4),(42,'Acer Swift 5','Acer Estandar',999,'Acer',0,0),(43,'LG 43UP 4K','Una imagen realista',401,'LG',8,4),(44,'Philips 50PU 4K','Imagen excepcional',529,'Philips',8,1),(45,'Luxscreen Pantalla','Pantalla de videoproyec',89,'Luxscreen',9,0),(46,'Acer M87-S01MW','Superficie color blanco',55,'Acer',9,1),(47,'Phoenix 80\"','antalla tripode',49,'Phoenix',9,2),(48,'BenQ RM5502K','Pantalla Interactiva',3106,'BenQ',9,1),(49,'Samsung WM85R 85\"','Pizarra Digital',3790,'Samsung',9,0),(50,'Bosch WUU24','Lavadora de tapa baja',453,'Bosch',10,1),(51,'Balay 3TS982BD','Lavadora sencilla',429,'Balay',10,1),(52,'Candy CS 14','Lavadora con NFC',249,'Candy',10,3),(53,'Whirlpool TDLR 72','Lavadora Carga Superior',256,'Whirlpool',10,0),(54,'Teka WMT 40720','Lavadora de carga frontal',316,'Teka',10,3),(55,'Beko DVN05320W','Lavavajillas Capacidad 13',300,'Beko',11,4),(56,'Candy Brava H CF','Lavavajillas Acero Inox',304,'Candy',11,0),(57,'Balay 3VS52','Capacidad 12 Cubiertos',358,'Balay',11,1),(58,'Bosch SMS25','Capacidad 12 Cubiertos',439,'Bosch',11,3),(59,'AEG FFB53','Lavavajillas A+++',459,'AEG',11,2),(60,'Bosch TDA30','Plancha a Vapor 2800W',38,'Bosch',12,0),(61,'Cecotec FastFurious 5040','bsolute Plancha 3000W',100,'Cecotec',12,2),(62,'Rowenta Silence Steam Pro','Centro de Planchado 2800W',285,'Rowenta',12,0),(63,'Taurus STI2700','2700W Negra',40,'Taurus',12,2),(64,'Solac CPP6000','Optima Station 6.0',126,'Solac',12,4),(65,'Bosch KGN397IEQ','Combi A++ Acero Inox',649,'Bosch',13,0),(66,'HiSense RS6','Americano Total NoFrost',549,'HiSense',13,4),(67,'LG GBB71','Frigorifico Combi',559,'LG',13,1),(68,'Infiniton SBS 44','Americano F Blanco',499,'Infiniton',13,0),(69,'Siemens KG36','Combi NoFrost A++',529,'Siemens',13,2),(70,'Samsung RZ32','Congelador Twin 315L A++',736,'Samsung',14,0),(71,'Ignis CE210','Horizontal 204L',228,'Ignis',14,0),(72,'Beko RFNE','Vertical No Frost',534,'Beko',14,3),(73,'Teka TG1 80','Congelador Blanco A',199,'Teka',14,3),(74,'Balay 3GIF','Vertical Integrable A++',856,'Balay',14,0),(75,'Trust GXT 606','Altavoces RGB',22,'Trust',15,4),(76,'NGS Street Breaker','Altavoz Portatil BT 200W',126,'NGS',15,0),(77,'Energy Sistem Urban Box','Altavoz estereo BT',19,'Energy Sistem',15,4),(78,'JBL Clip 4','Altavoz Bluetooth Azul',59,'JBL',15,0),(79,'Sony SRS-XB43','Altavoz con graves',229,'Sony',15,4),(80,'iPod Shuffle','Mini MP3 2GB Rosa',119,'Apple',16,0),(81,'Sony NWZ-B183F','MP3 4GB Azul',72,'Sony',16,0),(82,'SanDisk Clip Sport','MP3 32GB Negro/Azul',65,'SanDisk',16,3),(83,'SPC Pure Sound','MP3 Bluetooth 8GB Azul',39,'SPC',16,2),(84,'iPod Touch','iPhone sin celular',239,'Apple',16,0),(85,'Avicii Levels','Levels',20,'Avicii',17,4),(86,'INNA Be My Lover','Be My Lover',17,'INNA',17,4),(87,'ABBA Gimme Gimme Gimme','Gimme Gimme Gimme',20,'ABBA',17,1),(88,'Avicii Rapture New Generation Mix','Rapture New Generation Mix',20,'Avicii',17,4),(89,'LP Leave Out All The Rest','Leave Out All The Rest',27,'Leave Out All The Rest',17,4),(90,'50 Sombras de Grey','XD',0,'Pelicula',18,0),(91,'Los Juegos del Hambre','Vive LJDH',12,'Suzanne Collins',18,1),(92,'Star Wars','Luke yo soy tu padre',30,'Richard Marquand',18,3),(93,'Harry Potter Saga','Toda la saga de HP',50,'Peter Jackson',18,4),(94,'El Club de los 5','ola',21,'John Huges',18,2),(95,'Steam 50','awa',50,'Steam',19,0),(96,'PSN 20','ewe',20,'Sony',19,3),(97,'Amazon 100','iwi',100,'Amazon',19,1),(98,'LoL 20','owo',20,'Riot',19,0),(99,'Paysafe 10','uwu',10,'Paysafe',19,4),(100,'Chuletas de cordero','Mu ricas',20,'La Alpujarra',20,0),(101,'Lomo de cerdo','Ricoo',15,'Carnicas Ugijar',20,3),(102,'Salchichon','Buenissimo',10,'Pena Cruz',20,1),(103,'Costilla','Buena',13,'Carnicas Almeria',20,0),(104,'Jamon Iberico','Mu rico',70,'Trevelez',20,4),(105,'Mero','Bueno',40,'Mar',21,0),(106,'Sargo','Bueno al horno',30,'Mar',21,2),(107,'Navajas','Ricas de la Ria de Arouxa',36,'Galicia',21,4),(108,'Almejas','Buenas al vapor',30,'Carril',21,4),(109,'Gambon Rojo','ummmm',90,'Garrucha',21,4),(110,'Lentejas','Te las dejas',5,'Luengo',22,1),(111,'Setas','Alucinogenas',20,'UwU',22,3),(112,'Naranjas','Bien Naranjitas',4,'Arbol',22,2),(113,'Cebolla','Lloro',2,'Campo',22,1),(114,'Mandarinas','Pequenitas',6,'Arbol',22,4),(115,'Jaegger','xd',10,'Jaeegerminster',23,0),(116,'Ron','Ronald',16,'Ronald',23,3),(117,'Ginebra','Gin',14,'Larios',23,2),(118,'Liquorix','Licor',14,'Liquor',23,0),(119,'Vodka','Russia',17,'Vodkom',23,4),(120,'Pringles Cebolla','Ricas',2,'Pringles',24,0),(121,'Ruffles Jamon','Ricas',1,'Ruffles',24,1),(122,'Papas','Papas',1,'Pasy',24,2),(123,'Doritos Chilli','Pican pero estan ricos',2,'Doritos',24,4),(124,'Bits','Fernando Alonsoo',1,'Bits',24,4),(125,'Sony KD55 4K','Distingue cada detalle',779,'Sony',8,2);
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
INSERT INTO `Productos de la Compra` VALUES (2,'Sin devolver',1,6),(1,'Sin devolver',1,30),(1,'Sin devolver',2,20),(6,'Sin devolver',2,50),(7,'Sin devolver',2,95),(4,'Pendiente de devolver',3,50),(3,'Ya ha sido devuelto',3,100),(7,'Sin devolver',4,34),(3,'Sin devolver',4,38),(6,'Sin devolver',4,55),(5,'Sin devolver',5,33),(4,'Sin devolver',5,56),(6,'Sin devolver',5,60),(54,'Sin devolver',6,73),(55,'Sin devolver',6,74),(1,'Pendiente de devolver',6,75),(55,'Sin devolver',6,77),(2,'Ya ha sido devuelto',6,111),(6,'Sin devolver',7,5),(6,'Sin devolver',7,6),(8,'Sin devolver',7,36),(6,'Sin devolver',7,43),(3,'Sin devolver',7,44),(1,'Sin devolver',7,60),(3,'Sin devolver',8,48),(3,'Sin devolver',8,91),(10,'Sin devolver',8,123),(8,'Pendiente de devolver',9,11),(1,'Ya ha sido devuelto',9,18),(3,'Sin devolver',9,49),(33,'Sin devolver',9,50),(36,'Sin devolver',10,50),(9,'Sin devolver',10,59),(3,'Sin devolver',10,72),(2,'Sin devolver',11,81),(1,'Sin devolver',11,104),(10,'Pendiente de devolver',12,4),(5,'Ya ha sido devuelto',12,22),(2,'Sin devolver',13,53),(4,'Sin devolver',13,88),(1,'Sin devolver',14,76),(2,'Sin devolver',14,97),(2,'Pendiente de devolver',15,2),(3,'Ya ha sido devuelto',15,124),(2,'Ya ha sido devuelto',16,5),(2,'Sin devolver',17,103),(3,'Ya ha sido devuelto',18,7),(9,'Ya ha sido devuelto',19,102);
/*!40000 ALTER TABLE `Productos de la Compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
INSERT INTO `SaldoSeccion` VALUES ('2021-06-10',35050,0),('2021-05-09',2803,1),('2011-02-06',2170,2),('2016-02-22',2450,3),('2021-06-10',444,4);
/*!40000 ALTER TABLE `SaldoSeccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
INSERT INTO `SaldoTiendaVirtual` VALUES (0,NULL,0),(12000,'2003-05-03',0),(1600,'2003-05-03',1),(1200,'2016-02-22',2),(1400,'2016-02-22',3),(240,'2019-03-16',4),(15000,'2003-05-03',0),(2000,'2003-05-03',1),(1500,'2016-02-22',2),(1750,'2016-02-22',3),(300,'2019-03-16',4),(18000,'2003-05-03',0),(2400,'2003-05-03',1),(1800,'2016-02-22',2),(2100,'2016-02-22',3),(360,'2019-03-16',4),(21000,'2003-05-03',0),(2800,'2003-05-03',1),(2100,'2016-02-22',2),(2450,'2016-02-22',3),(420,'2019-03-16',4),(2133,'2009-07-04',2),(2169,'2008-01-15',2),(2170,'2011-02-06',2),(27988,'2019-10-15',0),(34976,'2008-01-15',0),(34977,'2021-05-08',0),(34978,'2021-05-08',0),(34979,'2021-05-08',0),(34980,'2021-05-08',0),(34983,'2021-05-08',0),(34985,'2021-05-08',0),(34987,'2021-05-08',0),(430,'2021-05-08',4),(34990,'2021-05-08',0),(34993,'2021-05-08',0),(433,'2021-05-08',4),(35003,'2021-05-08',0),(35010,'2021-05-09',0),(35016,'2021-05-09',0),(35021,'2021-05-09',0),(35030,'2021-05-09',0),(35034,'2021-05-09',0),(35036,'2021-05-09',0),(35039,'2021-05-09',0),(35045,'2021-05-09',0),(2803,'2021-05-09',1),(35047,'2021-06-10',0),(435,'2021-06-10',4),(35050,'2021-06-10',0),(444,'2021-06-10',4);
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
-- Dumping events for database 'BBDD-DB'
--

--
-- Dumping routines for database 'BBDD-DB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-11 13:54:55
