-- 1. Primero Cree todas las tablas
-- 2. Añada las claves primarias
-- 3. Incluya las claves foraneas
-- 4. Inserte valores a las tablas según el orden, 
--    desde las tablas que no tienen foranea a las que si las poseen

-- Crear Tabla Clientes
CREATE TABLE Clientes( 
    rut_cliente         NUMBER(11) NOT NULL, 
    dv                  CHAR(1) NOT NULL, 
    primer_nombre       VARCHAR2(250) NOT NULL, 
    segundo_nombre      VARCHAR2(250), 
    apellido_paterno    VARCHAR2(250) NOT NULL, 
    apellido_materno    VARCHAR2(250), 
    direccion           VARCHAR2(250) NOT NULL, 
    fono                NUMBER NOT NULL,  
    correo              VARCHAR2(250) NOT NULL, 
    comuna_id           NUMBER NOT NULL 
);

--Añadir la PK a la Tabla Clientes
ALTER TABLE Clientes ADD CONSTRAINT cliente_PK PRIMARY KEY (rut_cliente);

--Creo Tabla Comunas
CREATE TABLE Comunas( 
    id_comuna       NUMBER NOT NULL, 
    nombre          VARCHAR2(250) NOT NULL, 
    provincia_id    NUMBER NOT NULL 
);

-- Añadir la PK a la tabla Comunas
ALTER TABLE Comunas ADD CONSTRAINT comuna_PK PRIMARY KEY (id_comuna);

-- Añadir la Clave Foranea o FK a la tabla Clientes
ALTER TABLE Clientes ADD CONSTRAINT comuna_FK FOREIGN KEY (comuna_id) 
    REFERENCES Comunas (id_comuna);
    
-- Ingresar datos en la Comunas
INSERT INTO Comunas VALUES (1, 'Arica', 1);
INSERT INTO Comunas VALUES (2, 'Los Muermos', 1);
    
-- Ingresar datos a la tabla Clientes
INSERT INTO Clientes VALUES (123,'K','Alan','','Brito','','Su casa #123',5555,'alan@frito.cl',1);
INSERT INTO Clientes VALUES (456,'K','Pedro','','Brito','','Su casa #123',6666,'pedro@brito.cl',1);

INSERT INTO Clientes VALUES (124,'1','Maria','','Brito','','Su casa #123',7777,'maria@brito.cl',1);

-- Select básico
SELECT * FROM Clientes;
SELECT * FROM Comunas;

-- Select Ordenado según columna
SELECT * FROM Clientes ORDER BY primer_nombre DESC;

SELECT 
    primer_nombre,
    apellido_paterno,
    comuna_id
FROM Clientes;


-- Select simple nivel 2
SELECT 
    cl.primer_nombre AS "Nombre",
    cl.apellido_paterno AS "Apellido", 
    co.nombre AS "Comuna"
FROM Clientes cl
    JOIN Comunas co ON (cl.comuna_id = co.id_comuna)
;
