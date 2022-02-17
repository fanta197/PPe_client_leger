-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.31

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

CREATE DATABASE library;

--
-- Table structure for table `achat`
--

DROP TABLE IF EXISTS `achat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achat` (
  `id_achat` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL,
  `date_achat` datetime NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_achat`),
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `id_livre` (`id_livre`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achat`
--

LOCK TABLES `achat` WRITE;
/*!40000 ALTER TABLE `achat` DISABLE KEYS */;
INSERT INTO `achat` VALUES (1,1,1,'2020-12-13 22:52:19',24),(2,2,1,'2020-12-14 06:54:54',24),(3,2,3,'2020-12-14 06:55:15',24);
/*!40000 ALTER TABLE `achat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `info_achat`
--

DROP TABLE IF EXISTS `info_achat`;
/*!50001 DROP VIEW IF EXISTS `info_achat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `info_achat` AS SELECT 
 1 AS `id_achat`,
 1 AS `id_utilisateur`,
 1 AS `id_livre`,
 1 AS `nom`,
 1 AS `prenom`,
 1 AS `titre`,
 1 AS `prix`,
 1 AS `date_achat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `info_panier`
--

DROP TABLE IF EXISTS `info_panier`;
/*!50001 DROP VIEW IF EXISTS `info_panier`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `info_panier` AS SELECT 
 1 AS `id_panier`,
 1 AS `id_utilisateur`,
 1 AS `id_livre`,
 1 AS `nom`,
 1 AS `prenom`,
 1 AS `titre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `livres`
--

DROP TABLE IF EXISTS `livres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livres` (
  `id_livre` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `note` double DEFAULT NULL,
  PRIMARY KEY (`id_livre`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livres`
--

LOCK TABLES `livres` WRITE;
/*!40000 ALTER TABLE `livres` DISABLE KEYS */;
INSERT INTO `livres` VALUES (1,'L\'anomalie','https://image.noelshack.com/fichiers/2020/51/2/1608016946-l-anomalie.jpg',15,3.8),(2,'Une terre promise','https://image.noelshack.com/fichiers/2020/51/2/1608016970-une-terre-promise.jpg',23,4.5),(3,'13 à table','https://image.noelshack.com/fichiers/2020/51/2/1608016982-13-a-table-2021.jpg',25,4.3),(4,'Histoire du fils ','https://image.noelshack.com/fichiers/2020/51/2/1608016999-histoire-du-fils.jpg',17,3.7),(5,'Le Crépuscule et l\'Aube','https://image.noelshack.com/fichiers/2020/51/2/1608017013-le-crepuscule-et-l-aube.jpg',19,4.6),(6,'Cap Canaille','https://image.noelshack.com/fichiers/2020/51/2/1608017048-cap-canaille.jpg',25,4.1),(7,'L\'illusion','https://image.noelshack.com/fichiers/2020/51/2/1608017565-l-illusion.jpg',23,2.9);
/*!40000 ALTER TABLE `livres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panier`
--

DROP TABLE IF EXISTS `panier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panier` (
  `id_panier` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL,
  PRIMARY KEY (`id_panier`),
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `id_livre` (`id_livre`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panier`
--

LOCK TABLES `panier` WRITE;
/*!40000 ALTER TABLE `panier` DISABLE KEYS */;
INSERT INTO `panier` VALUES (1,1,1),(2,1,2),(3,2,3),(4,3,4),(5,3,5),(6,12,6);
/*!40000 ALTER TABLE `panier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `statpanieruser`
--

DROP TABLE IF EXISTS `statpanieruser`;
/*!50001 DROP VIEW IF EXISTS `statpanieruser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `statpanieruser` AS SELECT 
 1 AS `numuser`,
 1 AS `nomuser`,
 1 AS `numpanier`,
 1 AS `nbarticle`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateurs` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mot_de_passe` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'Xhaka','Granit','34','granit@xhaka'),(2,'Bellerin','Hector','2','hector@bellerin'),(3,'Ceballos','Dani','8','dani@ceballos'),(12,'Werner','Timo','11','timo@werner');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `info_achat`
--

/*!50001 DROP VIEW IF EXISTS `info_achat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_achat` AS select `achat`.`id_achat` AS `id_achat`,`utilisateurs`.`id_utilisateur` AS `id_utilisateur`,`livres`.`id_livre` AS `id_livre`,`utilisateurs`.`nom` AS `nom`,`utilisateurs`.`prenom` AS `prenom`,`livres`.`titre` AS `titre`,`achat`.`prix` AS `prix`,`achat`.`date_achat` AS `date_achat` from ((`achat` join `utilisateurs` on((`achat`.`id_utilisateur` = `utilisateurs`.`id_utilisateur`))) join `livres` on((`achat`.`id_livre` = `livres`.`id_livre`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_panier`
--

/*!50001 DROP VIEW IF EXISTS `info_panier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_panier` AS select `panier`.`id_panier` AS `id_panier`,`utilisateurs`.`id_utilisateur` AS `id_utilisateur`,`livres`.`id_livre` AS `id_livre`,`utilisateurs`.`nom` AS `nom`,`utilisateurs`.`prenom` AS `prenom`,`livres`.`titre` AS `titre` from ((`panier` join `utilisateurs` on((`panier`.`id_utilisateur` = `utilisateurs`.`id_utilisateur`))) join `livres` on((`panier`.`id_livre` = `livres`.`id_livre`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statpanieruser`
--

/*!50001 DROP VIEW IF EXISTS `statpanieruser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `statpanieruser` AS select `u`.`id_utilisateur` AS `numuser`,`u`.`nom` AS `nomuser`,`p`.`id_panier` AS `numpanier`,count(`l`.`id_livre`) AS `nbarticle` from ((`utilisateurs` `u` join `panier` `p`) join `livres` `l`) where ((`u`.`id_utilisateur` = `p`.`id_utilisateur`) and (`l`.`id_livre` = `p`.`id_livre`)) group by `u`.`id_utilisateur`,`p`.`id_panier` */;
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

-- Dump completed on 2020-12-15 10:57:07
