-- Création d'un type pour valider le format d'un email
CREATE DOMAIN email_type AS VARCHAR
  CHECK ( value ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$' );

-- Création d'un type Unsigned Integer
CREATE DOMAIN uint AS INTEGER CHECK (value > 0);

-- Suppression du type
DROP DOMAIN uint;

-- Création d'un type Unsigned Integer sur 1 Octect
CREATE DOMAIN uint1 AS INTEGER CHECK (value >= 0 AND value <= 255);

-- Test
INSERT INTO users(email, is_active, valuint) VALUES ('emadddiel@gmail.com', '1', 256);
