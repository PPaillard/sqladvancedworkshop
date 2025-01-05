DROP DATABASE IF EXISTS kaamelott;
CREATE DATABASE kaamelott;
USE kaamelott;

CREATE TABLE `Kingdom`
(
    id   INT PRIMARY KEY,
    name VARCHAR(90) NOT NULL
);

INSERT INTO `Kingdom`
VALUES (1, 'Logre'),
       (2, 'Caledonie'),
       (3, 'Carmelide'),
       (4, 'Vannes'),
       (5, 'Galles'),
       (6, 'Aquitaine');

CREATE TABLE `Role`
(
    id   INT PRIMARY KEY,
    role VARCHAR(80) NOT NULL
);

INSERT INTO `Role`
VALUES (1, 'roi'),
       (2, 'chevalier'),
       (3, 'magicien');

CREATE TABLE `Person`
(
    id         INT PRIMARY KEY,
    firstname  VARCHAR(80) NOT NULL,
    lastname   VARCHAR(80) DEFAULT NULL,
    age        INT         NOT NULL,
    role_id    INT         DEFAULT NULL,
    kingdom_id INT         DEFAULT NULL,
    FOREIGN KEY (kingdom_id) REFERENCES Kingdom (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (role_id) REFERENCES Role (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO `Person`
VALUES (1, 'Arthur', 'Pendragon', 35, 1, 1),
       (2, 'Guenièvre', NULL, 30, NULL, 3),
       (3, 'Merlin', NULL, 850, 3, NULL),
       (4, 'Perceval', NULL, 36, 2, 5),
       (5, 'Caradoc', NULL, 32, 2, 4),
       (6, 'Calogrenant', NULL, 44, 1, 2),
       (7, 'Leodagan', NULL, 47, 1, 3),
       (8, 'Lancelot', 'Du Lac', 33, 2, NULL),
       (9, 'Elias', 'De Kelliwic''h', 52, 3, NULL),
       (10, 'Mevanwi', '', 28, NULL, 4),
       (11, 'Yvain', '', 23, 2, 3);