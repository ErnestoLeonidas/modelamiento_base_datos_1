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

-- Añadir la Clave Foranea o FK a la tabla Clientes
ALTER TABLE Clientes ADD CONSTRAINT comuna_FK FOREIGN KEY (comuna_id) 
    REFERENCES Comunas (id_comuna);
    
-- Añadir la PK a la tabla Comunas
ALTER TABLE Comunas ADD CONSTRAINT comuna_PK PRIMARY KEY (id_comuna);



-- Agregar datos a la tabla
INSERT INTO Clientes VALUES (123456,'K','Juanito','','Brito','Delgado','Su casa #123',5555464,'juanito@gmail.com',2 );

INSERT INTO Comunas VALUES (1,'Arica', 1);
INSERT INTO Comunas VALUES (2,'Iquique', 1 );
INSERT INTO Comunas VAlUES (3,'Los Muermos', 10);

-- Consultar Tabla
SELECT * FROM Clientes;
SELECT * FROM Comunas ORDER BY id_comuna ASC;

SELECT * FROM Provincias;


-- Crear Tabla Provincia
CREATE TABLE Provincias(
    id_provincia    NUMBER NOT NULL,
    nombre          VARCHAR(250) NOT NULL,
    region_id       NUMBER NOT NULL
);

ALTER TABLE Provincias ADD CONSTRAINT provincia_PK PRIMARY KEY (id_provincia);

INSERT INTO Provincias VALUES (1,'Arica',1);
INSERT INTO Provincias VALUES (10,'Puerto Montt',10);

ALTER TABLE Comunas ADD CONSTRAINT provincia_FK FOREIGN KEY (provincia_id) 
    REFERENCES Provincias (id_provincia);
    

-- Borrar tablas
DROP TABLE Clientes;
DROP TABLE Comunas;
DROP TABLE Provincias;
DROP TABLE Regiones;

CREATE TABLE Regiones(
    id_region   NUMBER          CONSTRAINT nn_id_reg     NOT NULL,
    nombre      VARCHAR(250)    CONSTRAINT nn_nombre_reg NOT NULL
);

CREATE TABLE Provincias(
    id_provincia    NUMBER          CONSTRAINT nn_id_prov       NOT NULL,
    nombre          VARCHAR(250)    CONSTRAINT nn_nombre_prov   NOT NULL,
    region_id       NUMBER          CONSTRAINT nn_region_id_prov     NOT NULL
);

-- CREAR SECUENCIA PARA IDS
CREATE SEQUENCE seq_id_regiones
START WITH 1
INCREMENT BY 1
MAXVALUE 5
MINVALUE 1
NOCYCLE;

DROP SEQUENCE seq_id_regiones

INSERT INTO Regiones VALUES (seq_id_regiones.NEXTVAL, 'Arica');
INSERT INTO Regiones VALUES (seq_id_regiones.NEXTVAL, 'Iquique');
INSERT INTO Regiones VALUES (seq_id_regiones.NEXTVAL, 'Antofagasta');
INSERT INTO Regiones VALUES (seq_id_regiones.NEXTVAL, 'Calama');
INSERT INTO Regiones VALUES (seq_id_regiones.NEXTVAL, 'Valparaiso');
INSERT INTO Regiones VALUES (seq_id_regiones.NEXTVAL, 'Santiago');

SELECT * FROM Regiones;
DROP TABLE Regiones;