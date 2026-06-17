-- 1. Lister tous les arbres avec leur espèce et emplacement

SELECT 
    a.arbre_id,
    e.nom AS espece,
    em.nom AS emplacement
FROM arbres a
JOIN especes e 
    ON a.espece_id = e.espece_id
JOIN emplacements em 
    ON a.emplacement_id = em.emplacement_id
ORDER BY a.arbre_id;

-- 2. Compter le nombre d’arbres par emplacement

SELECT 
    em.nom AS emplacement,
    COUNT(a.arbre_id) AS nombre_arbres
FROM emplacements em
LEFT JOIN arbres a ON em.emplacement_id = a.emplacement_id
GROUP BY em.emplacement_id, em.nom
ORDER BY nombre_arbres DESC;

-- 3. Afficher toutes les activités de maintenance par arbre

SELECT 
    a.arbre_id,
    m.date_maintenance,
    m.type_maintenance,
    t.nom AS travailleur
FROM maintenances m
JOIN arbres a ON m.arbre_id = a.arbre_id
JOIN travailleurs t ON m.travailleur_id = t.travailleur_id
ORDER BY a.arbre_id, m.date_maintenance;

-- 4. Trouver les arbres d’une espèce donnée, exemple : 'Oak'

SELECT 
    a.arbre_id,
    e.nom AS espece,
    em.nom AS emplacement
FROM arbres a
JOIN especes e ON a.espece_id = e.espece_id
JOIN emplacements em ON a.emplacement_id = em.emplacement_id
WHERE e.nom = 'Oak'
ORDER BY a.arbre_id;

-- 5. Afficher les arbres dont la hauteur est comprise entre 1 m et 2,5 m

SELECT DISTINCT
    a.arbre_id,
    e.nom AS espece,
    em.nom AS emplacement,
    mc.hauteur_cm
FROM mesures_croissance mc
JOIN arbres a ON mc.arbre_id = a.arbre_id
JOIN especes e ON a.espece_id = e.espece_id
JOIN emplacements em ON a.emplacement_id = em.emplacement_id
WHERE mc.hauteur_cm BETWEEN 100 AND 250
ORDER BY a.arbre_id;

-- 6. Calculer la croissance moyenne par espèce

SELECT 
    e.nom AS espece,
    ROUND(AVG(mc.hauteur_cm), 2) AS hauteur_moyenne_cm
FROM mesures_croissance mc
JOIN arbres a ON mc.arbre_id = a.arbre_id
JOIN especes e ON a.espece_id = e.espece_id
GROUP BY e.espece_id, e.nom
ORDER BY hauteur_moyenne_cm DESC;

-- 7. Trouver les arbres non entretenus en 2025

SELECT 
    a.arbre_id,
    e.nom AS espece,
    em.nom AS emplacement
FROM arbres a
JOIN especes e ON a.espece_id = e.espece_id
JOIN emplacements em ON a.emplacement_id = em.emplacement_id
WHERE a.arbre_id NOT IN (
    SELECT DISTINCT arbre_id
    FROM maintenances
    WHERE EXTRACT(YEAR FROM date_maintenance) = 2025
)
ORDER BY a.arbre_id;

-- 8. Lister les emplacements contenant plus de 2 arbres

SELECT 
    em.nom AS emplacement,
    COUNT(a.arbre_id) AS nombre_arbres
FROM emplacements em
JOIN arbres a ON em.emplacement_id = a.emplacement_id
GROUP BY em.emplacement_id, em.nom
HAVING COUNT(a.arbre_id) > 2
ORDER BY nombre_arbres DESC;

-- 9. Afficher la dernière mesure de croissance par arbre

SELECT 
    a.arbre_id,
    e.nom AS espece,
    mc.date_mesure,
    mc.hauteur_cm
FROM mesures_croissance mc
JOIN arbres a ON mc.arbre_id = a.arbre_id
JOIN especes e ON a.espece_id = e.espece_id
WHERE mc.date_mesure = (
    SELECT MAX(mc2.date_mesure)
    FROM mesures_croissance mc2
    WHERE mc2.arbre_id = mc.arbre_id
)
ORDER BY a.arbre_id;

-- 10. Identifier les espèces avec la plus grande durée de vie moyenne

SELECT 
    e.nom AS espece,
    AVG(e.duree_vie) AS duree_vie_moyenne
FROM especes e
GROUP BY e.espece_id, e.nom
ORDER BY duree_vie_moyenne DESC
LIMIT 1;
