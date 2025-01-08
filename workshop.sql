USE kaamelott;

-- Dans un fichier .sql, les tirets en début de ligne permettent de commenter du code 
-- afin qu'il ne soit pas exécuté
-- ⬇ écrire les requêtes de l'atelier ici ⬇

-- Le prénom, nom et âge des personnages
SELECT firstname,lastname, age FROM person;

-- Le prénom, nom des personnages ainsi que leur royaume, uniquement pour ceux étant reliés à un royaume
SELECT p.firstname,p.lastname, k.name FROM person p 
JOIN kingdom k ON p.kingdom_id = k.id;

-- La même chose en incluant tous les personnages
SELECT p.firstname,p.lastname, k.name FROM person p 
LEFT JOIN kingdom k ON p.kingdom_id = k.id;

-- La moyenne de l’âge des personnages
SELECT AVG(age) FROM person;

-- La moyenne de tous les personnages n’ayant pas le rôle de magicien
SELECT AVG(p.age) FROM person p 
JOIN role r ON p.role_id = r.id
WHERE r.role != 'magicien';

-- Le nombre de personnage par royaume (inclure les royaumes n’ayant pas de personnage)
SELECT COUNT(*) as nb, k.name FROM person p
RIGHT JOIN kingdom k ON p.kingdom_id = k.id
GROUP BY k.name;

-- La moyenne de l’âge par rôle
SELECT AVG(p.age) as nb, r.role FROM person p
JOIN role r ON p.role_id = r.id
GROUP BY r.role;

-- La liste de tous les personnages avec leur rôle et royaume éventuels
SELECT CONCAT(p.firstname, ' ', IFNULL(p.lastname,'')) as fullname, r.role, k.name FROM person p
LEFT JOIN kingdom k ON p.kingdom_id = k.id
LEFT JOIN role r ON p.role_id = r.id;

-- La liste des royaumes ayant au moins 2 sujets
-- Le nombre de personnage par royaume (inclure les royaumes n’ayant pas de personnage)
SELECT COUNT(*) as nb, k.name FROM person p
RIGHT JOIN kingdom k ON p.kingdom_id = k.id
GROUP BY k.name
HAVING nb >= 2;