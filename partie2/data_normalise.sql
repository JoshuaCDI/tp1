INSERT INTO especes (nom, climat, duree_vie)
VALUES
('Oak', 'Temperate', 120),
('Pine', 'Cold', 200),
('Maple', 'Temperate', 80),
('Birch', 'Cold', 60),
('Willow', 'Temperate', 90);

INSERT INTO emplacements (nom, adresse)
VALUES
('Central Park', 'Montreal North'),
('Riverside Park', 'Montreal East'),
('Downtown Garden', 'Montreal Center'),
('North Forest Zone', 'Montreal North-West'),
('Lakeside Area', 'Montreal South');

INSERT INTO travailleurs (travailleur_id, nom)
VALUES
(101, 'Alice'),
(102, 'Bob'),
(103, 'Charlie'),
(104, 'Diana'),
(105, 'Ethan'),
(106, 'Fiona');

INSERT INTO arbres (arbre_id, espece_id, emplacement_id)
VALUES
(1,  (SELECT espece_id FROM especes WHERE nom = 'Oak'),    (SELECT emplacement_id FROM emplacements WHERE nom = 'Central Park')),
(2,  (SELECT espece_id FROM especes WHERE nom = 'Oak'),    (SELECT emplacement_id FROM emplacements WHERE nom = 'Central Park')),
(3,  (SELECT espece_id FROM especes WHERE nom = 'Pine'),   (SELECT emplacement_id FROM emplacements WHERE nom = 'Riverside Park')),
(4,  (SELECT espece_id FROM especes WHERE nom = 'Maple'),  (SELECT emplacement_id FROM emplacements WHERE nom = 'Downtown Garden')),
(5,  (SELECT espece_id FROM especes WHERE nom = 'Pine'),   (SELECT emplacement_id FROM emplacements WHERE nom = 'Riverside Park')),
(6,  (SELECT espece_id FROM especes WHERE nom = 'Birch'),  (SELECT emplacement_id FROM emplacements WHERE nom = 'North Forest Zone')),
(7,  (SELECT espece_id FROM especes WHERE nom = 'Oak'),    (SELECT emplacement_id FROM emplacements WHERE nom = 'Central Park')),
(8,  (SELECT espece_id FROM especes WHERE nom = 'Pine'),   (SELECT emplacement_id FROM emplacements WHERE nom = 'Riverside Park')),
(9,  (SELECT espece_id FROM especes WHERE nom = 'Maple'),  (SELECT emplacement_id FROM emplacements WHERE nom = 'Downtown Garden')),
(10, (SELECT espece_id FROM especes WHERE nom = 'Willow'), (SELECT emplacement_id FROM emplacements WHERE nom = 'Lakeside Area'));

INSERT INTO maintenances (arbre_id, travailleur_id, date_maintenance, type_maintenance)
VALUES
(1, 101, '2025-01-10', 'arrosage'),
(1, 102, '2025-02-12', 'taille'),
(2, 102, '2025-01-15', 'inspection'),
(3, 101, '2025-02-01', 'arrosage'),
(3, 101, '2025-03-01', 'inspection'),
(4, 103, '2025-02-10', 'taille'),
(5, 102, '2025-03-05', 'arrosage'),
(5, 102, '2025-04-05', 'inspection'),
(6, 104, '2025-01-20', 'inspection'),
(6, 101, '2025-03-15', 'arrosage'),
(7, 102, '2025-04-10', 'taille'),
(7, 103, '2025-05-01', 'inspection'),
(8, 105, '2025-02-18', 'arrosage'),
(8, 102, '2025-03-22', 'inspection'),
(9, 103, '2025-03-12', 'arrosage'),
(9, 104, '2025-04-20', 'taille'),
(10, 106, '2025-01-05', 'inspection'),
(10, 105, '2025-02-25', 'arrosage'),
(10, 102, '2025-04-15', 'taille');

INSERT INTO mesures_croissance (arbre_id, date_mesure, hauteur_cm)
VALUES
(1, '2025-01-01', 10),
(1, '2025-03-01', 15),
(2, '2025-01-01', 8),
(2, '2025-03-01', 12),
(3, '2025-02-01', 20),
(3, '2025-04-01', 25),
(4, '2025-02-01', 5),
(4, '2025-04-01', 9),
(5, '2025-03-01', 18),
(5, '2025-05-01', 22),
(6, '2025-01-01', 12),
(6, '2025-03-01', 18),
(7, '2025-04-01', 16),
(7, '2025-05-01', 19),
(8, '2025-02-01', 22),
(8, '2025-04-01', 28),
(9, '2025-03-01', 7),
(9, '2025-05-01', 11),
(10, '2025-01-01', 9),
(10, '2025-03-01', 14),
(10, '2025-05-01', 20);