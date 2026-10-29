
CREATE DATABASE GestionAnimaux;
USE GestionAnimaux;

-- 1. Table User
CREATE TABLE `User` (
    email VARCHAR(255) PRIMARY KEY,
    motDePasse VARCHAR(255) NOT NULL,
    pseudo VARCHAR(100) NOT NULL
);

-- 2. Table Animo
CREATE TABLE Animo (
    idAnimo INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    forme VARCHAR(100) NOT NULL,
    emailUser VARCHAR(255) NOT NULL,

    FOREIGN KEY (emailUser)
        REFERENCES `User`(email)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 3. Table Element
CREATE TABLE Element (
    idElement INT AUTO_INCREMENT PRIMARY KEY,
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

    FOREIGN KEY (idAnimo)
        REFERENCES Animo(idAnimo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 4. Table de liaison pour les faiblesses des éléments
CREATE TABLE FaiblesseElement (
    idElement INT NOT NULL,
    idElementFaible INT NOT NULL,

    PRIMARY KEY (idElement, idElementFaible),

    FOREIGN KEY (idElement)
        REFERENCES Element(idElement)
        ON DELETE CASCADE,

    FOREIGN KEY (idElementFaible)
        REFERENCES Element(idElement)
        ON DELETE CASCADE,

    CHECK (idElement <> idElementFaible)
);
