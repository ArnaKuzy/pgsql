CREATE VIEW users_products
AS
    SELECT 
        U.id AS user_id,
        email,
        P.id AS product_id,
        vendeur_id,
        nom,
        ancien_prix,
        prix,
        description 
    FROM users AS U
    JOIN products AS P
        ON U.id = P.vendeur_id;

SELECT nom, prix FROM users_products;