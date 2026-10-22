-- ------------------------------------------------------------
--  TABLAS - DDL
-- ------------------------------------------------------------
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;


CREATE TABLE clientes (
id SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email  VARCHAR(150) UNIQUE NOT NULL,
edad INTEGER NOT NULL CHECK (edad>=18)
);	

CREATE TABLE productos (
id SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DECIMAL(10,2) NOT NULL CHECK(precio>0),
stock INTEGER NOT NULL CHECK(stock>=0)
);

CREATE TABLE ventas (
id SERIAL PRIMARY KEY,
cliente_id INTEGER NOT NULL,
producto_id INTEGER NOT NULL,
cantidad    INTEGER NOT NULL CHECK (cantidad > 0),
fecha       DATE NOT NULL DEFAULT CURRENT_DATE,
CONSTRAINT fk_clientes
	FOREIGN KEY (cliente_id) REFERENCES clientes(id),
CONSTRAINT fk_productos
	FOREIGN KEY (producto_id) REFERENCES productos(id)

);

-- ------------------------------------------------------------
--  DATOS
-- ------------------------------------------------------------

BEGIN;
INSERT INTO clientes (nombre, email, edad) VALUES
('Jose', 'jose12@gmail.com',  50),
('Antonio', 'antonio12@gmail.com',  18),
('Agustin', 'agustin12@gmail.com',  25),
('Federico', 'fede12@gmail.com',  31),
('Facundo', 'facundo12@gmail.com',  40),
('Anastacio', 'tacio12@gmail.com',  21),
('Anastacio', 'tacio12gmail.com',  21);

INSERT INTO productos (nombre, precio, stock) VALUES
('Sunshine',100000,10),
('Razz',200000,5),
('Svel',250000,15),
('Avian',300000,18),
('Ovanta',180000,13),
('Regal',150000,24);


INSERT INTO ventas (cliente_id, producto_id, cantidad,fecha) VALUES
(1,2,2,'2026-09-15'),
(3,3,1,'2026-09-20'),
(2,4,1,'2026-10-1'),
(4,5,1,'2026-10-12'),
(5,4,1,'2026-10-18'),
(1,5,3,CURRENT_DATE);

COMMIT;

-- UPDATE
SELECT * FROM productos WHERE precio < 200000;

UPDATE productos
SET precio = precio * 1.10
WHERE precio < 200000;

-- DELETE

SELECT * FROM clientes WHERE email = 'tacio12gmail.com';

DELETE FROM clientes 
WHERE email = 'tacio12gmail.com';

-- SELECT FINALES
SELECT * FROM clientes; 
SELECT * FROM productos;
SELECT * FROM ventas;
