CREATE TABLE stats (
    count_created_users BIGINT
);

INSERT INTO stats(count_created_users) VALUES(0);

CREATE OR REPLACE FUNCTION trigger_insert_user()
RETURNS TRIGGER
AS $$
    BEGIN

        UPDATE stats SET count_created_users = count_created_users + 1;

        RETURN NEW;
    END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER incr_created_users
    AFTER INSERT ON users
    EXECUTE PROCEDURE trigger_insert_user();

SELECT * FROM stats;
INSERT INTO users(email, is_active) VALUES('edadefefzefail@machin.com', true);