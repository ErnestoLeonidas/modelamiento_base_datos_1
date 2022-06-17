-- 1. Primero Cree todas las tablas
-- 2. Añada las claves primarias
-- 3. Incluya las claves foraneas
-- 4. Inserte valores a las tablas según el orden, 
--    desde las tablas que no tienen foranea a las que si las poseen

--#### CREATE TABLES ####--

CREATE TABLE Regiones(
    id_region   NUMBER NOT NULL,
    nombre      VARCHAR(250) NOT NULL
);

-- Crear Tabla Provincia
CREATE TABLE Provincias(
    id_provincia    NUMBER NOT NULL,
    nombre          VARCHAR(250) NOT NULL,
    region_id       NUMBER NOT NULL
);

--Creo Tabla Comunas
CREATE TABLE Comunas( 
    id_comuna       NUMBER NOT NULL, 
    nombre          VARCHAR2(250) NOT NULL, 
    provincia_id    NUMBER NOT NULL 
);

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

-- Create Table Sector