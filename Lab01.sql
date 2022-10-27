/* Crear base de datos */
CREATE DATABASE dbElectrodimestico;

/* Poner en uso la BD */
USE dbElectrodimestico;

/* Crear tabla 1 */
CREATE TABLE PROVEEDOR
(
	CODPROV char(5),
    RAZSOCPROV VARCHAR(90),
    RUCPROV CHAR(11),
    EMAPROV VARCHAR(50),
    ESTPROV CHAR(1)
);

ALTER TABLE PROVEEDOR 
	ADD CONSTRAINT CODPROV_PK PRIMARY KEY (CODPROV);
    
SHOW COLUMNS IN PROVEEDOR;
    
/* Crear tabla 2 */
CREATE TABLE COMPRA 
(
	CODCOM CHAR(5),
    FECCOM DATETIME,
    CODVEND CHAR(4),
    CODPROV CHAR(5),
    ESTCOM CHAR(1)
);
ALTER TABLE COMPRA 
	ADD CONSTRAINT CODCOM_PK PRIMARY KEY (CODCOM);

SHOW COLUMNS IN COMPRA;

/* Listar tablas de la base de datos */
SHOW TABLES;

/* Crear relación */
ALTER TABLE COMPRA
	ADD CONSTRAINT COMPRA_PROVEEDOR
    FOREIGN KEY (CODPROV) 
    REFERENCES PROVEEDOR(CODPROV);

/* Verificar la creación de las relaciones */
SELECT 
  CONSTRAINT_NAME,
  `TABLE_NAME`,                            -- Foreign key table
  `COLUMN_NAME`,                           -- Foreign key column
  `REFERENCED_TABLE_NAME`,                 -- Origin key table
  `REFERENCED_COLUMN_NAME`                 -- Origin key column
FROM
  `INFORMATION_SCHEMA`.`KEY_COLUMN_USAGE`  -- Will fail if user don't have privilege
WHERE
  `TABLE_SCHEMA` = SCHEMA()                -- Detect current schema in USE 
  AND `REFERENCED_TABLE_NAME` IS NOT NULL; -- Only tables with foreign keys;

/* Ver listado de datos de la tabla PROVEEDOR */
SELECT * FROM PROVEEDOR;

/* Listar campos de tabla PROVEEDOR */
SHOW COLUMNS IN PROVEEDOR;

/* Inserción de registro */
INSERT INTO PROVEEDOR
	(CODPROV, RAZSOCPROV, RUCPROV, EMAPROV, ESTPROV) /* Ingrese los campos de la tabla */
VALUES
	('P001', 'Tienda Leopolda S.A.', '12345678912', 'leopolda@gmail.com', 'A');
    
INSERT INTO PROVEEDOR
	(CODPROV, RAZSOCPROV, RUCPROV, EMAPROV, ESTPROV) /* Ingrese los campos de la tabla */
VALUES
	('P002', 'Tienda Marcos S.A.', '78945678912', 'marcos@gmail.com', 'A'),
    ('P003', 'Tienda Lolita S.A.', '78945678555', 'lolita@yahoo.com', 'A');
    
/* Listado de registros */
SELECT * FROM PROVEEDOR;

/* Actualización de registros */
UPDATE PROVEEDOR
	SET RAZSOCPROV = 'Tienda María Del Carmen S.A.'
    WHERE CODPROV = 'P003';

UPDATE PROVEEDOR
	SET EMAPROV = 'maria@yahoo.com'
    WHERE CODPROV = 'P003';

SELECT * FROM PROVEEDOR;
    
/* Eliminación de registros (BORRADO FÍSICO) */
DELETE FROM PROVEEDOR 
	WHERE CODPROV = 'P003';

SELECT * FROM PROVEEDOR;

/* Eliminación de registros (BORRADO LÓGICO) */
UPDATE PROVEEDOR
	SET ESTPROV = 'I'
    WHERE CODPROV = 'P001';

SELECT * FROM PROVEEDOR;

/* Listar los registros activos */
SELECT * FROM PROVEEDOR
WHERE ESTPROV = 'A';

/* Listar los registros inactivos */
SELECT * FROM PROVEEDOR
WHERE ESTPROV = 'I';

/* Recuperando a LEOPOLDA */
UPDATE PROVEEDOR
	SET ESTPROV = 'A'
    WHERE CODPROV = 'P001';