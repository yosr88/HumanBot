# HUMAN BOT

## Description

Ce projet a pour objectif de moderniser la gestion d'une entreprise spécialisée dans la création de robots humanoïdes, en remplaçant la gestion papier par une gestion entièrement numérique. Le système comprend une base de données, des procédures et fonctions, ainsi que plusieurs interfaces web pour différents aspects de la gestion des usines.

## Fonctionnalités

- **Gestion des Ressources Humaines**
  - Affichage des salariés de toutes les usines.
- **Gestion du Stock**
  - Affichage des pièces restantes de chaque usine.
- **Gestion des Fournisseurs**
  - Affichage des livraisons des 10 derniers jours.
  - API pour afficher le nombre de pièces restantes par usine.

## Prérequis

- PostgreSQL
- Python 3.x
- Flask
- SQLAlchemy



## Structure du Projet

projet/
├── ws_rh/
│   ├── app.py
│   ├── config.py
│   ├── requirements.txt
│   └── templates/
│       └── all_workers.html
├── ws_stock/
│   ├── app.py
│   ├── config.py
│   ├── requirements.txt
│   └── templates/
│       └── stock.html
├── ws_fournisseur/
│   ├── app.py
│   ├── config.py
│   ├── requirements.txt
│   └── templates/
│       └── recent_deliveries.html
├── api_fournisseur/
│   ├── app.py
│   ├── config.py
│   ├── requirements.txt
├── hb_schema.sql
├── hb_views.sql
├── hb_funcs_procs.sql
├── hb_triggers.sql
├── hb_overview.png
├── hb_dico.md
├── hb_mcd.png
└── hb_mld.md



### Fichiers / Explications et Répartition des Tâches


#### Iheb : 

### `hb_schema.sql` : Fichier SQL contenant uniquement la création des tables
Ce fichier SQL contient les instructions pour créer les tables de la base de données.


### `ws_rh`:

- **Structure du Dossier :**
  Le dossier `ws_rh` contient les fichiers nécessaires pour implémenter le service RH, incluant un fichier de configuration, un fichier principal pour l'application Flask, un fichier de dépendances, et des templates HTML pour afficher les données des employés.

- **Explication :**
  - `requirements.txt` liste les dépendances nécessaires pour le projet.
  - `config.py` contient les configurations de la base de données.
  - `app.py` est le fichier principal de l'application Flask, configurant les routes pour afficher les employés.
  - `templates/all_workers.html` est le template HTML pour afficher la liste des employés.



#### Linda :

### `hb_mld.md` : MLD au format markdown
Le fichier `hb_mld.md` contient le Modèle Logique de Données (MLD), détaillant la structure des tables et les relations entre elles dans un format textuel.

### `hb_dico.md` : Dictionnaire de données au format markdown
Le fichier `hb_dico.md` contient la description détaillée des tables de la base de données, incluant les attributs, types de données, et contraintes de chaque table.

### `hb_overview.png` : Schéma logique du futur SI
Ce fichier contient le schéma logique du futur système d'information, représentant les relations et les flux de données entre les différentes entités et services de l'entreprise.

### `ws_fournisseur` :

- **Structure du Dossier :**
  Le dossier `ws_fournisseur` contient les fichiers nécessaires pour implémenter le service Fournisseur, incluant un fichier de configuration, un fichier principal pour l'application Flask, un fichier de dépendances, et des templates HTML pour afficher les livraisons récentes.

- **Explication :**
  - `requirements.txt` liste les dépendances nécessaires pour le projet.
  - `config.py` contient les configurations de la base de données.
  - `app.py` est le fichier principal de l'application Flask, configurant les routes pour afficher les livraisons récentes.
  - `templates/recent_deliveries.html` est le template HTML pour afficher les livraisons des 10 derniers jours.



#### Yosr : 

### `hb_mcd.png` : Schéma MCD au format image
Ce fichier est une image du Modèle Conceptuel de Données (MCD), représentant les entités, attributs, et relations de la base de données.

### `hb_triggers.sql` : Fichier SQL contenant les triggers

Ce fichier SQL contient les triggers, qui sont des procédures automatiques déclenchées par certains événements sur les tables de la base de données.

### `hb_views.sql` : Fichier SQL contenant uniquement la création des vues
Ce fichier SQL contient les instructions pour créer les vues nécessaires à l'application, permettant de simplifier les requêtes complexes.


### `api_fournisseur` :

- **Structure du Dossier :**
  Le dossier `api_fournisseur` contient les fichiers nécessaires pour implémenter l'API Fournisseur, incluant un fichier de configuration, un fichier principal pour l'application Flask, et un fichier de dépendances.

- **Explication :**
  - `requirements.txt` liste les dépendances nécessaires pour le projet.
  - `config.py` contient les configurations de la base de données.
  - `app.py` est le fichier principal de l'application Flask, configurant les routes pour l'API permettant de consulter le stock de pièces par usine.



#### Sinthy : 

### `hb_funcs_procs.sql` : Fichier SQL contenant les fonctions et procédures

Ce fichier SQL contient les fonctions et procédures stockées, permettant d'automatiser certaines opérations sur la base de données.

### `ws_stock` :

- **Structure du Dossier :**
  Le dossier `ws_stock` contient les fichiers nécessaires pour implémenter le service Stock, incluant un fichier de configuration, un fichier principal pour l'application Flask, un fichier de dépendances, et des templates HTML pour afficher les stocks des usines.

- **Explication :**
  - `requirements.txt` liste les dépendances nécessaires pour le projet.
  - `config.py` contient les configurations de la base de données.
  - `app.py` est le fichier principal de l'application Flask, configurant les routes pour afficher les stocks des usines.
  - `templates/stock.html` est le template HTML pour afficher la quantité de pièces restantes par usine.
