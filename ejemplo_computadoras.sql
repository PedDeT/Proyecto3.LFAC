CREATE TABLE computadoras (
    id INT,
    marca CHAR(50),
    modelo CHAR(50),
    año INT,
    precio FLOAT
);
INSERT INTO computadoras (id, marca, modelo, año, precio) VALUES (1, 'Dell', 'XPS 13', 2021, 999.99);
SELECT * FROM computadoras WHERE año >= 2021;
