
-- Création d'une table avec une colonne de type 'json'
CREATE TABLE sessions(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    session_data JSON
);

-- Insertion d'objets JSON
INSERT INTO sessions(session_data)
VALUES 
        ('{"user_id": 2, "nom": "John2", "email": "john2@gmail.com", "role": "moderator", "droits": { "create": false, "read": true, "update": true, "delete": false} }'),
        ('{"user_id": 3, "nom": "John Wick", "email": "johnwick@gmail.com", "role": "admin", "droits": { "create": true, "read": true, "update": true, "delete": true} }'),
        ('{"user_id": 4, "nom": "John 4", "email": "john4@gmail.com", "role": "guest", "droits": { "create": false, "read": true, "update": false, "delete": false} }');

-- Modification du json
UPDATE sessions SET session_data = '{"user_id": 4, "nom": "John 4", "email": "john4@gmail.com", "role": "guest", "droits": { "create": false, "read": true, "update": false, "delete": false} }';

SELECT * FROM sessions;

DELETE FROM sessions WHERE id = 2;

-- Récupération de valeurs dans le JSON
SELECT session_data->'user_id' AS user_id FROM sessions WHERE id = 3;

SELECT session_data->'droits' AS droits FROM sessions WHERE id = 3;
SELECT session_data->>'droits' AS droits FROM sessions WHERE id = 3;

SELECT session_data -> 'droits' -> 'read' as droit_read FROM sessions WHERE id = 3;


SELECT * FROM sessions WHERE session_data ->> 'role' = 'admin';

SELECT * FROM sessions WHERE session_data -> 'droits' ->> 'create' = 'true';