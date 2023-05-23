CREATE DOMAIN email_type AS VARCHAR
  CHECK ( value ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$' );

DROP DOMAIN uint;
CREATE DOMAIN uint AS INTEGER CHECK (value > 0);
CREATE DOMAIN uint1 AS INTEGER CHECK (value >= 0 AND value <= 255);

INSERT INTO users(email, is_active, valuint) VALUES ('emadddiel@gmail.com', '1', 256);

SELECT 
   table_name, 
   column_name, 
   data_type
FROM 
   information_schema.columns
WHERE 
   table_name = 'users';

      SELECT con.*
       FROM pg_catalog.pg_constraint con
            INNER JOIN pg_catalog.pg_class rel
                       ON rel.oid = con.conrelid
            INNER JOIN pg_catalog.pg_namespace nsp
                       ON nsp.oid = connamespace
       WHERE nsp.nspname = 'public';