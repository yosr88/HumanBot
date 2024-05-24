-- GET_NB_WORKERS
CREATE OR REPLACE FUNCTION GET_NB_WORKERS(factory_id INT) 
RETURNS INT AS $$
DECLARE
    nb_workers INT;
BEGIN
    SELECT COUNT(*) INTO nb_workers
    FROM EMPLOYE
    WHERE code_usine = factory_id AND date_depart IS NULL;
    
    RETURN nb_workers;
END;
$$ LANGUAGE plpgsql;

-- GET_NB_BIG_ROBOTS
CREATE OR REPLACE FUNCTION GET_NB_BIG_ROBOTS() 
RETURNS INT AS $$
DECLARE
    nb_big_robots INT;
BEGIN
    SELECT COUNT(*) INTO nb_big_robots
    FROM ROBOT
    WHERE quantite_produite > 3;
    
    RETURN nb_big_robots;
END;
$$ LANGUAGE plpgsql;

-- GET_BEST_SUPPLIER
CREATE OR REPLACE FUNCTION GET_BEST_SUPPLIER() 
RETURNS VARCHAR AS $$
DECLARE
    best_supplier VARCHAR(100);
BEGIN
    SELECT nom_fournisseur INTO best_supplier
    FROM BEST_SUPPLIERS
    ORDER BY total_quantity DESC
    LIMIT 1;
    
    RETURN best_supplier;
END;
$$ LANGUAGE plpgsql;

-- SEED_DATA_WORKERS
CREATE OR REPLACE PROCEDURE SEED_DATA_WORKERS(nb_workers INT, factory_id INT) 
LANGUAGE plpgsql AS $$
BEGIN
    FOR i IN 1..nb_workers LOOP
        INSERT INTO EMPLOYE (nom_employe, prenom_employe, age, date_arrivee, code_usine)
        VALUES ('worker_f_' || i, 'worker_l_' || i, FLOOR(RANDOM() * (65-20) + 20), 
                DATE '2065-01-01' + (RANDOM() * (2070-01-01 - 2065-01-01)), factory_id);
    END LOOP;
END;
$$;

-- ADD_NEW_ROBOT
CREATE OR REPLACE PROCEDURE ADD_NEW_ROBOT(model_name VARCHAR(50), usine_id INT) 
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO ROBOT (nom_robot, quantite_produite, date_production, code_usine)
    VALUES (model_name, 0, CURRENT_DATE, usine_id);
END;
$$;
