-- MySQL dump 10.13  Distrib 5.7.32, for osx10.12 (x86_64)
--
-- Host: localhost    Database: ppe2_iris
-- ------------------------------------------------------
-- Server version	5.7.32

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
-- Temporary table structure for view `achat`
--

DROP TABLE IF EXISTS `achat`;
/*!50001 DROP VIEW IF EXISTS `achat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `achat` AS SELECT 
 1 AS `idClient`,
 1 AS `prenomClient`,
 1 AS `nomClient`,
 1 AS `idLivre`,
 1 AS `titreLivre`,
 1 AS `quantite`,
 1 AS `prixAchat`,
 1 AS `dateAchat`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `achete`
--

DROP TABLE IF EXISTS `achete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achete` (
  `idachete` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) DEFAULT NULL,
  `idLivre` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `prixAchat` int(11) DEFAULT NULL,
  `dateAchat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idachete`),
  KEY `idClient` (`idClient`),
  KEY `idLivre` (`idLivre`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achete`
--

LOCK TABLES `achete` WRITE;
/*!40000 ALTER TABLE `achete` DISABLE KEYS */;
INSERT INTO `achete` VALUES (1,1,3,1,5,'2022-02-09 11:20:47'),(2,1,2,1,5,'2022-02-09 11:40:42'),(3,1,2,1,5,'2022-02-09 11:45:31'),(4,1,2,1,5,'2022-02-13 19:42:29'),(5,1,3,3,15,'2022-02-16 15:57:33'),(6,1,2,1,5,'2022-02-16 15:57:33');
/*!40000 ALTER TABLE `achete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajoute__panier_`
--

DROP TABLE IF EXISTS `ajoute__panier_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajoute__panier_` (
  `idClient` int(11) NOT NULL,
  `idLivre` int(11) NOT NULL,
  KEY `idLivre` (`idLivre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajoute__panier_`
--

LOCK TABLES `ajoute__panier_` WRITE;
/*!40000 ALTER TABLE `ajoute__panier_` DISABLE KEYS */;
INSERT INTO `ajoute__panier_` VALUES (1,2),(1,2);
/*!40000 ALTER TABLE `ajoute__panier_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auteur` (
  `idAuteur` int(11) NOT NULL AUTO_INCREMENT,
  `nomAuteur` varchar(50) DEFAULT NULL,
  `prenomAuteur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idAuteur`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auteur`
--

LOCK TABLES `auteur` WRITE;
/*!40000 ALTER TABLE `auteur` DISABLE KEYS */;
INSERT INTO `auteur` VALUES (1,'Musso','Guillaume'),(2,'Bussi','Michel'),(3,'Valognes','Aurélie'),(4,'Rowling','J.K.'),(5,'Perrin','Valérie');
/*!40000 ALTER TABLE `auteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(50) DEFAULT NULL,
  `prenomClient` varchar(50) DEFAULT NULL,
  `adresseMailClient` varchar(50) DEFAULT NULL,
  `mdpClient` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'fof','fanta','f@gmail.com','123'),(10,'jhjj','nkj','jkj','jkkj'),(11,'ben','ahmerd','b@fmail.com','124');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `idClient` int(11) NOT NULL,
  `idcommande` int(11) NOT NULL,
  `datecommande` date DEFAULT NULL,
  `datelivraison` date DEFAULT NULL,
  `prixHt` decimal(13,2) DEFAULT NULL,
  `prixTTC` decimal(13,2) DEFAULT NULL,
  `etatcommande` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcommande`),
  KEY `idClient` (`idClient`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `idGenre` int(11) NOT NULL AUTO_INCREMENT,
  `nomGenre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Fantastique'),(3,'Policier'),(4,'Biographie'),(5,'Romantique'),(6,'Comédie');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livre`
--

DROP TABLE IF EXISTS `livre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livre` (
  `idLivre` int(11) NOT NULL AUTO_INCREMENT,
  `titreLivre` varchar(50) DEFAULT NULL,
  `descLivre` varchar(400) DEFAULT NULL,
  `coverLivre` varchar(50) DEFAULT NULL,
  `prixLivre` int(11) DEFAULT NULL,
  `idAuteur` int(11) NOT NULL,
  `idGenre` int(11) NOT NULL,
  `quantiteLivre` int(2) DEFAULT '20',
  `ruptureStock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idLivre`),
  KEY `idAuteur` (`idAuteur`),
  KEY `idGenre` (`idGenre`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livre`
--

LOCK TABLES `livre` WRITE;
/*!40000 ALTER TABLE `livre` DISABLE KEYS */;
INSERT INTO `livre` VALUES (1,'Chavirer','Entre corps érotisé et corps souffrant, magie de la scène et coulisses des douleurs, Chavirer raconte l?histoire de Cléo, jeune collégienne rêvant de devenir danseuse, tour à tour sexuellement piégée par une pseudo Fondation de la vocation, puis complice de ses stratégies de recrutement.','cover1.jpg',5,3,2,20,0),(2,'Le Consentement','Au milieu des années 80, élevée par une mère divorcée, V. comble par la lecture le vide laissé par un père aux abonnés absents. À treize ans, dans un dîner, elle rencontre G., un écrivain dont elle ignore la réputation sulfureuse. Dès le premier regard, elle est happée par le charisme de cet homme...','cover2.jpg',5,2,5,40,0),(3,'L\'anomalie','L\'espérance de vie de l\'amour, c\'est huit ans. Pour la haine, comptez plutôt vingt. La seule chose qui dure toujours, c\'est l\'enfance, quand elle s\'est mal passée.','cover3.jpg',5,1,4,21,0),(4,'Il est des hommes qui se perdront toujours','Il est une chose admirable qui surpasse toujours la connaissance, l\'intelligence, et même le génie, c\'est l\'incompréhension. En juin 2021, un événement insensé bouleverse les vies de centaines d\'hommes et de femmes, tous passagers d\'un vol Paris-New York.','cover4.jpg',5,4,1,20,0),(5,'Betty','La Petite Indienne, c?est Betty Carpenter, née dans une baignoire, sixième de huit enfants. Sa famille vit en marge de la société car, si sa mère est blanche, son père est cherokee. Lorsque les Carpenter s?installent dans la petite ville de Breathed, après des années d?errance, le paysage luxuriant de l?Ohio semble leur apporter la paix','cover5.jpg',5,5,3,20,0),(6,'Le Pays des autres','En 1944, Mathilde, une jeune Alsacienne, s?éprend d?Amine Belhaj, un Marocain combattant dans l?armée française. Après la Libération, le couple s?installe au Maroc à Meknès, ville de garnison et de colons.','cover6.jpg',5,2,1,20,0),(7,'Fille','Laurence Barraqué grandit avec sa soeur dans les années 1960 à Rouen. Vous avez des enfants ? demande-t-on à son père. - Non, j\'ai deux filles, répond-il. Naître garçon aurait sans doute facilité les choses. Un garçon, c\'est toujours mieux qu\'une garce.','cover7.jpg',5,3,3,20,0);
/*!40000 ALTER TABLE `livre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `livre_v`
--

DROP TABLE IF EXISTS `livre_v`;
/*!50001 DROP VIEW IF EXISTS `livre_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `livre_v` AS SELECT 
 1 AS `idLivre`,
 1 AS `titreLivre`,
 1 AS `descLivre`,
 1 AS `coverLivre`,
 1 AS `nomGenre`,
 1 AS `prenomAuteur`,
 1 AS `nomAuteur`,
 1 AS `prixLivre`,
 1 AS `quantiteLivre`,
 1 AS `ruptureStock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `panier`
--

DROP TABLE IF EXISTS `panier`;
/*!50001 DROP VIEW IF EXISTS `panier`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `panier` AS SELECT 
 1 AS `idClient`,
 1 AS `nomClient`,
 1 AS `prenomClient`,
 1 AS `idLivre`,
 1 AS `titreLivre`,
 1 AS `coverLivre`,
 1 AS `quantite`,
 1 AS `prixTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `iduser` int(3) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Fanta','Maya','a@gmail.com','123','admin'),(2,'Nico','Leo','b@gmail.com','456','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `achat`
--

/*!50001 DROP VIEW IF EXISTS `achat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `achat` AS select `achete`.`idClient` AS `idClient`,`client`.`prenomClient` AS `prenomClient`,`client`.`nomClient` AS `nomClient`,`achete`.`idLivre` AS `idLivre`,`livre`.`titreLivre` AS `titreLivre`,`achete`.`quantite` AS `quantite`,`achete`.`prixAchat` AS `prixAchat`,`achete`.`dateAchat` AS `dateAchat` from ((`achete` join `client` on((`achete`.`idClient` = `client`.`idClient`))) join `livre` on((`achete`.`idLivre` = `livre`.`idLivre`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `livre_v`
--

/*!50001 DROP VIEW IF EXISTS `livre_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `livre_v` AS select `livre`.`idLivre` AS `idLivre`,`livre`.`titreLivre` AS `titreLivre`,`livre`.`descLivre` AS `descLivre`,`livre`.`coverLivre` AS `coverLivre`,`genre`.`nomGenre` AS `nomGenre`,`auteur`.`prenomAuteur` AS `prenomAuteur`,`auteur`.`nomAuteur` AS `nomAuteur`,`livre`.`prixLivre` AS `prixLivre`,`livre`.`quantiteLivre` AS `quantiteLivre`,`livre`.`ruptureStock` AS `ruptureStock` from ((`livre` join `genre` on((`livre`.`idGenre` = `genre`.`idGenre`))) join `auteur` on((`livre`.`idAuteur` = `auteur`.`idAuteur`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `panier`
--

/*!50001 DROP VIEW IF EXISTS `panier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `panier` AS select `ap`.`idClient` AS `idClient`,`c`.`nomClient` AS `nomClient`,`c`.`prenomClient` AS `prenomClient`,`ap`.`idLivre` AS `idLivre`,`l`.`titreLivre` AS `titreLivre`,`l`.`coverLivre` AS `coverLivre`,count(`ap`.`idClient`) AS `quantite`,sum(`l`.`prixLivre`) AS `prixTotal` from ((`ajoute__panier_` `ap` join `client` `c` on((`ap`.`idClient` = `c`.`idClient`))) join `livre` `l` on((`ap`.`idLivre` = `l`.`idLivre`))) group by `ap`.`idLivre` */;
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

-- Dump completed on 2022-02-21 21:19:09
