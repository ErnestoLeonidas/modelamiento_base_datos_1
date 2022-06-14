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

ALTER TABLE Clientes ADD CONSTRAINT cliente_PK PRIMARY KEY (rut_cliente);

CREATE TABLE Comunas( 
    id_comuna NUMBER NOT NULL, 
    nombre VARCHAR2(250) NOT NULL, 
    provincia_id NUMBER NOT NULL 
);

ALTER TABLE Comunas ADD CONSTRAINT comuna_PK PRIMARY KEY (id_comuna);

ALTER TABLE Clientes ADD CONSTRAINT comuna_FK FOREIGN KEY (comuna_id) 
    REFERENCES Comunas (id_comuna);


INSERT INTO Comunas VALUES(1, 'Arica', 1);

INSERT INTO Clientes VALUES(1,'6','Alan','','Brito','','Su casa',555444,'su@correo.cl',1);

SELECT 
    cl.primer_nombre,
    cl.apellido_paterno,
    co.nombre AS "COMUNA"
FROM Clientes cl
    JOIN Comunas co ON (cl.comuna_id = co.id_comuna);
    
    
SELECT * FROM Comunas;

SELECT * FROM Clientes;

SELECT 
    co.nombre
FROM Comunas co;

SELECT 
    cl.rut_cliente,
    cl.primer_nombre,
    cl.apellido_paterno,
    cl.comuna_id
FROM Clientes cl;

SELECT 
    cl.rut_cliente AS "Rut",
    cl.primer_nombre,
    cl.apellido_paterno,
    cl.comuna_id,
    co.nombre AS "Nombre Comuna"
FROM Clientes cl 
    JOIN Comunas co ON (cl.comuna_id = co.id_comuna)
;