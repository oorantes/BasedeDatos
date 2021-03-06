--PROYECTO FINAL BASES DE DATOS I

--TABLA DE PERMISOS
CREATE TABLE PERMISO(
ID_PERMISO NUMERIC(10),
DESCRIPCION VARCHAR(30),
CONSTRAINT PK_PERMISO PRIMARY KEY (ID_PERMISO)
);

--SECUENCIA DE PERMISO
CREATE SEQUENCE seq_PERMISO_dtls
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
CREATE TRIGGER trg_PERMISO_dtls
BEFORE INSERT OR UPDATE ON PERMISO
FOR EACH ROW
BEGIN
   :NEW.ID_PERMISO := seq_PERMISO_dtls.NextVal;
END;

--TABLA DE ROL
CREATE TABLE ROL(
ID_ROL NUMERIC(10),
DESCRIPCION VARCHAR(30),
CONSTRAINT PK_ROL PRIMARY KEY (ID_ROL)
);

--SECUENCIA DE PERMISO
CREATE SEQUENCE seq_ROL_dtls
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
CREATE TRIGGER trg_ROL_dtls
BEFORE INSERT OR UPDATE ON ROL
FOR EACH ROW
BEGIN
   :NEW.ID_ROL := seq_ROL_dtls.NextVal;
END;

--TABLA DE PERMISOS X ROL
CREATE TABLE PERMISOS_X_ROL(
ID_PXR NUMERIC(10),
ID_ROL NUMERIC(10),
ID_PERMISO NUMERIC(10),
HABILITADO NUMERIC(1),
DESCRIPCION VARCHAR2(30),
CONSTRAINT PK_PXR PRIMARY KEY (ID_PXR)
);

--SECUENCIA DE PERMISO POR ROL
CREATE SEQUENCE seq_PXR_dtls
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
CREATE TRIGGER trg_PXR_dtls
BEFORE INSERT OR UPDATE ON PERMISOS_X_ROL
FOR EACH ROW
BEGIN
   :NEW.ID_PXR := seq_PXR_dtls.NextVal;
END;

--TABLA DE SEDES
CREATE TABLE SEDE(
ID_SEDE NUMBER(10,0),
NOMBRE VARCHAR2(30),
DIRECCION VARCHAR2(100),
TELEFONO VARCHAR2(30),
EMAIL VARCHAR2(30),
ESTADO NUMBER(10,0),
CONSTRAINT PK_ID_SEDE PRIMARY KEY (ID_SEDE)
);

--SECUENCIA DE SEDE
CREATE SEQUENCE seq_SEDE_dtls
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
CREATE TRIGGER trg_SEDE_dtls
BEFORE INSERT OR UPDATE ON SEDE
FOR EACH ROW
BEGIN
   :NEW.ID_SEDE := seq_SEDE_dtls.NextVal;
END;

--TABLA DE USUARIOS
CREATE TABLE USUARIO(
ID_USUARIO NUMBER(10,0),
USERNAME VARCHAR(20),
PASSWORD VARCHAR(100),
NOMBRES VARCHAR(30),
APELLIDOS VARCHAR(30),
IDENTIFICACION VARCHAR(30),
GENERO VARCHAR(10),
FECHA_NACIMIENTO  DATE,
ID_SEDE NUMERIC,
ID_ROL NUMERIC,
ESTADO NUMERIC,
CONSTRAINT PK_ID_USUARIO PRIMARY KEY (ID_USUARIO)
)

CREATE SEQUENCE seq_USUARIO_dtls
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
CREATE TRIGGER trg_usuario_dtls
BEFORE INSERT OR UPDATE ON USUARIO
FOR EACH ROW
BEGIN
   :NEW.id_usuario := seq_usuario_dtls.NextVal;
END;


--BITACORA
CREATE TABLE BITACORA(
ID_LOG NUMERIC(10),
ID_USUARIO NUMERIC(10),
FECHA_HORA DATE,
DESCRIPCION VARCHAR2(30),
TIPO_ACCION NUMERIC(10),
CONSTRAINT PK_ID_LOG PRIMARY KEY (ID_LOG)
);

--SECUENCIA DE PERMISO
CREATE SEQUENCE seq_BITACORA_dtls
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
CREATE TRIGGER trg_BITACORA_dtls
BEFORE INSERT OR UPDATE ON BITACORA
FOR EACH ROW
BEGIN
   :NEW.ID_LOG := seq_BITACORA_dtls.NextVal;
END;

SELECT * FROM USUARIO;
SELECT * FROM ROL;
SELECT * FROM PERMISO;
SELECT * FROM PERMISOS_X_ROL;
SELECT * FROM BITACORA;
SELECT * FROM SEDE;

select * from usuario;
insert into usuario(username,password,nombres,apellidos,identificacion,genero,fecha_nacimiento,id_sede,id_rol,estado) values ('prueba','prueba','nombres','apellidos','dpi','M','01/01/1993',1,1,1);
INSERT INTO PERMISO(Descripcion) VALUES('BODEGA');
INSERT INTO PERMISO(Descripcion) VALUES('CAJA');
INSERT INTO PERMISO(Descripcion) VALUES('USUARIO');
INSERT INTO PERMISO(Descripcion) VALUES('CITAS');
INSERT INTO PERMISO(Descripcion) VALUES('EXPEDIENTES');
INSERT INTO PERMISO(Descripcion) VALUES('FARMACIA');
INSERT INTO PERMISO(Descripcion) VALUES('ROLES');
INSERT INTO PERMISO(Descripcion) VALUES('PROVEEDORES');
INSERT INTO PERMISO(Descripcion) VALUES('FACTURACION');
INSERT INTO PERMISO(Descripcion) VALUES('ODONTOLOGIA');

SELECT * FROM PERMISO
