-- Fonction pour calculer la distance entre 2 points
CREATE OR REPLACE FUNCTION calcul_distance(x1 FLOAT, x2 FLOAT, y1 FLOAT, y2 FLOAT)
RETURNS FLOAT
AS $$
    SELECT SQRT((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
$$ LANGUAGE SQL;

-- Appel de la fonction
SELECT calcul_distance(1,1, 43, 52);

ALTER TABLE users ADD COLUMN role VARCHAR(10) NOT NULL DEFAULT 'guest';
SELECT * FROM users;

-- Fonction pour créer un users avec le role admin et plusieurs valeurs par défaut
CREATE OR REPLACE FUNCTION create_admin(email VARCHAR, code_postal INTEGER DEFAULT NULL)
RETURNS void
AS $$

    INSERT INTO users(email, code_postal, is_active, role) VALUES(email, code_postal, true, 'admin');

$$ LANGUAGE SQL;


-- Appel sans code postal
SELECT create_admin('admin3@gmail.com');
SELECT create_admin('admin4@gmail.com', 23454);

