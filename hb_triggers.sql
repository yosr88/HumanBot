-- Fonction pour insertion dans ALL_WORKERS_ELAPSED
CREATE OR REPLACE FUNCTION insert_worker()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO EMPLOYE (nom_employe, prenom_employe, age, date_arrivee, code_usine)
        VALUES (NEW.lastname, NEW.firstname, NEW.age, NEW.start_date, NEW.code_usine);
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Operation not allowed';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_insert_worker
INSTEAD OF INSERT ON ALL_WORKERS_ELAPSED
FOR EACH ROW EXECUTE FUNCTION insert_worker();

-- Fonction pour enregistrer la date d’ajout du robot
CREATE OR REPLACE FUNCTION log_robot_creation()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO AUDIT_ROBOT (code_robot, date_creation)
    VALUES (NEW.code_robot, CURRENT_DATE);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_log_robot_creation
AFTER INSERT ON ROBOT
FOR EACH ROW EXECUTE FUNCTION log_robot_creation();

-- Fonction pour vérifier le nombre de tables WORKERS_FACTORY_<N>
CREATE OR REPLACE FUNCTION check_workers_factory_tables()
RETURNS VOID AS $$
DECLARE
    factory_count INT;
    table_count INT;
BEGIN
    SELECT COUNT(*) INTO factory_count FROM USINE;
    SELECT COUNT(*) INTO table_count FROM information_schema.tables
    WHERE table_name LIKE 'WORKERS_FACTORY_%';

    IF factory_count <> table_count THEN
        RAISE EXCEPTION 'Mismatch between number of factories and worker tables';
    END IF;
END;
$$ LANGUAGE plpgsql;
