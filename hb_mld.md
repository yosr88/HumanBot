
### Modèle Logique de Données (MLD)

#### EMPLOYE
- `code_employe` INTEGER PRIMARY KEY
- `nom_employe` VARCHAR(50) NOT NULL
- `prenom_employe` VARCHAR(50) NOT NULL
- `age` INTEGER NOT NULL CHECK (age > 0)
- `date_arrivee` DATE NOT NULL
- `date_depart` DATE NULL
- `code_usine` INTEGER NOT NULL REFERENCES USINE(code_usine)

#### FOURNISSEUR
- `code_fournisseur` INTEGER PRIMARY KEY
- `nom_fournisseur` VARCHAR(50) NOT NULL

#### USINE
- `code_usine` INTEGER PRIMARY KEY
- `nom_usine` VARCHAR(50) NOT NULL
- `adresse_usine` VARCHAR(100) NOT NULL

#### LIVRAISON
- `code_livraison` INTEGER PRIMARY KEY
- `date_livraison` DATE NOT NULL
- `quantite` INTEGER NOT NULL CHECK (quantite > 0)
- `code_usine` INTEGER NOT NULL REFERENCES USINE(code_usine)
- `code_employe` INTEGER NULL REFERENCES EMPLOYE(code_employe)
- `code_fournisseur` INTEGER NOT NULL REFERENCES FOURNISSEUR(code_fournisseur)

#### ROBOT
- `code_robot` INTEGER PRIMARY KEY
- `nom_robot` VARCHAR(50) NOT NULL
- `quantite_produite` INTEGER NOT NULL CHECK (quantite_produite > 0)
- `date_production` DATE NOT NULL
- `code_usine` INTEGER NOT NULL REFERENCES USINE(code_usine)
