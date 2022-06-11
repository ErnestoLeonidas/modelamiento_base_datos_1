CREATE TABLE Cliente( 
    rut_cliente         NUMBER(11) NOT NULL, 
    dv CHAR(1)          NOT NULL, 
    primer_nombre       VARCHAR2(250) NOT NULL, 
    segundo_nombre      VARCHAR2(250), 
    apellido_paterno    VARCHAR2(250) NOT NULL, 
    apellido_materno    VARCHAR2(250), 
    direccion           VARCHAR2(250) NOT NULL, 
    fono                NUMBER NOT NULL,  
    correo              VARCHAR2(250) NOT NULL, 
    comuna_id           NUMBER NOT NULL 
);

CREATE TABLE Comuna( 
    id_comuna NUMBER NOT NULL, 
    nombre VARCHAR2(250) NOT NULL, 
    provincia_id NUMBER NOT NULL 
);
