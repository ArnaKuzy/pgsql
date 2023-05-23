-- Active: 1684657404459@@127.0.0.1@5432@demo

-- Créer un schéma
CREATE SCHEMA exemple;

-- Afficher le schema actuel
SELECT current_schema();

-- Afficher les schemas utilisés
SHOW search_path;

-- Modifier le schema actif
SET search_path TO exemple, public;

-- S
DROP SCHEMA exemple;

SELECT * FROM users;
SELECT * FROM forum.users;
