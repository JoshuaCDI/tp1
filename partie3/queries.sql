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