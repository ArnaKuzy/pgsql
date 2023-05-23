-- Active: 1684657404459@@127.0.0.1@5432@demo

BEGIN;
INSERT INTO users(login, password) VALUES('Pierre2', 'mdp');
UPDATE users SET login = 'Pierre le Deux' WHERE id = 9;

SAVEPOINT user_created;

SELECT * FROM users;

INSERT INTO session(user_id, session_token) VALUES(9, 'abcdee');

ROLLBACK TO user_created;

SELECT * FROM session;

ROLLBACK;

COMMIT;






-- Exemple 2

CREATE SCHEMA transactions;

CREATE TABLE transactions.users(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    login VARCHAR(50) NOT NULL,
    password VARCHAR(100)
);

INSERT INTO transactions.users(login, password)
VALUES  ('john', 'mdp'),
        ('Mich', '1234'),
        ('Pierre', 'mdpsecret'),
        ('Yves', 'tapez le mot de passe');

-- Transaction raté
SELECT * FROM transactions.users;

BEGIN;

UPDATE transactions.users SET password = 'plussecure';

ROLLBACK;

-- Transaction réussie
BEGIN;
UPDATE transactions.users SET password = 'plussecure' WHERE id = 2;

COMMIT;

-- Sauvegardes
BEGIN;

-- Bonne requête 
UPDATE transactions.users SET password = 'plussecured' WHERE id = 3;

-- Création d'un point de sauvegarde
SAVEPOINT premierupdate;

-- Mauvaise requête
DELETE FROM transactions.users;

-- Retour au point de sauvegarde
ROLLBACK TO premierupdate;

-- On refait la requête mais correct cette fois ci
DELETE FROM transactions.users WHERE id = 1;

-- Valide les changements
COMMIT;