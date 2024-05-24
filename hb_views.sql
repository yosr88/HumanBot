-- Vue ALL_WORKERS
CREATE VIEW ALL_WORKERS AS
SELECT 
    code_employe,
    nom_employe AS lastname,
    prenom_employe AS firstname,
    age,
    date_arrivee AS start_date
FROM EMPLOYE
WHERE date_depart IS NULL
ORDER BY date_arrivee DESC;

-- Vue ALL_WORKERS_ELAPSED
CREATE VIEW ALL_WORKERS_ELAPSED AS
SELECT 
    code_employe,
    lastname,
    firstname,
    age,
    start_date,
    CURRENT_DATE - start_date AS days_elapsed
FROM ALL_WORKERS;

-- Vue BEST_SUPPLIERS
CREATE VIEW BEST_SUPPLIERS AS
SELECT 
    f.code_fournisseur,
    f.nom_fournisseur,
    SUM(l.quantite) AS total_quantity
FROM FOURNISSEUR f
JOIN LIVRAISON l ON f.code_fournisseur = l.code_fournisseur
GROUP BY f.code_fournisseur, f.nom_fournisseur
HAVING SUM(l.quantite) > 1000
ORDER BY total_quantity DESC;

-- Vue ROBOTS_FACTORIES
CREATE VIEW ROBOTS_FACTORIES AS
SELECT 
    r.code_robot,
    r.nom_robot,
    r.quantite_produite,
    r.date_production,
    u.code_usine,
    u.nom_usine
FROM ROBOT r
JOIN USINE u ON r.code_usine = u.code_usine;
