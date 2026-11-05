CREATE DATABASE IF NOT EXISTS GestionAniimo
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE GestionAniimo;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Aniimo_User;
DROP TABLE IF EXISTS FaiblesseElement;
DROP TABLE IF EXISTS Element;
DROP TABLE IF EXISTS Animo;
DROP TABLE IF EXISTS `User`;

SET FOREIGN_KEY_CHECKS = 1;

-- =====================================
-- TABLE : Animo
-- =====================================

CREATE TABLE Animo (
    idAnimo INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    forme VARCHAR(100) NOT NULL,
    PRIMARY KEY (idAnimo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================
-- TABLE : Element
-- =====================================

CREATE TABLE Element (
    idElement INT NOT NULL AUTO_INCREMENT,
    typeElement ENUM(
        'Feu',
        'Eau',
        'Plante',
        'Foudre',
        'Glace',
        'Terre',
        'Vent',
        'Lumière',
        'Obscurité'
    ) NOT NULL,
    idAnimo INT NOT NULL,
    PRIMARY KEY (idElement),
    KEY (idAnimo),
    CONSTRAINT fk_element_animo
        FOREIGN KEY (idAnimo)
        REFERENCES Animo(idAnimo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================
-- TABLE : User
-- =====================================

CREATE TABLE `User` (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    motDePasse VARCHAR(255) NOT NULL,
    pseudo VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================
-- TABLE : Aniimo_User
-- =====================================

CREATE TABLE Aniimo_User (
    idUser INT UNSIGNED NOT NULL,
    idAniimo INT NOT NULL,
    PRIMARY KEY (idUser, idAniimo),
    CONSTRAINT fk_aniimo_user_user
        FOREIGN KEY (idUser)
        REFERENCES `User`(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_aniimo_user_animo
        FOREIGN KEY (idAniimo)
        REFERENCES Animo(idAnimo)
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================
-- TABLE : FaiblesseElement
-- =====================================

CREATE TABLE FaiblesseElement (
    idElement INT NOT NULL,
    idElementFaible INT NOT NULL,
    PRIMARY KEY (idElement, idElementFaible),
    KEY (idElementFaible),
    CONSTRAINT fk_faiblesse_element
        FOREIGN KEY (idElement)
        REFERENCES Element(idElement)
        ON DELETE CASCADE,
    CONSTRAINT fk_faiblesse_element_faible
        FOREIGN KEY (idElementFaible)
        REFERENCES Element(idElement)
        ON DELETE CASCADE,
    CONSTRAINT chk_elements_differents
        CHECK (idElement <> idElementFaible)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================
-- DONNÉES : ANIMO
-- =====================================

INSERT INTO Animo (idAnimo, nom, forme) VALUES
(1,'Algobulle','Lumin'),
(2,'Algoglam','Nova'),
(3,'Astor','Gamma'),
(4,'Astrid','Lumin'),
(5,'Astrophel','Nova'),
(6,'Balabée','Lumin'),
(7,'Barnabé','Lumin'),
(8,'Bastiroc','Nova'),
(9,'Boulabée','Nova'),
(10,'Bourgeonnet','Lumin'),
(11,'Bulbi','Lumin'),
(12,'Bulloutre','Gamma'),
(13,'Cabaroc','Lumin'),
(14,'Casquillon','Nova'),
(15,'Casquimord','Gamma'),
(16,'Casquimou','Lumin'),
(17,'Casquipreux','Nova'),
(18,'Célestia','Lumin'),
(19,'Cheekie','Lumin'),
(20,'Clairbec','Nova'),
(21,'Coléobée','Nova'),
(22,'Coracroc','Lumin'),
(23,'Coraleurre','Nova'),
(24,'Crabiflore','Nova'),
(25,'Crabourgeon','Lumin'),
(26,'Cristocrabe','Nova'),
(27,'Cristorex','Nova'),
(28,'Cuicui','Lumin'),
(29,'Cuiragon','Nova'),
(30,'Cumulaine','Lumin'),
(31,'Danzard','Nova'),
(32,'Écurixe','Lumin'),
(33,'Écurouste','Nova'),
(34,'Eko','Lumin'),
(35,'Ekolombo','Nova'),
(36,'Elfe solidaire','Nova'),
(37,'Esprit d’aile de papillon','Nova'),
(38,'Fabulle','Nova'),
(39,'Falou','Lumin'),
(40,'Farfafeu','Lumin'),
(41,'Fennelune','Nova'),
(42,'Filoutus','Gamma'),
(43,'Flamirage','Nova'),
(44,'Flammi','Lumin'),
(45,'Fluoretti','Lumin'),
(46,'Fragrancier','Nova'),
(47,'Fredon','Lumin'),
(48,'Fulgucrin','Nova'),
(49,'Fulmi','Nova'),
(50,'Gachapoulpe','Nova'),
(51,'Géodosaure','Gamma'),
(52,'Givrotus','Nova'),
(53,'Glaivrier','Gamma'),
(54,'Grizzo','Nova'),
(55,'Hélion','Lumin'),
(56,'Hexxin','Nova'),
(57,'Hurlebrasier','Nova'),
(58,'Igniti','Nova'),
(59,'Infergon','Nova'),
(60,'Inferlupin','Nova'),
(61,'Irelia','Lumin'),
(62,'Iris','Lumin'),
(63,'Jappardent','Gamma'),
(64,'Lainirique','Nova'),
(65,'Lavasaure','Gamma'),
(66,'Loufeuteau','Lumin'),
(67,'Louloutre','Lumin'),
(68,'Luciole à feuilles','Lumin'),
(69,'Luminelle','Nova'),
(70,'Lumiris','Nova'),
(71,'Lunara','Lumin'),
(72,'Machou','Lumin'),
(73,'Magmarex','Nova'),
(74,'Malange','Lumin'),
(75,'Malevsera','Nova'),
(76,'Méliflore','Nova'),
(77,'Moineau Plume-de-Tonnerre','Gamma'),
(78,'Molosabre','Nova'),
(79,'Momand','Nova'),
(80,'Nutrion','Nova'),
(81,'Ondeloutre','Nova'),
(82,'Osky','Lumin'),
(83,'Ourso','Lumin'),
(84,'Petit gazouillis foudroyant','Lumin'),
(85,'Plumiel','Lumin'),
(86,'Pomawk','Nova'),
(87,'Pomœuf','Lumin'),
(88,'Poulet','Lumin'),
(89,'Poulplash','Lumin'),
(90,'Pulsato','Nova'),
(91,'Rapiéronce','Nova'),
(92,'Silexodon','Lumin'),
(93,'Soléon','Nova'),
(94,'Sorcelonde','Nova'),
(95,'Stellaria','Nova'),
(96,'Terriloutre','Nova'),
(97,'Tilotus','Lumin'),
(98,'Touffu','Lumin'),
(99,'Trombec','Nova'),
(100,'Tubabec','Nova'),
(101,'Turbulaine','Nova'),
(102,'Valsiris','Nova'),
(103,'Vitti','Nova'),
(104,'Voilotus','Nova'),
(105,'Voilueur','Gamma'),
(106,'Voletti','Nova'),
(107,'Voltige','Lumin'),
(108,'Voltignasse','Nova'),
(109,'Wavwal','Nova');

-- =====================================
-- DONNÉES : ELEMENT
-- =====================================

INSERT INTO Element (idElement, typeElement, idAnimo) VALUES
(1,'Eau',1),
(2,'Plante',1),
(3,'Eau',2),
(4,'Plante',2),
(5,'Eau',3),
(6,'Eau',4),
(7,'Eau',5),
(8,'Terre',6),
(9,'Plante',7),
(10,'Terre',8),
(11,'Terre',9),
(12,'Plante',10),
(13,'Foudre',11),
(14,'Eau',12),
(15,'Terre',13),
(16,'Obscurité',14),
(17,'Vent',15),
(18,'Obscurité',16),
(19,'Obscurité',17),
(20,'Obscurité',18),
(21,'Glace',19),
(22,'Vent',20),
(23,'Terre',21),
(24,'Eau',22),
(25,'Terre',22),
(26,'Eau',23),
(27,'Terre',23),
(28,'Plante',24),
(29,'Terre',24),
(30,'Plante',25),
(31,'Terre',25),
(32,'Glace',26),
(33,'Terre',27),
(34,'Vent',28),
(35,'Vent',29),
(36,'Vent',30),
(37,'Foudre',31),
(38,'Feu',32),
(39,'Feu',33),
(40,'Vent',34),
(41,'Vent',35),
(42,'Feu',36),
(43,'Plante',37),
(44,'Eau',38),
(45,'Eau',39),
(46,'Feu',40),
(47,'Lumière',41),
(48,'Eau',42),
(49,'Feu',43),
(50,'Obscurité',44),
(51,'Vent',45),
(52,'Obscurité',46),
(53,'Plante',47),
(54,'Foudre',48),
(55,'Foudre',49),
(56,'Eau',50),
(57,'Terre',51),
(58,'Eau',52),
(59,'Glace',52),
(60,'Glace',53),
(61,'Terre',54),
(62,'Lumière',55),
(63,'Obscurité',56),
(64,'Feu',57),
(65,'Obscurité',58),
(66,'Feu',59),
(67,'Feu',60),
(68,'Obscurité',60),
(69,'Plante',61),
(70,'Plante',62),
(71,'Feu',63),
(72,'Obscurité',64),
(73,'Feu',65),
(74,'Terre',65),
(75,'Feu',66),
(76,'Eau',67),
(77,'Plante',68),
(78,'Foudre',69),
(79,'Plante',70),
(80,'Lumière',71),
(81,'Vent',72),
(82,'Feu',73),
(83,'Terre',73),
(84,'Glace',74),
(85,'Glace',75),
(86,'Plante',76),
(87,'Foudre',77),
(88,'Glace',78),
(89,'Plante',79),
(90,'Plante',80),
(91,'Eau',81),
(92,'Glace',82),
(93,'Terre',83),
(94,'Foudre',84),
(95,'Obscurité',85),
(96,'Plante',86),
(97,'Plante',87),
(98,'Feu',88),
(99,'Eau',89),
(100,'Foudre',90),
(101,'Plante',91),
(102,'Terre',92),
(103,'Lumière',93),
(104,'Plante',94),
(105,'Obscurité',94),
(106,'Obscurité',95),
(107,'Eau',96),
(108,'Eau',97),
(109,'Foudre',98),
(110,'Vent',99),
(111,'Vent',100),
(112,'Vent',101),
(113,'Plante',102),
(114,'Plante',103),
(115,'Vent',103),
(116,'Eau',104),
(117,'Plante',104),
(118,'Foudre',105),
(119,'Vent',106),
(120,'Foudre',107),
(121,'Foudre',108),
(122,'Glace',109);

-- =====================================
-- DONNÉES : USER
-- =====================================

INSERT INTO `User` (id, email, motDePasse, pseudo) VALUES
(1, '', 'A_REMPLACER', 'CatalogueAniimo');

-- =====================================
-- Les tables Aniimo_User et
-- FaiblesseElement sont volontairement vides.
-- =====================================