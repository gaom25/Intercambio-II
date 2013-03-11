DROP SCHEMA "dycicle" CASCADE;

CREATE SCHEMA "dycicle"
  AUTHORIZATION postgres;
GRANT ALL ON SCHEMA "dycicle" TO postgres;

/* Entidad principal USUARIO necesaria para acceder al sistema */
CREATE TABLE "dycicle".USUARIO(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Email		VARCHAR(30)	NOT NULL,
	Privilegio	NUMERIC(2)	NOT NULL,
	Nombre		VARCHAR(100)	NOT NULL,
	Contrasena	VARCHAR(30)	NOT NULL,
    FechaCreacion	timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT 	PK_Usuario	PRIMARY KEY (NombreUsuario)
)
WITH (
OIDS = FALSE
);

/* Entidad ESTUDIANTE la cual contiene todos los datos
 * correspondientes  a este tipo de usuario necesarios
 * para  postularse  a  un  intercambio             */
CREATE TABLE "dycicle".ESTUDIANTE(
	NombreUsuario	VARCHAR(20)	NOT NULL,
    Origen          VARCHAR(50),
 	PrimerNombre 	VARCHAR(30)	NOT NULL,
    SegundoNombre 	VARCHAR(30),
	PrimerApellido	VARCHAR(30)	NOT NULL,
    SegundoApellido	VARCHAR(30),
    Carrera         VARCHAR(30),
    CodCarrera      NUMERIC(4),
 	Sexo		    VARCHAR(10),
    Urbanizacion    VARCHAR(30), /*O sector o barrio*/
    Calle           VARCHAR(30),
    Edificio        VARCHAR(30), /*O numero de casa*/
    Apartamento     VARCHAR(20),
    Ciudad          VARCHAR(30),
    Estado          VARCHAR(30),
    CodPostal       VARCHAR(30),
	TelefonoCel	VARCHAR(30),
	TelefonoCasa	VARCHAR(30),
	Fax		VARCHAR(30),
    Email           VARCHAR(30),
	FechaNac	VARCHAR(40),
    Nacionalidad    VARCHAR(100),
	Comentario	TEXT,
	CONSTRAINT	PK_Estudiante	PRIMARY KEY (NombreUsuario)
)
WITH (
OIDS = FALSE
);

/* En esta tabla se tienen todos los datos particulares
 * de  los  estudiantes  que  pertenecen  a  la  USB */
CREATE TABLE "dycicle".EstudianteUSB(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Cedula		VARCHAR(10)	,
	Carnet		VARCHAR(10)	,
	CONSTRAINT	PK_EstudianteUSB	
		PRIMARY KEY (NombreUsuario, Cedula, Carnet)
);

/* En esta tabla se tienen todos los datos particulares
 * de  los  estudiantes  internacionales             */
CREATE TABLE "dycicle".EstudianteInternacional(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Pasaporte	VARCHAR(100)	NOT NULL,
	LenguaMaterna	VARCHAR(40)	NOT NULL,
        PaisOrigen      VARCHAR(100)    NOT NULL,
        UniOrigen       VARCHAR(100)    NOT NULL,
        CursoEspaniol   VARCHAR(4)      NOT NULL,     
	CONSTRAINT	PK_EstudianteInternacional	
		PRIMARY KEY (NombreUsuario, Pasaporte)
);

/* En esta tabla se tienen todos los datos referentes
 * a  los  archivos  de  los  estudiantes  USB     */
CREATE TABLE "dycicle".ArchivosEstudiante(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Nombre		VARCHAR(30)	NOT NULL,	
	Direccion	VARCHAR(200)	NOT NULL,
	Extension	VARCHAR(10)	NOT NULL,
	Tamanio		VARCHAR(30)	NOT NULL,
	CONSTRAINT	PK_ArchivosEstudiante	
		PRIMARY KEY (NombreUsuario, Nombre)
);

/* En esta tabla se almacena la relacion de los estudiantes con
 * los archivos que han cargado al sistema */

CREATE TABLE "dycicle".Carga(
    NombreUsuario	VARCHAR(20)	NOT NULL,	
	Nombre		VARCHAR(30)	NOT NULL,
        CONSTRAINT	PK_Carga	
		PRIMARY KEY (NombreUsuario, Nombre)
);

/* En esta tabla se tienen todos los datos correspondientes
 * al  antecedente  academico  de  cada  estudiante      */
CREATE TABLE "dycicle".AntecedenteAcademico(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Indice		NUMERIC(5,4),
        IndicePonderado NUMERIC(5,4),
        Decanato        VARCHAR(50),
        AreaDeEstudio   VARCHAR(100)    NOT NULL,
	Carrera		VARCHAR(30)	NOT NULL,
        Opcion          VARCHAR(30)     NOT NULL,
        CredAprob       NUMERIC(4),
        AnioIngreso     NUMERIC(4),
        AniosAprob      NUMERIC(2),
        CoordMovilidad  VARCHAR(100),
        CoordAcademico  VARCHAR(100),
	CONSTRAINT	PK_AntecedenteAcademico	
		PRIMARY KEY (NombreUsuario)
);

/* En esta tabla se tienen todos los datos correspondientes
 * al  plan  de  estudios  de  cada  estudiante          */
CREATE TABLE "dycicle".PlanEstudio(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	CodigoUSB	VARCHAR(10)	NOT NULL,
	MateriaUSB	VARCHAR(50)	NOT NULL,
	CreditoUSB	INT     	NOT NULL,
	CodigoUniv	VARCHAR(10)	NOT NULL,
	MateriaUniv	VARCHAR(50)	NOT NULL,
    CreditoUniv     INT             NOT NULL,
	CONSTRAINT	PK_PlanEstudio	
		PRIMARY KEY (NombreUsuario,CodigoUSB)
);

/* En  esta  tabla  se  tienen  todos los datos necesarios
 * de los representantes de un estudiante en particular */
CREATE TABLE "dycicle".REPRESENTANTE(
       NombreUsuario   VARCHAR(20)     NOT NULL,
       pNombre         VARCHAR(30)     NOT NULL,
       sNombre         VARCHAR(30),
       pApellido       VARCHAR(30)     NOT NULL,
       sApellido       VARCHAR(30),
       TelefonoCel     VARCHAR(30)     NOT NULL,
       TelefonoHab     VARCHAR(30),
       EmailRep        VARCHAR(30)     NOT NULL,
       TipoRelacion    VARCHAR(30)     NOT NULL,
       Direccion       VARCHAR(140)    NOT NULL,
       CONSTRAINT        PK_REPRESENTANTE
               PRIMARY KEY (NombreUsuario)
);

/* Tabla que almacena la forma de financiamiento de un estudiante  */
CREATE TABLE "dycicle".FINANCIAMIENTO(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	PpalFuente      VARCHAR(30)     NOT NULL,
    DescrFuente     TEXT,
    TieneBecaDe     VARCHAR(30)     NOT NULL,
    DescrBeca       TEXT,
	CONSTRAINT	PK_FINANCIAMIENTO
		PRIMARY KEY (NombreUsuario,PpalFuente)
);

/* Tabla que almacena los administradores del sistema */
CREATE TABLE "dycicle".ADMINISTRADOR(
        NombreUsuario   VARCHAR(20)     NOT NULL,
        CONSTRAINT      PK_ADMINISTRADOR
                PRIMARY KEY(NombreUsuario)
);

/* Registro previo que realiza un visitante, para que luego el
 * administrador  le  cree  una  cuenta  como  Usuario      */
CREATE TABLE "dycicle".PREREGISTRO(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Email		VARCHAR(30)	NOT NULL,
	Nombre		VARCHAR(100)	NOT NULL,
	Contrasena	VARCHAR(30)	NOT NULL,
        FechaCreacion	timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT 	PK_PreUsuario	PRIMARY KEY (NombreUsuario)
)
WITH (
OIDS = FALSE
);

/*Relacion que guarda el administrador con los preregistros que aprueba*/
CREATE TABLE "dycicle".Aprueba(
        NombreUsuarioAdmin  VARCHAR(20)    NOT NULL,
        NombreUsuarioPreReg VARCHAR(20)    NOT NULL,
        CONSTRAINT          PK_Aprueba PRIMARY KEY(NombreUsuarioAdmin, NombreUsuarioPreReg)      
);

/* Tabla almacena las noticias publicadas por un 
 * gestor ,  asi  como  sus  modificaciones   */
CREATE TABLE "dycicle".NOTICIAS(
	Nombre		VARCHAR(30)	NOT NULL,
	Fecha		DATE		NOT NULL,
	Informacion	TEXT		NOT NULL,
	CONSTRAINT	PK_NOTICIAS
		PRIMARY KEY (Nombre, Fecha)
);

/* Tabla que guarda las relaciones existentes entre los
 * gestores   y  las  noticias  que  han  gestionado */
CREATE TABLE "dycicle".Maneja(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Nombre		VARCHAR(30)	NOT NULL,
	Fecha		DATE		NOT NULL,
	CONSTRAINT	PK_Maneja
		PRIMARY KEY (NombreUsuario,Nombre, Fecha)
);	

/* Entidad POSTULANTE la cual comprende  las coordinaciones
 * y universidades extranjeras. En esta tabla se encuentran
 * todos  los  datos  pertenecientes  al  postulante     */
CREATE TABLE "dycicle".POSTULANTE(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Codigo		VARCHAR(50)	NOT NULL,
	Tipo		VARCHAR(50)	NOT NULL,
        NombreUniExt    VARCHAR(50),      
	NombreCarrera	VARCHAR(50),
	CONSTRAINT	PK_Postulante	
            PRIMARY KEY (NombreUsuario, Codigo)
)
WITH (
OIDS = FALSE
);

/* Un postulante puede postular a un estudiante */
CREATE TABLE "dycicle".Postula(
	NombreUsuarioPostulante	VARCHAR(20)	NOT NULL,
	CodigoPostulante	VARCHAR(30)	NOT NULL,
	NombreUsuarioEstudiante	VARCHAR(20)	NOT NULL,
	CONSTRAINT		PK_Postula	PRIMARY KEY (NombreUsuarioPostulante, CodigoPostulante, NombreUsuarioEstudiante)
)
WITH (
OIDS = FALSE
);

/* Entidad POSTULACION identificada por el usuario al que pertenece */
CREATE TABLE "dycicle".POSTULACION(
	NombreUsuario       VARCHAR(20)     NOT NULL,
	EstadoPostulacion   VARCHAR(30)     NOT NULL,
        Recomendacion       VARCHAR(30)     NOT NULL,
        ComentRecomend      TEXT,
        FechaCreacion       timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT          PK_Postulacion	PRIMARY KEY (NombreUsuario)
)
WITH (
OIDS = FALSE
);

/* Entidad GESTOR la cual comprende la DRIC y decanatos
 * En  esta  tabla  se   encuentran  todos  los   datos
 * pertenecientes   al   gestor                      */
CREATE TABLE "dycicle".GESTOR(
	NombreUsuario	VARCHAR(20)	NOT NULL,
        Nombre          VARCHAR(100)     NOT NULL,
	CONSTRAINT	PK_GESTOR	PRIMARY KEY (NombreUsuario)
)
WITH (
OIDS = FALSE
);

/* Un usuario puede enviarle una notificacion a otro usuario */
CREATE TABLE "dycicle".Notificar(
	Nom_Emisor	VARCHAR(20)	NOT NULL,
	Nom_Dest	VARCHAR(20)	NOT NULL,
        Fecha           timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
        Asunto          VARCHAR(30)     NOT NULL,
	CONSTRAINT	PK_Notificar	PRIMARY KEY (Nom_Emisor, Nom_Dest)
)
WITH (
OIDS = FALSE
);

 CREATE TABLE "dycicle".Universidades(
       NombreUsuario   VARCHAR(20)     NOT NULL,
       Prioridad       NUMERIC(1)      NOT NULL,
       NombreUni       VARCHAR(100)    NOT NULL,
       Pais            VARCHAR(100)    NOT NULL,
       TipoPrograma    VARCHAR(100)    NOT NULL,
       NombrePrograma  VARCHAR(100)    NOT NULL,
       MesFechaIni     VARCHAR(12),
       AnioFechaIni    VARCHAR(6),
       MesFechaFin     VARCHAR(12),
       AnioFechaFin    VARCHAR(6),
       Duracion        VARCHAR(15)     NOT NULL,
       CONSTRAINT      PK_Universidades    PRIMARY KEY (NombreUsuario, NombreUni)
)
WITH(
OIDS = FALSE
);

/* Un gestor puede gestionar/editar una postulacion */
CREATE TABLE "dycicle".Gestiona(
	NombreUsuarioGestor	VARCHAR(20)	NOT NULL,
	NombreUsuarioEstudiante	VARCHAR(20)	NOT NULL,
	Cambio		VARCHAR(100)	NOT NULL,
	CONSTRAINT 	PK_Gestiona	PRIMARY KEY (NombreUsuarioGestor, NombreUsuarioEstudiante)
)
WITH (
OIDS = FALSE
);

/* Un usuario puede acceder al log de auditoria */
CREATE TABLE "dycicle".LogAuditoria(
        Hora		TIME		NOT NULL,
	Accion		VARCHAR(100)	NOT NULL,
        Fecha   	timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT	PK_LogAuditoria	PRIMARY KEY (Fecha, Hora, Accion)
)
WITH (
OIDS = FALSE
);

/* Cada accion que realice un usuario, persiste en el log */
CREATE TABLE "dycicle".Persiste(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Hora		TIME		NOT NULL,
	Accion		VARCHAR(100)	NOT NULL,
        Fecha		timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT	PK_Persiste	PRIMARY KEY (NombreUsuario, Fecha, Hora, Accion)
)
WITH (
OIDS = FALSE
);

/* Entidad IDIOMAS la cual contiene, para cada idioma,
 * el nombre del idioma  y  su nivel tanto verbal como
 * escrito                                          */
CREATE TABLE "dycicle".IDIOMAS(
        NombreUsuario   VARCHAR(20)     NOT NULL,
	NombreIdioma	VARCHAR(30)	NOT NULL,
	NivelVerbal	VARCHAR(15)	NOT NULL,
	NivelEscrito	VARCHAR(15)	NOT NULL,
        NivelConversacional VARCHAR(15) NOT NULL,
	CONSTRAINT 	PK_IDIOMAS	PRIMARY KEY (NombreUsuario,NombreIdioma)
)
WITH (
OIDS = FALSE
);

-------------------------------------------------------------
----------------------RESTRICCIONES--------------------------
-------------------------------------------------------------

-------------------------USUARIO---------------------------------
/* Rango de los Privilegios */
ALTER TABLE "dycicle".USUARIO  ADD
  CHECK ((0 < Privilegio) AND (Privilegio < 7));

/* Longitud de contrasena mayor a 6 caracteres para un usuario*/
ALTER TABLE "dycicle".USUARIO ADD
  CHECK (char_length(Contrasena) > 5);

/* El email de un usuario debe contener un @ */
ALTER TABLE "dycicle".USUARIO ADD
  CHECK (Email ~~ '%@%');

-------------------------ESTUDIANTE--------------------------------
/* Claves foraneas de ESTUDIANTE a USUARIO */
ALTER TABLE "dycicle".ESTUDIANTE ADD
  CONSTRAINT FK_Estudiante_Usuario FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".USUARIO;

----------------------ESTUDIANTE USB--------------------------------- 
/* Claves foraneas de EstudianteUSB */
ALTER TABLE "dycicle".EstudianteUSB ADD
  CONSTRAINT FK_EstudianteUSB_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".ESTUDIANTE;

---------------------ESTUDIANTE Internacional---------------------------
/*Las opciones sobre tomar un curso de español son Si o No 
ALTER TABLE "dycicle".EstudianteInternacional ADD
  CHECK (CursoEspaniol ~~ 'Sí' OR CursoEspaniol ~~ 'No')*/

/* Claves foraneas de EstudianteInternacional */
ALTER TABLE "dycicle".EstudianteInternacional ADD
  CONSTRAINT FK_EstudianteInternacional_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante;

------------------------Archivos estudiante------------------------------
/* Claves foraneas de ArchivosEstudiante */
ALTER TABLE "dycicle".ArchivosEstudiante ADD
  CONSTRAINT FK_ArchivosEstudiante_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante;  

------------------------------Carga-------------------------------------
/* Claves foraneas de Carga*/
ALTER TABLE "dycicle".Carga ADD
  CONSTRAINT FK_Carga_Archivo FOREIGN KEY (NombreUsuario, Nombre)
    REFERENCES "dycicle".ArchivosEstudiante;
  
----------------------ANTECEDENTE ACADEMICO-----------------------------
/* El indice debe estar entre 1 y 5 */
ALTER TABLE "dycicle".AntecedenteAcademico ADD
  CHECK ((1.0000 <= Indice) AND (Indice <= 5.0000));

/* El indice ponderado es un numero positivo */
ALTER TABLE "dycicle".AntecedenteAcademico ADD
  CHECK (IndicePonderado >= 0.0000);

/* La cantidad de creditos aprobados es mayor que 0 */
ALTER TABLE "dycicle".AntecedenteAcademico ADD
  CHECK (CredAprob >= 0);

/*La cantidad de años aprobados debe ser mayor que cero*/
ALTER TABLE "dycicle".AntecedenteAcademico ADD
    CHECK (AniosAprob >= 0);

/* Claves foraneas de AntecedenteAcademico */
ALTER TABLE "dycicle".AntecedenteAcademico ADD
  CONSTRAINT FK_AntecedenteAcademico_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante;
    
--------------------------PLAN DE ESTUDIO------------------------------
/*La cantidad de creditos debe ser mayor que 0*/
ALTER TABLE "dycicle".PlanEstudio ADD
  CHECK (CreditoUSB > 0);

ALTER TABLE "dycicle".PlanEstudio ADD
  CHECK (CreditoUniv > 0);

/* Claves foraneas de PlanEstudio */
ALTER TABLE "dycicle".PlanEstudio ADD
  CONSTRAINT FK_PlanEstudio_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante;    
  
----------------------------REPRESENTANTE------------------------------ 
/* El email de un representante debe contener un @ */
ALTER TABLE "dycicle".REPRESENTANTE ADD
  CHECK (EmailRep ~~ '%@%');

/* Claves foraneas de Representante */
ALTER TABLE "dycicle".Representante ADD
  CONSTRAINT FK_Representante_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante;

----------------------------FINANCIAMIENTO------------------------------    
/*Claves foraneas de Financiamiento */
ALTER TABLE "dycicle".FINANCIAMIENTO ADD
        CONSTRAINT FK_Financiamiento_Estudiante FOREIGN KEY (NombreUsuario)
                REFERENCES "dycicle".Estudiante;

----------------------------ADMINISTRADOR------------------------------
/*Claves foraneas de Administrador*/
ALTER TABLE "dycicle".ADMINISTRADOR ADD
        CONSTRAINT FK_ADMINISTRADOR_USUARIO FOREIGN KEY (NombreUsuario)
                REFERENCES "dycicle".USUARIO;   

----------------------------PREREGISTRO--------------------------------
/* Longitud de contrasena mayor a 6 caracteres para el preregistro*/
ALTER TABLE "dycicle".PREREGISTRO ADD
  CHECK (char_length(Contrasena) > 6);
  
----------------------------APRUEBA------------------------------
/*Claves foraneas de Aprueba*/
ALTER TABLE "dycicle".Aprueba ADD
        CONSTRAINT FK_Aprueba_Admin FOREIGN KEY (NombreUsuarioAdmin)
                REFERENCES "dycicle".ADMINISTRADOR(NombreUsuario);

ALTER TABLE "dycicle".Aprueba ADD
        CONSTRAINT FK_Aprueba_PreReg FOREIGN KEY (NombreUsuarioPreReg)
                REFERENCES "dycicle".Preregistro(NombreUsuario);

----------------------------MANEJA------------------------------
/* Claves foraneas de Maneja */
ALTER TABLE "dycicle".Maneja ADD
  CONSTRAINT FK_Maneja_USUARIO FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".ADMINISTRADOR;

ALTER TABLE "dycicle".Maneja ADD
  CONSTRAINT FK_Maneja_NOTICIAS FOREIGN KEY (Nombre, Fecha)
    REFERENCES "dycicle".NOTICIAS;
    
----------------------------POSTULANTE------------------------------
/* En POSTULANTE: Si Tipo=Coordinacion => NombreUniExt=NULL 
          Si Tipo=UnivExtranjera => NombreCarrera=NULL*/
ALTER TABLE "dycicle".POSTULANTE ADD
    CHECK ((Tipo='Coordinacion' AND NombreUniExt=NULL) OR
           (Tipo='UnivExtranjera' AND NombreCarrera=NULL));   

/* Claves foraneas de POSTULANTE */
ALTER TABLE "dycicle".POSTULANTE ADD
  CONSTRAINT FK_Postulante_Usuario FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".USUARIO;

-------------------------------POSTULA----------------------------------
/* Claves foraneas de Postula */
ALTER TABLE "dycicle".Postula ADD
  CONSTRAINT FK_Postula_Estudiante FOREIGN KEY (NombreUsuarioEstudiante)
    REFERENCES "dycicle".ESTUDIANTE (NombreUsuario);

ALTER TABLE "dycicle".Postula ADD
  CONSTRAINT FK_Postula_Postulante FOREIGN KEY (NombreUsuarioPostulante, CodigoPostulante)
    REFERENCES "dycicle".POSTULANTE (NombreUsuario, Codigo);

-----------------------------POSTULACION--------------------------------    
/*Claves foraneas de postulacion*/
ALTER TABLE "dycicle".POSTULACION ADD
  CONSTRAINT FK_Postulacion_Estudiante FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".Estudiante(NombreUsuario);
    
-----------------------------GESTOR----------------------------------
/* Claves foraneas de GESTOR */
ALTER TABLE "dycicle".GESTOR ADD
  CONSTRAINT FK_GESTOR_Usuario FOREIGN KEY (NombreUsuario)
    REFERENCES "dycicle".USUARIO;
    
-----------------------------NOTIFICAR--------------------------------    
/* Claves foraneas de Notificar */
ALTER TABLE "dycicle".Notificar ADD
  CONSTRAINT FK_Notificar_UsuarioEmisor FOREIGN KEY (Nom_Emisor)
    REFERENCES "dycicle".USUARIO (NombreUsuario);

ALTER TABLE "dycicle".Notificar ADD
  CONSTRAINT FK_Notificar_UsuarioDestinatario FOREIGN KEY (Nom_Dest)
    REFERENCES "dycicle".USUARIO (NombreUsuario);
    
-----------------------------UNIVERSIDADES------------------------------
/*La prioridad de una universidad es 1 o 2 segun sea primera o segunda opcion*/
ALTER TABLE "dycicle".Universidades ADD
  CHECK (Prioridad = '1' OR Prioridad = '2');

/*El año de inicio tiene que ser menor o igual que el año de fin*/
ALTER TABLE "dycicle".Universidades ADD
  CHECK (AnioFechaIni <= AnioFechaFin);

/* Clave foranea de Universidades*/
ALTER TABLE "dycicle".Universidades ADD
       CONSTRAINT FK_Universidades_Estudiante FOREIGN KEY (NombreUsuario)
               REFERENCES "dycicle".ESTUDIANTE;

-------------------------------GESTIONA--------------------------------
/* Claves foraneas de Gestiona */
ALTER TABLE "dycicle".Gestiona ADD
  CONSTRAINT FK_Gestiona_GESTOR FOREIGN KEY (NombreUsuarioGestor)
    REFERENCES "dycicle".GESTOR(NombreUsuario);

ALTER TABLE "dycicle".Gestiona ADD
  CONSTRAINT FK_Gestiona_Postulacion FOREIGN KEY (NombreUsuarioEstudiante)
    REFERENCES "dycicle".POSTULACION(NombreUsuario);

-------------------------------PERSISTE--------------------------------
/* Claves foraneas de Persiste */
ALTER TABLE "dycicle".Persiste ADD
  CONSTRAINT FK_Persiste_LogAuditoria FOREIGN KEY (Fecha, Hora, Accion)
    REFERENCES "dycicle".LogAuditoria;

/* INSERT de un usuario administrador por defecto */
INSERT INTO "dycicle".USUARIO VALUES ( 'admin','email@gmail.com', 1, 'Administrador', 'admin1234');
INSERT INTO "dycicle".ADMINISTRADOR VALUES ('admin');
--
INSERT INTO "dycicle".USUARIO VALUES ( 'gestor','gestor@gmail.com', 2, 'Decanato', 'gestor1234');
INSERT INTO "dycicle".GESTOR VALUES ('gestor','Decanato de Estudios Profesionales');
--
INSERT INTO "dycicle".USUARIO VALUES ( 'materiales','@gmail.com', 3, 'Administrador', 'materiales1234');
INSERT INTO "dycicle".POSTULANTE VALUES ('materiales','1500','Coordinacion',null,'Ingenieria de Materiales');
INSERT INTO "dycicle".USUARIO VALUES ( 'computacion','email@gmail.com', 3, 'Computacion', 'computacion1234');
INSERT INTO "dycicle".POSTULANTE VALUES ('computacion','0800','Coordinacion',null,'Ingenieria de Computacion');
--
INSERT INTO "dycicle".USUARIO VALUES ( 'brahyam','brahyam@gmail.com', 5, 'Brahyam', 'brahyam1234');
INSERT INTO "dycicle".ESTUDIANTE VALUES ( 'brahyam',null,'Brahyam','Steffano','Meneses','Moreno','Ingenieria de Computacion',0800,'Masculino','La Candelaria','Este 7','Jamarco','11-B','Caracas','Distrito Capital','1010','04264603899','02125518367','02125518367','brahyam@gmail.com','30/12/1990','Venezolano',null);
INSERT INTO "dycicle".ESTUDIANTEUSB VALUES ( 'brahyam','19721013','08-10738');
INSERT INTO "dycicle".ANTECEDENTEACADEMICO VALUES ('brahyam','3.6575','3.9565','Estudios Profesionales','Ingenieria','Ingenieria de Computacion','opcion','160','2008','4','Alexander Ramirez','Soraya Abad');
INSERT INTO "dycicle".POSTULACION VALUES ('brahyam','En evaluacion','recomendacion','comentario','2013-03-09 09:58:11.53');
INSERT INTO "dycicle".PLANESTUDIO VALUES ('brahyam','CI-2525','Ingenieria de Software',4,'HJI878','Analisis Cuantico',5);
INSERT INTO "dycicle".REPRESENTANTE VALUES ('brahyam','Jorge','Luis','Meneses','Arriba','04166119360','02125518367','jorge@gmail.com','Familiar','La Candelaria');
INSERT INTO "dycicle".FINANCIAMIENTO VALUES ('brahyam','Familiar','Ganancias de mis padres','Ninguna','Ninguna');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('brahyam',1,'Universidad de Siegen','Alemania','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('brahyam',2,'Universidad de Stuttgart','Alemania','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'brahyam','Ingles','Experto','Experto','Experto');
--
INSERT INTO "dycicle".USUARIO VALUES ( 'andrea','andrea@gmail.com', 5, 'Andrea', 'andrea1234');
INSERT INTO "dycicle".ESTUDIANTE VALUES ( 'andrea',null,'Andrea','Carolina','Machado','Moreno','Ingenieria de Computacion',0800,'Femenino','Baruta','El Placer','Esmeralda','S/N','Caracas','Miranda','1010','04266783899','02120928367','02127768367','andrea@gmail.com','12/11/1990','Venezolano',null);
INSERT INTO "dycicle".ESTUDIANTEUSB VALUES ( 'andrea','20721013','08-10740');
INSERT INTO "dycicle".ANTECEDENTEACADEMICO VALUES ('andrea','3.8775','4.0094','Estudios Profesionales','Ingenieria','Ingenieria de Computacion','opcion','160','2008','4','Alexander Ramirez','Soraya Abad');
INSERT INTO "dycicle".POSTULACION VALUES ('andrea','En evaluacion','recomendacion','comentario','2013-03-09 09:58:11.53');
INSERT INTO "dycicle".PLANESTUDIO VALUES ('andrea','CI-2525','Ingenieria de Software',4,'HJI878','Analisis Cuantico',5);
INSERT INTO "dycicle".REPRESENTANTE VALUES ('andrea','Carlos','Alfonso','Rivas','Mendoza','04166119360','02125518367','carlos@gmail.com','Familiar','La Candelaria');
INSERT INTO "dycicle".FINANCIAMIENTO VALUES ('andrea','Familiar','Ganancias de mis padres','Ninguna','Ninguna');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('andrea',1,'Universidad Estadual de Campinas','Brazil','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('andrea',2,'Universidad del Valle','Colombia','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'andrea','Ingles','Experto','Experto','Experto');
--
INSERT INTO "dycicle".USUARIO VALUES ( 'sofia','sofia@gmail.com', 5, 'sofia', 'sofia1234');
INSERT INTO "dycicle".ESTUDIANTE VALUES ( 'sofia',null,'Sofia','Luisa','Vergara','Mendoza','Ingenieria de Materiales',1500,'Femenino','Baruta','Piedra Azul','Dolores','S/N','Caracas','Miranda','1010','04266783899','02120928367','02127768367','sofia@gmail.com','15/10/1993','Venezolano',null);
INSERT INTO "dycicle".ESTUDIANTEUSB VALUES ( 'sofia','20721013','08-10760');
INSERT INTO "dycicle".ANTECEDENTEACADEMICO VALUES ('sofia','3.3745','3.5094','Estudios Profesionales','Ingenieria','Ingenieria de Materiales','opcion','160','2008','4','Alexander Ramirez','Carlitos Machado');
INSERT INTO "dycicle".POSTULACION VALUES ('sofia','En evaluacion','recomendacion','comentario','2013-03-09 09:58:11.53');
INSERT INTO "dycicle".PLANESTUDIO VALUES ('sofia','MA-3425','Ingenieria de Materiales',4,'HJI878','Analisis Logico',5);
INSERT INTO "dycicle".REPRESENTANTE VALUES ('sofia','Sancho','Alfonso','Panzas','Mendoza','04146239360','02126513367','sancho@gmail.com','Familiar','La Candelaria');
INSERT INTO "dycicle".FINANCIAMIENTO VALUES ('sofia','Familiar','Ganancias de mis padres','Ninguna','Ninguna');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('sofia',1,'Universidad Nacional de Cuyo','Argentina','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('sofia',2,'Universidad Privada Santa Cruz de la Sierra','Bolivia','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'sofia','Frances','Experto','Experto','Experto');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'sofia','Chino','Experto','Experto','Experto');
--
INSERT INTO "dycicle".USUARIO VALUES ( 'sofia','sofia@gmail.com', 5, 'sofia', 'sofia1234');
INSERT INTO "dycicle".ESTUDIANTE VALUES ( 'sofia',null,'Sofia','Luisa','Vergara','Mendoza','Ingenieria de Materiales',1500,'Femenino','Baruta','Piedra Azul','Dolores','S/N','Caracas','Miranda','1010','04266783899','02120928367','02127768367','sofia@gmail.com','15/10/1993','Venezolano',null);
INSERT INTO "dycicle".ESTUDIANTEUSB VALUES ( 'sofia','20721013','08-10760');
INSERT INTO "dycicle".ANTECEDENTEACADEMICO VALUES ('sofia','3.3745','3.5094','Estudios Profesionales','Ingenieria','Ingenieria de Materiales','opcion','160','2008','4','Alexander Ramirez','Carlitos Machado');
INSERT INTO "dycicle".POSTULACION VALUES ('sofia','En evaluacion','recomendacion','comentario','2013-03-09 09:58:11.53');
INSERT INTO "dycicle".PLANESTUDIO VALUES ('sofia','MA-3425','Ingenieria de Materiales',4,'HJI878','Analisis Logico',5);
INSERT INTO "dycicle".REPRESENTANTE VALUES ('sofia','Sancho','Alfonso','Panzas','Mendoza','04146239360','02126513367','sancho@gmail.com','Familiar','La Candelaria');
INSERT INTO "dycicle".FINANCIAMIENTO VALUES ('sofia','Familiar','Ganancias de mis padres','Ninguna','Ninguna');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('sofia',1,'Universidad Nacional de Cuyo','Argentina','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('sofia',2,'Universidad Privada Santa Cruz de la Sierra','Bolivia','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'sofia','Frances','Experto','Experto','Experto');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'sofia','Chino','Experto','Experto','Experto');
--
INSERT INTO "dycicle".USUARIO VALUES ( 'daniel','daniel@gmail.com', 5, 'Daniel', 'daniel1234');
INSERT INTO "dycicle".ESTUDIANTE VALUES ( 'daniel',null,'Daniel','Enrique','Moussa','Anaya','Ingenieria Mecanica',0200,'Masculino','El Silencio','Av. Lecuna','Edif. Granados','S','Caracas','Distrito Capital','1010','04264030368','02124816135','02125518367','daniel@gmail.com','30/12/1990','Venezolano',null);
INSERT INTO "dycicle".ESTUDIANTEUSB VALUES ( 'daniel','20341098','08-87462');
INSERT INTO "dycicle".ANTECEDENTEACADEMICO VALUES ('daniel','3.2345','3.4232','Estudios Profesionales','Ingenieria','Ingenieria Mecanica','opcion','130','2008','4','Alexander Ramirez','Juvencio Perez');
INSERT INTO "dycicle".POSTULACION VALUES ('daniel','En evaluacion','recomendacion','comentario','2013-03-09 09:58:11.53');
INSERT INTO "dycicle".PLANESTUDIO VALUES ('daniel','JS-4322','Aplicacion de Materiales',4,'HY1212','Aplicacion de Materiales',5);
INSERT INTO "dycicle".REPRESENTANTE VALUES ('daniel','Jesus','Mauricio','Moussa','Anaya','04124762312','02123241242','jesus@gmail.com','Familiar','El Silencio');
INSERT INTO "dycicle".FINANCIAMIENTO VALUES ('daniel','Familiar','Ganancias de mis padres','Ninguna','Ninguna');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('daniel',1,'Universidad de Tohoku','Japon','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".UNIVERSIDADES VALUES ('daniel',2,'Universidad Tecnológica de Nagaoka','Japon','Intercambio','SMILE','Enero','2014','Enero','2015','Año Academico');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'daniel','Ingles','Medio','Medio','Medio');
INSERT INTO "dycicle".IDIOMAS VALUES ( 'daniel','Japones','Basico','Basico','Basico');
--












