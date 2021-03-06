DROP DATABASE IF EXISTS BD_LP;
CREATE DATABASE BD_LP;
USE BD_LP;

CREATE TABLE PERSONA(
	COD_PERSONA		CHAR(4) 	NOT NULL	PRIMARY KEY,
    NOM_PERSONA		VARCHAR(30)	NOT NULL,
    APEP_PERSONA	VARCHAR(30)	NOT NULL,
    APEM_PERSONA	VARCHAR(30)	NOT NULL,
    DNI_PERSONA		CHAR(8)		NOT NULL,
    SEX_PERSONA		VARCHAR(12)	NOT NULL,
    TEL_PERSONA		CHAR(9)		NOT NULL,
    ID_TIPO			INT			NOT NULL,
    PASS_PERSONA	VARCHAR(15)	NOT NULL,
    ESTADO_PERSONA	INT DEFAULT 1,
    FOREIGN KEY (ID_TIPO) REFERENCES TIPO_PERSONA(ID_TIPO)
)
;

CREATE TABLE TIPO_PERSONA(
	ID_TIPO 	INT PRIMARY KEY,
    DES_TIPO 	VARCHAR(30)
)
;

CREATE TABLE TRABAJO(
	COD_TRABAJO		CHAR(5)			NOT NULL	PRIMARY KEY,
    DESC_TRABAJO	VARCHAR(40)		NOT NULL,
    FEC_ING_TRABAJO	DATE			NOT NULL
)
;

CREATE TABLE CLIENTE(
	COD_CLIENTE			CHAR(5)		NOT NULL	PRIMARY KEY,
    RAZ_SOC_CLIENTE		VARCHAR(50)	NOT NULL,
    NOM_CONT_CLIENTE	VARCHAR(40)	NOT NULL,
    DIR_CLIENTE			VARCHAR(40)	NOT NULL,
    CIU_CLIENTE			VARCHAR(30)	NOT NULL,
    TEL_CLIENTE			CHAR(9)			NOT NULL,
    TIPO_CLIENTE		VARCHAR(30)	NOT NULL,
    RUC_CLIENTE			CHAR(11)	NOT NULL
)
;

CREATE TABLE SOLICITUD(
	NUM_SOLICITUD		CHAR(8)			NOT NULL	PRIMARY KEY,
    FEC_ING_SOLICITUD	DATE			NOT NULL,
	COD_PERSONA			CHAR(4)			NOT NULL,
    COD_CLIENTE			CHAR(5)			NOT NULL,
    EST_SOLICITUD		VARCHAR(15)		NOT NULL,
    FOREIGN KEY	(COD_PERSONA) 	REFERENCES PERSONA(COD_PERSONA),
    FOREIGN KEY (COD_CLIENTE)	REFERENCES CLIENTE(COD_CLIENTE)
)
;

CREATE TABLE PROYECTO(
	NUM_PROYECTO 		CHAR(8)			NOT NULL	PRIMARY KEY,
    FEC_ING_PROYECTO	DATE			NOT NULL,
    FECH_ACT_PROYECTO	DATE			NOT NULL,
    NUM_SOLICITUD		CHAR(8)			NOT NULL, 
    COD_PERSONA			CHAR(4)			NOT NULL,
    COD_TRABAJO			CHAR(5)			NOT NULL,
    COS_PROYECTO		DECIMAL(10,2)	NOT NULL,
    MONTO_TOT_PROYECTO	DECIMAL(10,2)	NOT NULL,
    PER_PROYECTO		VARCHAR(20)		NOT NULL,
    ETA_PROYECTO		VARCHAR(15)		NOT NULL,
    FOREIGN KEY	(NUM_SOLICITUD)	REFERENCES SOLICITUD(NUM_SOLICITUD),
    FOREIGN KEY	(COD_PERSONA)	REFERENCES PERSONA(COD_PERSONA),
    FOREIGN KEY	(COD_TRABAJO)	REFERENCES TRABAJO(COD_TRABAJO)
)
;

CREATE TABLE DETALLE_PROYECTO(
	NUM_PROYECTO 		CHAR(8)			NOT NULL,
    COD_PERSONA			CHAR(4) 		NOT NULL,
    BONIFICACION		DECIMAL(10,2)	NOT NULL,
    FOREIGN KEY	(NUM_PROYECTO)	REFERENCES PROYECTO(NUM_PROYECTO),
    FOREIGN KEY	(COD_PERSONA)	REFERENCES PERSONA(COD_PERSONA)
)
;