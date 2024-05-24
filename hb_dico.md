
### Dictionnaire de Données

#### EMPLOYE
| Attribut       | Description                     | Type               | Contraintes               |
|----------------|---------------------------------|--------------------|---------------------------|
| `code_employe`   | Code unique de l'employé        | `INTEGER`            | `PK, NOT NULL`              |
| `nom_employe`    | Nom de l'employé                | `VARCHAR(50)`        | `NOT NULL`                  |
| `prenom_employe` | Prénom de l'employé             | `VARCHAR(50)`        | `NOT NULL`                  |
| `age`            | Âge de l'employé                | `INTEGER`            | `NOT NULL, > 0`             |
| `date_arrivee`   | Date d'arrivée de l'employé     | `DATE`               | `NOT NULL`                  |
| `date_depart`    | Date de départ de l'employé     | `DATE`               | `NULLABLE`                  |
| `code_usine`     | Code de l'usine d'affectation   | `INTEGER`            | `FK (USINE), NOT NULL`      |

#### FOURNISSEUR
| Attribut        | Description                      | Type               | Contraintes               |
|-----------------|----------------------------------|--------------------|---------------------------|
| `code_fournisseur`| Code unique du fournisseur       | `INTEGER`            | `PK, NOT NULL`              |
| `nom_fournisseur` | Nom du fournisseur               | `VARCHAR(50)`        | `NOT NULL`                  |

#### LIVRAISON
| Attribut        | Description                            | Type               | Contraintes               |
|-----------------|----------------------------------------|--------------------|---------------------------|
| `code_livraison`  | Code unique de la livraison            | `INTEGER`            | `PK, NOT NULL`              |
| `date_livraison`  | Date de la livraison                   | `DATE`               | `NOT NULL`                  |
| `quantite`        | Quantité livrée                        | `INTEGER`            | `NOT NULL, > 0`             |
| `code_usine`      | Code de l'usine recevant la livraison  | `INTEGER`            | `FK (USINE), NOT NULL`      |
| `code_employe`    | Code de l'employé recevant la livraison| `INTEGER`            | `FK (EMPLOYE), NULLABLE`    |
| `code_fournisseur`| Code du fournisseur                    | `INTEGER`            | `FK (FOURNISSEUR), NOT NULL`|

#### ROBOT
| Attribut         | Description                           | Type               | Contraintes               |
|------------------|---------------------------------------|--------------------|---------------------------|
| `code_robot`       | Code unique du robot                  | `INTEGER`            | `PK, NOT NULL`              |
| `nom_robot`        | Nom du robot                          | `VARCHAR(50)`        | `NOT NULL`                  |
| `quantite_produite`| Quantité produite                     | `INTEGER`            | `NOT NULL, > 0`             |
| `date_production`  | Date de production                    | `DATE`               | `NOT NULL`                  |
| `code_usine`       | Code de l'usine produisant le robot   | `INTEGER`            | `FK (USINE), NOT NULL`      |

#### USINE
| Attribut         | Description                           | Type               | Contraintes               |
|------------------|---------------------------------------|--------------------|---------------------------|
| `code_usine`       | Code unique de l'usine                | `INTEGER`            | `PK, NOT NULL`              |
| `nom_usine`        | Nom de l'usine                        | `VARCHAR(50)`        | `NOT NULL`                  |
| `adresse_usine`    | Adresse de l'usine                    | `VARCHAR(100)`       | `NOT NULL`                  |

### Relations

#### TRAVAILLE_DANS
| Entité           | Cardinalité   | Description                   |
|------------------|---------------|--------------------------------|
| `EMPLOYE`          | `0..N`          | Un employé travaille dans une usine |
| `USINE`            | `1..N`          | Une usine a plusieurs employés   |

#### LIVRE_A
| Entité           | Cardinalité   | Description                    |
|------------------|---------------|---------------------------------|
| `FOURNISSEUR`      | `1..N`          | Un fournisseur livre à des usines |
| `USINE`            | `0..N`          | Une usine reçoit des livraisons de plusieurs fournisseurs |

#### RECUE_PAR
| Entité           | Cardinalité   | Description                    |
|------------------|---------------|---------------------------------|
| `EMPLOYE`          | `0..N`          | Un employé peut recevoir plusieurs livraisons |
| `LIVRAISON`        | `1..1`          | Une livraison est reçue par un employé (peut être NULL) |

#### DELIVRE_A
| Entité           | Cardinalité   | Description                    |
|------------------|---------------|---------------------------------|
| `USINE`            | `1..N`          | Une usine reçoit plusieurs livraisons |
| `LIVRAISON`        | `0..N`          | Une livraison est destinée à une usine  |

#### PRODUIT
| Entité           | Cardinalité   | Description                    |
|------------------|---------------|---------------------------------|
| `ROBOT`            | `0..N`          | Un robot est produit par une usine |
| `USINE`            | `1..N`          | Une usine produit plusieurs robots |
