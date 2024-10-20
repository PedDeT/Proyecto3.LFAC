
CREATE TABLE computadoras (
    id INT,
    marca CHAR(50),
    modelo CHAR(50),
    año INT,
    precio FLOAT
);

INSERT INTO computadoras (id, marca, modelo, año, precio) VALUES (1, 'Dell', 'XPS 13', 2021, 999.99);
INSERT INTO computadoras (id, marca, modelo, año, precio) VALUES (2, 'Apple', 'MacBook Pro', 2022, 1299.99);
INSERT INTO computadoras (id, marca, modelo, año, precio) VALUES (3, 'HP', 'Spectre x360', 2020, 1099.99);

SELECT * FROM computadoras WHERE año >= 2021;

UPDATE computadoras SET precio = 949.99 WHERE id = 1;

DELETE FROM computadoras WHERE id = 3;
