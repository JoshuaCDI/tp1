CREATE TABLE especes (

    espece_id SERIAL PRIMARY KEY,

    nom VARCHAR(100) NOT NULL UNIQUE,

    climat VARCHAR(100) NOT NULL,

    duree_vie INT NOT NULL CHECK (duree_vie > 0)

);

CREATE TABLE emplacements (

    emplacement_id SERIAL PRIMARY KEY,

    nom VARCHAR(100) NOT NULL,

    adresse VARCHAR(255) NOT NULL,

    UNIQUE (nom, adresse)

);

CREATE TABLE travailleurs (

    travailleur_id INT PRIMARY KEY,

    nom VARCHAR(100) NOT NULL

);

CREATE TABLE arbres (

    arbre_id INT PRIMARY KEY,

    espece_id INT NOT NULL,

    emplacement_id INT NOT NULL,

    CONSTRAINT fk_arbre_espece

        FOREIGN KEY (espece_id)

        REFERENCES especes(espece_id),

    CONSTRAINT fk_arbre_emplacement

        FOREIGN KEY (emplacement_id)

        REFERENCES emplacements(emplacement_id)

);

CREATE TABLE maintenances (

    maintenance_id SERIAL PRIMARY KEY,

    arbre_id INT NOT NULL,

    travailleur_id INT NOT NULL,

    date_maintenance DATE NOT NULL,

    type_maintenance VARCHAR(50) NOT NULL CHECK (

        type_maintenance IN ('arrosage', 'taille', 'inspection')

    ),

    CONSTRAINT fk_maintenance_arbre

        FOREIGN KEY (arbre_id)

        REFERENCES arbres(arbre_id),

    CONSTRAINT fk_maintenance_travailleur

        FOREIGN KEY (travailleur_id)

        REFERENCES travailleurs(travailleur_id)

);

CREATE TABLE mesures_croissance (

    mesure_id SERIAL PRIMARY KEY,

    arbre_id INT NOT NULL,

    date_mesure DATE NOT NULL,

    hauteur_cm NUMERIC(6,2) NOT NULL CHECK (hauteur_cm >= 0),

    CONSTRAINT fk_mesure_arbre

        FOREIGN KEY (arbre_id)

        REFERENCES arbres(arbre_id)

);