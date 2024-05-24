-- Création de la table EMPLOYE
CREATE TABLE EMPLOYE (
    code_employe SERIAL PRIMARY KEY,
    nom_employe VARCHAR(50),
    prenom_employe VARCHAR(50),
    age INT,
    date_arrivee DATE,
    date_depart DATE
);

-- Création de la table FOURNISSEUR
CREATE TABLE FOURNISSEUR (
    code_fournisseur SERIAL PRIMARY KEY,
    nom_fournisseur VARCHAR(50)
);

-- Création de la table USINE
CREATE TABLE USINE (
    code_usine SERIAL PRIMARY KEY,
    nom_usine VARCHAR(50),
    adresse_usine VARCHAR(100)
);

-- Création de la table LIVRAISON
CREATE TABLE LIVRAISON (
    code_livraison SERIAL PRIMARY KEY,
    date_livraison DATE,
    quantite INT,
    code_usine INT REFERENCES USINE(code_usine),
    code_employe INT REFERENCES EMPLOYE(code_employe),
    code_fournisseur INT REFERENCES FOURNISSEUR(code_fournisseur)
);

-- Création de la table ROBOT
CREATE TABLE ROBOT (
    code_robot SERIAL PRIMARY KEY,
    nom_robot VARCHAR(50),
    quantite_produite INT,
    date_production DATE,
    code_usine INT REFERENCES USINE(code_usine)
);

-- Table de relation TRAVAILLE_DANS
CREATE TABLE TRAVAILLE_DANS (
    code_employe INT REFERENCES EMPLOYE(code_employe),
    code_usine INT REFERENCES USINE(code_usine),
    PRIMARY KEY (code_employe, code_usine)
);

-- Table de relation LIVRE_A
CREATE TABLE LIVRE_A (
    code_fournisseur INT REFERENCES FOURNISSEUR(code_fournisseur),
    code_usine INT REFERENCES USINE(code_usine),
    PRIMARY KEY (code_fournisseur, code_usine)
);

-- Table de relation RECUE_PAR
CREATE TABLE RECUE_PAR (
    code_employe INT REFERENCES EMPLOYE(code_employe),
    code_livraison INT REFERENCES LIVRAISON(code_livraison),
    PRIMARY KEY (code_employe, code_livraison)
);

-- Table de relation DELIVRE_A
CREATE TABLE DELIVRE_A (
    code_usine INT REFERENCES USINE(code_usine),
    code_livraison INT REFERENCES LIVRAISON(code_livraison),
    PRIMARY KEY (code_usine, code_livraison)
);

-- Table de relation PRODUIT
CREATE TABLE PRODUIT (
    code_robot INT REFERENCES ROBOT(code_robot),
    code_usine INT REFERENCES USINE(code_usine),
    PRIMARY KEY (code_robot, code_usine)
);