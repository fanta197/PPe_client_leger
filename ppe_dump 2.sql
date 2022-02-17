
DROP TABLE IF EXISTS `IRIS`;
CREATE TABLE IF EXISTS IRIS;
USE IRIS;



--
-- Table structure for table `achete`
--

DROP TABLE IF EXISTS `achete`;

CREATE TABLE `achete` (
  `idClient` int(11) DEFAULT NULL,
  `idLivre` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `prixAchat` int(11) DEFAULT NULL,
  `dateAchat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `idClient` (`idClient`),
  KEY `idLivre` (`idLivre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `achete` VALUES (7,2,1,5,'2021-01-12 09:59:34'),(7,1,2,10,'2021-01-12 09:59:34'),(7,2,1,5,'2021-01-12 10:04:59'),(7,1,2,10,'2021-01-12 10:08:50'),(1,2,1,5,'2021-01-12 10:22:28'),(2,7,1,5,'2021-01-23 16:57:59');

-- geere `achete`

DELIMITER ;;
CREATE trigger a_achete after insert
on achete
for each row 

begin

delete from ajoute__panier_ where idClient = new.idClient;

end ;;
DELIMITER ;




-- Table structure for table `ajoute__panier_`


DROP TABLE IF EXISTS `ajoute__panier_`;

CREATE TABLE `ajoute__panier_` (
  `idClient` int(11) NOT NULL,
  `idLivre` int(11) NOT NULL,
  KEY `idLivre` (`idLivre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



-- gere les stocks
DELIMITER ;;
CREATE trigger check_rupture_stock after insert
on ajoute__panier_
for each row 

begin

if (select quantiteLivre from livre where idLivre = new.idLivre) = 0 then
update livre set ruptureStock = true where idLivre = new.idLivre;
end if;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE trigger reduire_quantite after insert
on ajoute__panier_
for each row 

begin

update livre set quantiteLivre = quantiteLivre - 1 where idLivre = NEW.idLivre;
if (select quantiteLivre from livre where idLivre = new.idLivre) = 0 then
update livre set ruptureStock = true where idLivre = new.idLivre;
end if;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE trigger augmenter_quantite before delete
on ajoute__panier_
for each row 

begin

update livre set quantiteLivre = quantiteLivre + 1 where idLivre = OLD.idLivre;
if (select quantiteLivre from livre where idLivre = OLD.idLivre) > 0 then
update livre set ruptureStock = false where idLivre = OLD.idLivre;
end if;

end ;;
DELIMITER ;


-- Table structure for table `auteur`

DROP TABLE IF EXISTS `auteur`;

CREATE TABLE `auteur` (
  `idAuteur` int(11) NOT NULL AUTO_INCREMENT,
  `nomAuteur` varchar(50) DEFAULT NULL,
  `prenomAuteur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idAuteur`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `auteur` VALUES (1,'Musso','Guillaume'),(2,'Bussi','Michel'),(3,'Valognes','Aurélie'),(4,'Rowling','J.K.'),(5,'Perrin','Valérie');


DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(50) DEFAULT NULL,
  `prenomClient` varchar(50) DEFAULT NULL,
  `adresseMailClient` varchar(50) DEFAULT NULL,
  `mdpClient` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `client` VALUES (1,'fof','fanta','f@gmail.com','123'),(2,'Abraham','Tammy','tammy@abraham.com','123',0),(3,'Kovacic','Mateo','mateo@kovacic.com','123',0),(4,'Lampard','Frank','frank@lampard.com','123',0),(5,'Havertz','Kai','kai@havertz.com','123',0),(6,'Pulisic','Christian','christian@pulisic.com','123',0),(7,'diak','sam','sam@diak.com','123',0),(8,'admin','admin','admin@com','123',1);


DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
  `idGenre` int(11) NOT NULL AUTO_INCREMENT,
  `nomGenre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



LOCK TABLES `genre` WRITE;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Fantastique'),(3,'Policier'),(4,'Biographie'),(5,'Romantique'),(6,'Comédie');




DROP TABLE IF EXISTS `livre`;
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



INSERT INTO `livre` VALUES (1,'Chavirer','Entre corps érotisé et corps souffrant, magie de la scène et coulisses des douleurs, Chavirer raconte l?histoire de Cléo, jeune collégienne rêvant de devenir danseuse, tour à tour sexuellement piégée par une pseudo Fondation de la vocation, puis complice de ses stratégies de recrutement.','cover1.jpg',5,3,2,19,0),(2,'Le Consentement','Au milieu des années 80, élevée par une mère divorcée, V. comble par la lecture le vide laissé par un père aux abonnés absents. À treize ans, dans un dîner, elle rencontre G., un écrivain dont elle ignore la réputation sulfureuse. Dès le premier regard, elle est happée par le charisme de cet homme...','cover2.jpg',5,2,5,19,0),(3,'L\'anomalie','L\'espérance de vie de l\'amour, c\'est huit ans. Pour la haine, comptez plutôt vingt. La seule chose qui dure toujours, c\'est l\'enfance, quand elle s\'est mal passée.','cover3.jpg',5,1,4,20,0),(4,'Il est des hommes qui se perdront toujours','Il est une chose admirable qui surpasse toujours la connaissance, l\'intelligence, et même le génie, c\'est l\'incompréhension. En juin 2021, un événement insensé bouleverse les vies de centaines d\'hommes et de femmes, tous passagers d\'un vol Paris-New York.','cover4.jpg',5,4,1,20,0),(5,'Betty','La Petite Indienne, c?est Betty Carpenter, née dans une baignoire, sixième de huit enfants. Sa famille vit en marge de la société car, si sa mère est blanche, son père est cherokee. Lorsque les Carpenter s?installent dans la petite ville de Breathed, après des années d?errance, le paysage luxuriant de l?Ohio semble leur apporter la paix','cover5.jpg',5,5,3,20,0),(6,'Le Pays des autres','En 1944, Mathilde, une jeune Alsacienne, s?éprend d?Amine Belhaj, un Marocain combattant dans l?armée française. Après la Libération, le couple s?installe au Maroc à Meknès, ville de garnison et de colons.','cover6.jpg',5,2,1,20,0),(7,'Fille','Laurence Barraqué grandit avec sa soeur dans les années 1960 à Rouen. Vous avez des enfants ? demande-t-on à son père. - Non, j\'ai deux filles, répond-il. Naître garçon aurait sans doute facilité les choses. Un garçon, c\'est toujours mieux qu\'une garce.','cover7.jpg',5,3,3,19,0);



CREATE OR REPLACE VIEW `panier` AS 
select `panier_v`.`idClient` 
AS `idClient`,`panier_v`.`prenomClient` 
AS `prenomClient`,`panier_v`.`nomClient` 
AS `nomClient`,`panier_v`.`idLivre` 
AS `idLivre`,`panier_v`.`titreLivre` 
AS `titreLivre`,`panier_v`.`coverLivre` 
AS `coverLivre`,count(`panier_v`.`idClient`)
AS `quantite`,`panier_v`.`prixLivre`
AS `prixLivre`,sum(`panier_v`.`prixLivre`) 
AS `prixTotal` from 
`panier_v` group by `panier_v`.`idLivre` ;





 DROP VIEW IF EXISTS `achat`;
CREATE VIEW `achat` 
AS select `achete`.`idClient` 
AS `idClient`,`client`.`prenomClient` 
AS `prenomClient`,`client`.`nomClient` 
AS `nomClient`,`achete`.`idLivre` 
AS `idLivre`,`livre`.`titreLivre` 
AS `titreLivre`,`achete`.`quantite` 
AS `quantite`,`achete`.`prixAchat` 
AS `prixAchat`,`achete`.`dateAchat` 
AS `dateAchat` 
from ((`achete` join `client` on((`achete`.`idClient` = `client`.`idClient`))) 
join `livre` on((`achete`.`idLivre` = `livre`.`idLivre`))) ;



DROP  VIEW IF EXISTS livre_v;
CREATE VIEW `livre_v`
 AS select `livre`.`idLivre` 
 AS `idLivre`,`livre`.`titreLivre` 
 AS `titreLivre`,`livre`.`descLivre` 
 AS `descLivre`,`livre`.`coverLivre` 
 AS `coverLivre`,`genre`.`nomGenre` 
 AS `nomGenre`,`auteur`.`prenomAuteur` 
 AS `prenomAuteur`,`auteur`.`nomAuteur` 
 AS `nomAuteur`,`livre`.`prixLivre` 
 AS `prixLivre`,`livre`.`quantiteLivre` 
 AS `quantiteLivre`,`livre`.`ruptureStock` 
 AS `ruptureStock` 
 from ((`livre` join `genre` 
 
 on((`livre`.`idGenre` = `genre`.`idGenre`))) 
 join `auteur` on((`livre`.`idAuteur` = `auteur`.`idAuteur`)));

crypter le mot de pass:
 delimiter //
drop trigger if exists cryptmdp;
create trigger cryptmdp
before insert on client
for each row
begin
set new.mdpClient=password(new.mdpClient);
end//
delimiter ;





select ap.idClient, ap.idLivre, count(ap.idClient) AS "quantite" from ajoute__panier_ ap
inner join client c on ap.idClient = c.idClient
inner join livre l on ap.idLivre = l.idLivre;



select ap.idClient, ap.idLivre, count(ap.idClient) AS "quantite" from ajoute__panier_ ap
inner join client c on ap.idClient = c.idClient
inner join livre l on ap.idLivre = l.idLivre
group by ap.idLivre;

create or replace view panier as
select ap.idClient, c.nomClient, c.prenomClient, ap.idLivre, l.titreLivre, l.coverLivre, count(ap.idClient) AS "quantite", sum(l.prixLivre) AS "prixTotal" from ajoute__panier_ ap
inner join client c on ap.idClient = c.idClient
inner join livre l on ap.idLivre = l.idLivre
group by ap.idLivre;