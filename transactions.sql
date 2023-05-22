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