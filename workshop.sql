USE kaamelott;

-- Dans un fichier .sql, les tirets en debut de ligne permettent de commenter du code 
-- afin qu'il ne soit pas execute
-- ⬇ ecrire les requêtes de l'atelier ici ⬇
-- Le prenom, nom et age des personnages
SELECT firstname, lastname, age FROM person;

-- Le prenom, nom des personnages ainsi que leur royaume, uniquement pour ceux etant relies à un royaume
SELECT firstname, lastname, name AS kingdom_Name FROM person 
JOIN kingdom ON person.kingdom_id = kingdom.id;

-- Le prenom, nom des personnages ainsi que leur royaume, qu'ils aient un royaume ou non.
SELECT firstname, lastname, name AS kingdom_name FROM person 
LEFT JOIN kingdom ON kingdom.id = person.kingdom_id;

-- La moyenne de l’age des personnages
SELECT AVG(age) AS avg_age FROM PERSON;

-- La moyenne d'age de tous les personnages n’ayant pas le rôle de magicien
SELECT AVG(age) AS avg_age FROM person
LEFT JOIN role ON role.id = person.role_id
WHERE person.role_id IS NULL OR role.role != "magicien";

-- Le nombre de personnage par royaume (inclure les royaumes n’ayant pas de personnage)
SELECT name, COUNT(person.id) as nb_person_Kingdom FROM kingdom
LEFT JOIN person ON kingdom.id = person.kingdom_id
GROUP BY kingdom.name;

-- La moyenne de l’age par rôle
SELECT role, AVG(age) as avg_age FROM person
LEFT JOIN role ON role.id = person.role_id
GROUP BY role;


-- La liste de tous les personnages avec leur rôle et royaume eventuels
SELECT firstname, lastname, name AS royaume, role FROM person as p
LEFT JOIN kingdom AS k ON k.id = p.kingdom_id
LEFT JOIN role AS r ON r.id = p.role_id;

-- La liste des royaumes ayant au moins 2 sujets
SELECT name, COUNT(person.id) as nb_person_Kingdom FROM kingdom
JOIN person ON kingdom.id = person.kingdom_id
GROUP BY kingdom.name
HAVING nb_person_Kingdom >= 2;