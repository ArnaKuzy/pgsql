
CREATE SCHEMA account;
CREATE SCHEMA eshop;

CREATE TABLE account.users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50)
);

DROP TABLE eshop.order;
CREATE TABLE eshop.order (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES account.users(id),
    name VARCHAR(50)
);

INSERT INTO account.users(name) VALUES('JEAN');
INSERT INTO eshop.order(user_id, name) VALUES(1, 'MACBOUKE');

SELECT 
    EO.id id_produit,
    EO.name AS produit,
    AU.id AS id_user,
    AU.name AS buyer
FROM eshop.order AS EO
JOIN account.users AS AU
ON EO.user_id = AU.id;
