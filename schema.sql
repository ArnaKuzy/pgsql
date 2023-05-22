
-- Créer un schéma
CREATE SCHEMA exemple;

-- Afficher le schema actuel
SELECT current_schema();

-- Afficher le schéma utilisé
SHOW search_path;

SET search_path TO exemple, public;

SELECT * FROM users;
SELECT * FROM forum.users;

DROP SCHEMA exemple;