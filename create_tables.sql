-- 1. Primero Cree todas las tablas
-- 2. Añada las claves primarias
-- 3. Incluya las claves foraneas
-- 4. Inserte valores a las tablas según el orden, 
--    desde las tablas que no tienen foranea a las que si las poseen

--#### CREATE TABLES ####--

-- 1) CLIENTES
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

-- 2) COMUNAS
--Creo Tabla Comunas
CREATE TABLE Comunas( 
    id_comuna         NUMBER NOT NULL, 
    nombre            VARCHAR2(250) NOT NULL, 
    provincia_id      NUMBER NOT NULL
);

-- 3) PROVINCIA
-- Crear Tabla Provincias
CREATE TABLE Provincias( 
    id_provincia        NUMBER NOT NULL, 
    nombre              VARCHAR2(250) NOT NULL,
    region_id           NUMBER NOT NULL
);

-- 4) REGION
-- Crear Tabla Regiones
CREATE TABLE Regiones( 
    id_region         NUMBER NOT NULL, 
    nombre            VARCHAR2(250) NOT NULL
);

-- 5) SECTOR
-- Crear Tabla Sector
CREATE TABLE Sector( 
    id_sector         NUMBER NOT NULL, 
    nombre            VARCHAR2(250) NOT NULL,
    parque_id         NUMBER NOT NULL
);

-- 6) PARQUE
-- Crear Tabla Parques
CREATE TABLE Parques( 
    id_parque         NUMBER NOT NULL, 
    nombre            VARCHAR2(250) NOT NULL
);

-- 7) ACOMPAÑANTE
-- Crear Tabla Acompañante
CREATE TABLE Acompanantes( 
    rut_acompanante     NUMBER(11) NOT NULL, 
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

-- 8) RESERVAS
-- Crear Tabla Reservas
    -- cambie cliente_rut por rut_cliente
CREATE TABLE Reservas( 
    numero_reserva      NUMBER NOT NULL,
    fecha_reserva       DATE NOT NULL,
    rut_cliente         NUMBER(11) NOT NULL,
    check_in            DATE NOT NULL,
    check_out           DATE NOT NULL,
    total_a_pagar       NUMBER NOT NULL,
    total_final         NUMBER NOT NULL,
    descuento_id        NUMBER NOT NULL,
    habitacion_id       NUMBER NOT NULL,
    parque_id           NUMBER NOT NULL
);

-- 9) RESERVA ACOMPAÑANTE
-- Crear Tabla Reservas_acompanantes
CREATE TABLE Reservas_acompanantes( 
    numero_reserva      NUMBER NOT NULL,
    rut_acompanante     NUMBER(11) NOT NULL
);

-- 10) DESCUENTOS
-- Crear Tabla Descuentos
CREATE TABLE Descuentos( 
    id_descuento            NUMBER NOT NULL,
    codigo_descuento        VARCHAR2(250) NOT NULL,
    es_festivo              CHAR(1) NOT NULL,
    descripcion             VARCHAR2(1000),
    porcentaje_descuento    NUMBER(2)
);

-- 11) SERVICIOS
-- Crear Tabla Servicios
CREATE TABLE Servicios(
    id_servicio         NUMBER NOT NULL,
    codigo_servicio     VARCHAR2(250) NOT NULL,
    nombre              VARCHAR2(250) NOT NULL,
    descripcion         VARCHAR2(1000) NOT NULL,
    valor_persona       NUMBER NOT NULL
);

-- 12) DETALLE SERVICIO
-- Crear Tabla Detalle_Servicio
CREATE TABLE Detalle_Servicio( 
    id_detalle           NUMBER NOT NULL,
    fecha_consumo        DATE NOT NULL,
    total_a_pagar        NUMBER,
    servicio_id          NUMBER,
    reserva_id           NUMBER,                -- cambie reserva_numero por reserva_id
    rut_cliente          NUMBER(11) NOT NULL    -- cambie cliente_rut por rut_cliente
);

-- 13) HABITACION
-- Crear Tabla Habitaciones
CREATE TABLE Habitaciones( 
    id_habitacion        NUMBER NOT NULL,
    numero               NUMBER NOT NULL,
    valor_noche          NUMBER NOT NULL,
    capacidad_max        NUMBER(2) NOT NULL
);

-- 14) DOMOS
-- Crear Tabla Domos
CREATE TABLE Domos( 
    id_habitacion           NUMBER NOT NULL,
    tiene_minibar           CHAR(1) NOT NULL,
    tiene_baño_privado      CHAR(1) NOT NULL,
    tiene_calefaccion       CHAR(1) NOT NULL,
    cantidad_camas          NUMBER(2) NOT NULL
);

-- 15) CABAÑAS
-- Crear Tabla Cabanas
CREATE TABLE Cabanas( 
    id_habitacion           NUMBER NOT NULL,
    tiene_minibar           CHAR(1) NOT NULL,
    tiene_baño_privado      CHAR(1) NOT NULL,
    tiene_calefaccion       CHAR(1) NOT NULL,
    cantidad_camas          NUMBER(2) NOT NULL
);

--Añadir la PK a la Tabla Clientes
ALTER TABLE Clientes ADD CONSTRAINT cliente_PK PRIMARY KEY (rut_cliente);

-- Añadir la PK a la tabla Comunas
ALTER TABLE Comunas ADD CONSTRAINT comuna_PK PRIMARY KEY (id_comuna);

-- Añadir la PK a la tabla Provincia
ALTER TABLE Provincias ADD CONSTRAINT provincia_PK PRIMARY KEY (id_provincia);

-- Añadir la PK a la tabla Region
ALTER TABLE Regiones ADD CONSTRAINT region_PK PRIMARY KEY (id_region);

-- Añadir la PK a la tabla Sector
ALTER TABLE Sector ADD CONSTRAINT sector_PK PRIMARY KEY (id_sector);

-- Añadir la PK a la tabla Parque
ALTER TABLE Parques ADD CONSTRAINT parque_PK PRIMARY KEY (id_parque);

-- Añadir la PK a la tabla Acompañante
ALTER TABLE Acompanantes ADD CONSTRAINT acompanante_PK PRIMARY KEY (rut_acompanante);

-- Añadir la PK a la tabla Acompañante
ALTER TABLE Reservas ADD CONSTRAINT reservas_PK PRIMARY KEY (numero_reserva);

-- Añadir la PK a la tabla Reservas_acompanantes
    -- Cuando hay más de una PK se indican entre los parentesis cuales son aquellas columnas
    -- de las tablas que corresponden a las PKs de esa tabla
ALTER TABLE Reservas_acompanantes ADD CONSTRAINT reservas_acompanantes_PK PRIMARY KEY (numero_reserva, rut_acompanante);

-- Añadir la PK a la tabla Descuentos
    -- Acá te fallaba porque ya existe el nombre reservas_PK, lo indicaste en la tabla Acompañante
    -- deben tener nombre unico, lo cambiare por descuento_PK y no fallará
ALTER TABLE Descuentos ADD CONSTRAINT descuentos_PK PRIMARY KEY (id_descuento);

-- Añadir la PK a la tabla Servicios
ALTER TABLE Servicios ADD CONSTRAINT servicios_PK PRIMARY KEY (id_servicio);

-- Añadir la PK a la tabla Detalle_Servicio
ALTER TABLE Detalle_Servicio ADD CONSTRAINT detalle_servicio_PK PRIMARY KEY (id_detalle);

-- Añadir la PK a la tabla Habitaciones
ALTER TABLE Habitaciones ADD CONSTRAINT Habitaciones_PK PRIMARY KEY (id_habitacion);

-- Añadir la PK a la tabla Servicios
ALTER TABLE Domos ADD CONSTRAINT domos_PK PRIMARY KEY (id_habitacion);

-- Añadir la PK a la tabla Servicios
ALTER TABLE Cabanas ADD CONSTRAINT cabanas_PK PRIMARY KEY (id_habitacion);


-- TODAS LAS CLAVES FORANEAS o FK 
    -- usar nombretabla_nombrecoluma_fk para evitar errores
    -- recordar usar nombres unicos para las claves foraneas

-- Añadir la Clave Foranea o FK a la tabla Clientes
ALTER TABLE Clientes ADD CONSTRAINT cliente_comuna_FK FOREIGN KEY (comuna_id) 
    REFERENCES Comunas (id_comuna);

-- Añadir la Clave Foranea o FK a la tabla Comunas
ALTER TABLE Comunas ADD CONSTRAINT comuna_provincia_FK FOREIGN KEY (provincia_id) 
    REFERENCES Provincias (id_provincia);

-- Añadir la Clave Foranea o FK a la tabla Provincias
ALTER TABLE Provincias ADD CONSTRAINT provincia_region_FK FOREIGN KEY (region_id) 
    REFERENCES Regiones (id_region);

-- Añadir la Clave Foranea o FK a la tabla Sector
ALTER TABLE Sector ADD CONSTRAINT sector_parque_FK FOREIGN KEY (parque_id) 
    REFERENCES Parques (id_parque);

-- Añadir la Clave Foranea o FK a la tabla Reservas_acompanantes
ALTER TABLE Reservas_acompanantes ADD CONSTRAINT reserva_acompanante_reserva_FK FOREIGN KEY (numero_reserva) 
    REFERENCES Reservas (numero_reserva);

-- Añadir la Clave Foranea o FK a la tabla Reservas_acompanantes
ALTER TABLE Reservas_acompanantes ADD CONSTRAINT reserva_acompanante_FK FOREIGN KEY (rut_acompanante) 
    REFERENCES Acompanantes (rut_acompanante);

-- Añadir la Clave Foranea o FK a la tabla Reservas
ALTER TABLE Reservas ADD CONSTRAINT reserva_cliente_FK FOREIGN KEY (rut_cliente) 
    REFERENCES Clientes (rut_cliente);

-- Añadir la Clave Foranea o FK a la tabla Reservas
ALTER TABLE Reservas ADD CONSTRAINT reserva_descuento_FK FOREIGN KEY (descuento_id) 
    REFERENCES Descuentos (id_descuento);

-- Añadir la Clave Foranea o FK a la tabla Reservas
ALTER TABLE Reservas ADD CONSTRAINT reserva_habitacion_FK FOREIGN KEY (habitacion_id) 
    REFERENCES Habitaciones (id_habitacion);

-- Añadir la Clave Foranea o FK a la tabla Reservas
ALTER TABLE Reservas ADD CONSTRAINT acompanante_parque_FK FOREIGN KEY (parque_id) 
    REFERENCES Parques (id_parque);

-- Añadir la Clave Foranea o FK a la tabla Detalle Servicio
ALTER TABLE Detalle_Servicio ADD CONSTRAINT detalle_servicio_servicio_FK FOREIGN KEY (servicio_id) 
    REFERENCES Servicios (id_servicio);

-- Añadir la Clave Foranea o FK a la tabla Detalle Servicio
ALTER TABLE Detalle_Servicio ADD CONSTRAINT detalle_servicio_reserva_FK FOREIGN KEY (reserva_id) 
    REFERENCES Reservas (numero_reserva);

-- Añadir la Clave Foranea o FK a la tabla Detalle Servicio
ALTER TABLE Detalle_Servicio ADD CONSTRAINT detalle_servicio_cliente_FK FOREIGN KEY (rut_cliente) 
    REFERENCES Clientes (rut_cliente);

-- Esto estaba errado a la tabla que apuntabas, revisa la version anterior de lo que tenias tú y compara con esta modificación
-- Añadir la Clave Foranea o FK a la tabla Domo
ALTER TABLE Domos ADD CONSTRAINT reserva_parque_FK FOREIGN KEY (id_habitacion) 
    REFERENCES Habitaciones (id_habitacion);

-- Añadir la Clave Foranea o FK a la tabla Cabaña
ALTER TABLE Cabanas ADD CONSTRAINT acompanante_reserva_FK FOREIGN KEY (id_habitacion) 
    REFERENCES Habitaciones (id_habitacion);
