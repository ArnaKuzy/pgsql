
DROP TABLE users;

-- votre commentaire
CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY NOT NULL CHECK (id > 0),
    email email_type NOT NULL UNIQUE,
    code_postal INTEGER CHECK (code_postal > 0),
    is_active BOOLEAN NOT NULL
);

ALTER TABLE users ADD COLUMN valuint uint1;

DROP TABLE products;
-- Table product
CREATE TABLE IF NOT EXISTS products (
    id BIGSERIAL PRIMARY KEY NOT NULL CHECK (id > 0),
    vendeur_id BIGINT NOT NULL REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
    nom VARCHAR(100) NOT NULL UNIQUE,
    ancien_prix MONEY,
    prix MONEY NOT NULL,
    reduction DECIMAL,
    description TEXT,
    image VARCHAR(100)
);

-- ATTENTION TABLE USER existe dans PG conflit si on ne precise pas le schema

SELECT * FROM user;

SELECT * FROM users;

INSERT INTO users(email, is_active) 
    VALUES('john2@gmail.com', '1');

SELECT * FROM users;



-- Tailles des types
SELECT pg_column_size('75-001'::VARCHAR(5));

SELECT pg_column_size('a'::CHAR(1));
SELECT pg_column_size('abcdefg'::CHAR(1));
SELECT pg_column_size('à'::CHAR(1));
SELECT pg_column_size('か'::CHAR(1));

SELECT pg_column_size(75001::INTEGER);

-- Poids d'une table
SELECT pg_size_pretty(pg_total_relation_size('users'));

