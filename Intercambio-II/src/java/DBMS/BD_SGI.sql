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

/* Registro previo que realiza un visitante, para que luego el
 * administrador  le  cree  una  cuenta  como  Usuario      */
CREATE TABLE "dycicle".PREREGISTRO(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Email		VARCHAR(30)	NOT NULL,
	Privilegio	NUMERIC(2)	NOT NULL,
	Nombre		VARCHAR(100)	NOT NULL,
	Contrasena	VARCHAR(30)	NOT NULL,
        FechaCreacion	timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT 	PK_PreUsuario	PRIMARY KEY (NombreUsuario)
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
 	Nombres 	VARCHAR(30)	NOT NULL,
	Apellidos	VARCHAR(30)	NOT NULL,
        Carrera         VARCHAR(30),
        CodCarrera      NUMERIC(4),
 	Sexo		VARCHAR(10),
        Calle           VARCHAR(500),
        Ciudad          VARCHAR(30),
        Estado          VARCHAR(30),
        CodPostal       VARCHAR(30),
	TelefonoCel	VARCHAR(30),
	TelefonoCasa	VARCHAR(30),
	Fax		VARCHAR(30),
        Email           VARCHAR(30),
	FechaNac	DATE,
	Nacionalidad	VARCHAR(100),
	Foto		VARCHAR(200),
	CONSTRAINT	PK_Estudiante	PRIMARY KEY (NombreUsuario)

)
WITH (
OIDS = FALSE
);

/* En esta tabla se tienen todos los datos particulares
 * de  los  estudiantes  que  pertenecen  a  la  USB */
CREATE TABLE "dycicle".EstudianteUSB(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Cedula		VARCHAR(10)	UNIQUE,
	Carnet		VARCHAR(10)	UNIQUE,
	Pasaporte	VARCHAR(100)	UNIQUE,
	CONSTRAINT	PK_EstudianteUSB	
		PRIMARY KEY (NombreUsuario, Cedula, Carnet)
);

/* En esta tabla se tienen todos los datos referentes
 * a  los  archivos  de  los  estudiantes  USB     */
CREATE TABLE "dycicle".ArchivosEstudianteUSB(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Cedula		VARCHAR(10)	NOT NULL,
	Carnet		VARCHAR(10)	NOT NULL,
	Nombre		VARCHAR(30)	NOT NULL,	
	Direccion	VARCHAR(100)	NOT NULL,
	Extension	VARCHAR(10)	NOT NULL,
	Tamanio		VARCHAR(30)	NOT NULL,
	CONSTRAINT	PK_ArchivosEstudianteUSB	
		PRIMARY KEY (NombreUsuario, Direccion, Extension)
);

/* En esta tabla se tienen todos los datos particulares
 * de  los  estudiantes  internacionales             */
CREATE TABLE "dycicle".EstudianteInternacional(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Pasaporte	VARCHAR(100)	NOT NULL,
	LenguaMaterna	VARCHAR(40)	NOT NULL,
	CONSTRAINT	PK_EstudianteInternacional	
		PRIMARY KEY (NombreUsuario, Pasaporte)
);

/* En esta tabla se tienen todos los datos correspondientes
 * al  antecedente  academico  de  cada  estudiante      */
CREATE TABLE "dycicle".AntecedenteAcademico(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Indice		NUMERIC(5,4),
        TipoEstudiante  VARCHAR(30),
	Carrera		VARCHAR(30)	NOT NULL,
        Opcion          VARCHAR(30)     NOT NULL,
        CredAprob       NUMERIC(4)      NOT NULL,
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

/* En esta tabla se tienen todos los datos necesarios
 * para  la  planilla  del  estudiante  USB        */
CREATE TABLE "dycicle".PlanillaUSB(

        -- Datos Personales
        EstadoPostulacion  VARCHAR(20)  NOT NULL,
	NombreUsuario	VARCHAR(20)	UNIQUE NOT NULL,
        Periodo         VARCHAR(20)     NULL,
	Cedula		VARCHAR(10)     NULL,
	Carnet		VARCHAR(10)     NULL,
	Pasaporte	VARCHAR(50)     NULL,
	Nombre  	VARCHAR(100)    NULL,
	Apellido	VARCHAR(100)    NULL,
	Sexo		VARCHAR(10)     NULL,
        Calle           VARCHAR(200)    NULL,
        Ciudad          VARCHAR(100)    NULL,
        Estado          VARCHAR(100)    NULL,
        CodPostal       VARCHAR(100)    NULL,
	TelefonoCel	VARCHAR(100)    NULL,
	TelefonoCasa	VARCHAR(100)    NULL,
	Fax		VARCHAR(100)    NULL,
        Email           VARCHAR(100)    NULL,
	FechaNac	VARCHAR(100),
	Nacionalidad	VARCHAR(100),
 --	Foto		PATH,

        --Datos del representante.
	apellidoNombres	VARCHAR(100)    NULL,
	Telefono	VARCHAR(100)    NULL,
	EmailRep	VARCHAR(100)    NULL,
	TipoRelacion	VARCHAR(100)    NULL,
	Direccion	VARCHAR(140)    NULL,

        --Antecedentes Academicos.
	Indice		VARCHAR(10)     NULL,
--      TipoEstudiante VARCHAR(100),
	Carrera		VARCHAR(100)    NULL,
        Opcion          VARCHAR(100)    NULL,
        CredAprob       VARCHAR(5)      NULL,

        --Plan de estudio.
	FechaIda1	VARCHAR(100)    NULL,
	FechaRegreso1	VARCHAR(100)    NULL,
	Universidad1	VARCHAR(50)     NULL,
	FechaIda2	VARCHAR(100)    NULL,
	FechaRegreso2	VARCHAR(100)    NULL,
	Universidad2	VARCHAR(50)     NULL,
	Idioma		VARCHAR(40)     NULL,
	NivelVerbal	VARCHAR(15)     NULL,
	NivelEscrito	VARCHAR(15)     NULL,
        NombreProg1     VARCHAR(40)     NULL,
        NombreProg2     VARCHAR(40)     NULL,

        -- Financiamiento
        Financiamiento  Varchar(100)    NULL,
        Descripcion     Varchar(100)    NULL,

        CONSTRAINT	PK_PlanillaUSB	
		PRIMARY KEY (NombreUsuario, Periodo)
);


/* En esta tabla se tienen todos los datos correspondientes
 * a  los  periodos  de  cada  materia del plan de estudios
 * de  cada  estudiante                                  */
CREATE TABLE "dycicle".PeriodosPlan(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Periodo		VARCHAR(20),
	DenominacionExt	VARCHAR(30)	NOT NULL,
        DenominacionUSB	VARCHAR(30)	NOT NULL,
	CodigoExt	VARCHAR(15)	NOT NULL,
        CodigoUSB	VARCHAR(15)	NOT NULL,
	CreditosExt	NUMERIC(2)	NOT NULL,
        CreditosUSB	NUMERIC(2)	NOT NULL,
	CONSTRAINT	PK_PeriodosPlan	
		PRIMARY KEY (NombreUsuario, DenominacionUSB, CodigoUSB)
);


/* En  esta  tabla  se  tienen  todos los datos necesarios
 * de los representantes de un estudiante en particular */
CREATE TABLE "dycicle".REPRESENTANTE(
        CI              VARCHAR(15)     NOT NULL,
	apellidoNombres	VARCHAR(30)	NOT NULL,
	Telefono	VARCHAR(30)	NOT NULL,
	Email		VARCHAR(30)	NOT NULL,
	TipoRelacion	VARCHAR(30)	NOT NULL,
	Direccion	VARCHAR(140)	NOT NULL,
	CONSTRAINT	PK_REPRESENTANTE
		PRIMARY KEY (CI)
);

/* Tabla que guarda las relaciones existentes entre los
 * estudiantes  y  sus  respectivos  representantes  */
CREATE TABLE "dycicle".esRepresentado(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	CI		VARCHAR(10)	NOT NULL,
	CONSTRAINT	PK_esRepresentado
		PRIMARY KEY (NombreUsuario,CI)
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
CREATE TABLE "dycicle".Gestionar(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Nombre		VARCHAR(30)	NOT NULL,
	Fecha		DATE		NOT NULL,
	CONSTRAINT	PK_Gestionar
		PRIMARY KEY (NombreUsuario,Nombre, Fecha)
);	

/* Entidad POSTULANTE la cual comprende  las coordinaciones
 * y universidades extranjeras. En esta tabla se encuentran
 * todos  los  datos  pertenecientes  al  postulante     */
CREATE TABLE "dycicle".POSTULANTE(
	NombreUsuario	VARCHAR(50)	NOT NULL,
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

/* Entidad GESTOR la cual comprende la DRIC y decanatos
 * En  esta  tabla  se   encuentran  todos  los   datos
 * pertenecientes   al   gestor                      */
CREATE TABLE "dycicle".GESTOR(
	NombreUsuario	VARCHAR(20)	NOT NULL,
        Nombre          VARCHAR(20)     NOT NULL,
	CONSTRAINT	PK_GESTOR	PRIMARY KEY (NombreUsuario)
)
WITH (
OIDS = FALSE
);

/* Un usuario puede enviarle una notificacion a otro usuario */
CREATE TABLE "dycicle".Notificar(
	Nom_Emisor	VARCHAR(20)	NOT NULL,
	Nom_Dest	VARCHAR(20)	NOT NULL,
	CONSTRAINT	PK_Notificar	PRIMARY KEY (Nom_Emisor, Nom_Dest)
)
WITH (
OIDS = FALSE
);

/* Entidad POSTULACION identificada por un numero unico */
CREATE TABLE "dycicle".POSTULACION(
	Numero		NUMERIC(10)	NOT NULL,
	Estado		VARCHAR(30)	NOT NULL,
        CarnetEst       VARCHAR(30)     NOT NULL,
	NomEst		VARCHAR(20)	NOT NULL,
	NomPostulante	VARCHAR(20)	NOT NULL,
	CodigoPost	VARCHAR(30)	NOT NULL,
        Recomendacion   VARCHAR(30)     NOT NULL,
        ComentRecomend  TEXT,
        FechaCreacion	timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT	PK_Postulacion	PRIMARY KEY (Numero)
)
WITH (
OIDS = FALSE
);

/* Un estudiante puede consultar el estado de su postulacion */
CREATE TABLE "dycicle".Consulta(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Numero		NUMERIC(10)	NOT NULL,
	CONSTRAINT	PK_Consulta2	PRIMARY KEY (NombreUsuario, Numero)
)
WITH (
OIDS = FALSE
);

/* Un postulante puede postular a un estudiante */
CREATE TABLE "dycicle".Postula(
	NombreUsuarioPostulante	VARCHAR(20)	NOT NULL,
	Codigo			VARCHAR(30)	NOT NULL,
	NombreUsuarioEstudiante	VARCHAR(20)	NOT NULL,
	Numero			NUMERIC(10)	NOT NULL,
	CONSTRAINT		PK_Consulta	PRIMARY KEY (NombreUsuarioPostulante, Codigo, NombreUsuarioEstudiante, Numero)
)
WITH (
OIDS = FALSE
);

/* Un gestor puede editar una postulacion */
CREATE TABLE "dycicle".Editar(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Numero		NUMERIC(10)	NOT NULL,
	Cambio		VARCHAR(100)	NOT NULL,
	CONSTRAINT 	PK_Editar	PRIMARY KEY (NombreUsuario, Numero)
)
WITH (
OIDS = FALSE
);

/* Un usuario puede acceder al log de auditoria */
CREATE TABLE "dycicle".HISTORICO(
        Hora		TIME		NOT NULL,
	Accion		VARCHAR(100)	NOT NULL,
        Fecha   	timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT	PK_Historico	PRIMARY KEY (Fecha, Hora, Accion)
)
WITH (
OIDS = FALSE
);

/* Un usuario puede realizar una accion que  modifique
 * el log de auditoria. Es decir, cada interaccion que
 * un usuario tenga con el sistema, esto contara  como
 * una modificacion al log de auditoria             */
CREATE TABLE "dycicle".Modifica(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Hora		TIME		NOT NULL,
	Accion		VARCHAR(100)	NOT NULL,
        Fecha		timestamp with time zone NOT NULL default CURRENT_TIMESTAMP(2),
	CONSTRAINT	PK_Modifica	PRIMARY KEY (NombreUsuario, Fecha, Hora, Accion)
)
WITH (
OIDS = FALSE
);

/* Entidad IDIOMAS la cual contiene, para cada idioma,
 * el nombre del idioma  y  su nivel tanto verbal como
 * escrito                                          */
CREATE TABLE "dycicle".IDIOMAS(
	NombreUsuario	VARCHAR(20)	NOT NULL,
	Idioma		VARCHAR(40)	NOT NULL,
	NivelVerbal	VARCHAR(15)	NOT NULL,
	NivelEscrito	VARCHAR(15)	NOT NULL,
	CONSTRAINT 	FK_Usuario	PRIMARY KEY (NombreUsuario,Idioma)
)
WITH (
OIDS = FALSE
);


----------------------RESTRICCIONES--------------------------

/* Rango de los Privilegios */
ALTER TABLE "dycicle".USUARIO  ADD
	CHECK ((0 < Privilegio) AND (Privilegio < 7));

ALTER TABLE "dycicle".PREREGISTRO  ADD
	CHECK ((0 < Privilegio) AND (Privilegio < 7));

/* Longitud de contrasena mayor a 6 caracteres para un usuario*/
ALTER TABLE "dycicle".USUARIO ADD
	CHECK (char_length(Contrasena) > 5);

/* Longitud de contrasena mayor a 6 caracteres para el preregistro*/
ALTER TABLE "dycicle".PREREGISTRO ADD
	CHECK (char_length(Contrasena) > 6);

/* El email de un usuario debe contener un @ */
ALTER TABLE "dycicle".USUARIO ADD
	CHECK (Email ~~ '%@%');

/* El sexo del estudiante puede ser Masculino o Femenino 
ALTER TABLE "dycicle".ESTUDIANTE ADD
	CHECK ((Sexo = 'Masculino') OR (Sexo = 'Femenino')); */

/* El tipo estudiante puede ser pregrado o postgrado */
ALTER TABLE "dycicle".AntecedenteAcademico ADD
	CHECK ((TipoEstudiante = 'Pregrado') OR (TipoEstudiante = 'Postgrado'));


/* El indice debe estar entre 1 y 5 */
ALTER TABLE "dycicle".AntecedenteAcademico ADD
	CHECK ((1.0000 <= Indice) AND (Indice <= 5.0000));

/* La fecha de ida debe ser anterior a la fecha de regreso */
ALTER TABLE "dycicle".PlanillaUSB ADD
	CHECK (FechaIda1 < FechaRegreso1);

/* El nivel verbal de un idioma debe ser Bajo, Medio o Alto */
ALTER TABLE "dycicle".PlanillaUSB ADD
	CHECK ((NivelVerbal = 'Bajo') OR (NivelVerbal = 'Medio') OR (NivelVerbal = 'Alto'));

ALTER TABLE "dycicle".IDIOMAS ADD
	CHECK ((NivelVerbal = 'Bajo') OR (NivelVerbal = 'Medio') OR (NivelVerbal = 'Alto'));

/* El nivel escrito de un idioma debe ser Bajo, Medio o Alto */
ALTER TABLE "dycicle".PlanillaUSB ADD
	CHECK ((NivelEscrito = 'Bajo') OR (NivelEscrito = 'Medio') OR (NivelEscrito = 'Alto'));

ALTER TABLE "dycicle".IDIOMAS ADD
	CHECK ((NivelEscrito = 'Bajo') OR (NivelEscrito = 'Medio') OR (NivelEscrito = 'Alto'));

/* El email de un representante debe contener un @ */
ALTER TABLE "dycicle".REPRESENTANTE ADD
	CHECK (Email ~~ '%@%');

/* En POSTULANTE: Si Tipo=Coordinacion => NombreUniExt=NULL */
ALTER TABLE "dycicle".POSTULANTE ADD
    CHECK ((Tipo='Coordinacion' AND NombreUniExt=NULL) OR
           (Tipo='UnivExtranjera' AND NombreCarrera=NULL));

-- Claves foraneas

/* Claves foraneas de ESTUDIANTE */
ALTER TABLE "dycicle".ESTUDIANTE ADD
	CONSTRAINT FK_Estudiante_Usuario FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".USUARIO;

/* Claves foraneas de EstudianteUSB */
ALTER TABLE "dycicle".EstudianteUSB ADD
	CONSTRAINT FK_EstudianteUSB_Estudiante FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".ESTUDIANTE;

/* Claves foraneas de ArchivosEstudianteUSB */
ALTER TABLE "dycicle".ArchivosEstudianteUSB ADD
	CONSTRAINT FK_ArchivosEstudianteUSB_EstudianteUSB FOREIGN KEY (NombreUsuario, Cedula, Carnet)
		REFERENCES "dycicle".EstudianteUSB;

/* Claves foraneas de EstudianteInternacional */
ALTER TABLE "dycicle".EstudianteInternacional ADD
	CONSTRAINT FK_EstudianteInternacional_Estudiante FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".Estudiante;

/* Claves foraneas de AntecedenteAcademico */
ALTER TABLE "dycicle".AntecedenteAcademico ADD
	CONSTRAINT FK_AntecedenteAcademico_Estudiante FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".Estudiante;

/* Claves foraneas de PlanEstudio */
ALTER TABLE "dycicle".PlanEstudio ADD
	CONSTRAINT FK_PlanEstudio_Estudiante FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".Estudiante;

/* Claves foraneas de PeriodosPlan */
ALTER TABLE "dycicle".PeriodosPlan ADD
	CONSTRAINT FK_PeriodosPlan_PlanEstudio FOREIGN KEY (NombreUsuario,CodigoUSB)
		REFERENCES "dycicle".PlanEstudio;

/* Claves foraneas de esRepresentado */
ALTER TABLE "dycicle".esRepresentado ADD
	CONSTRAINT FK_esRepresentado_Estudiante FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".Estudiante;

ALTER TABLE "dycicle".esRepresentado ADD
	CONSTRAINT FK_esRepresentado_Representante FOREIGN KEY (CI)
		REFERENCES "dycicle".REPRESENTANTE;

/* Claves foraneas de Gestionar */
ALTER TABLE "dycicle".Gestionar ADD
	CONSTRAINT FK_Gestionar_USUARIO FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".USUARIO;

ALTER TABLE "dycicle".Gestionar ADD
	CONSTRAINT FK_Gestionar_NOTICIAS FOREIGN KEY (Nombre, Fecha)
		REFERENCES "dycicle".NOTICIAS;

/* Claves foraneas de POSTULANTE */
ALTER TABLE "dycicle".POSTULANTE ADD
	CONSTRAINT FK_Postulante_Usuario FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".USUARIO;

/* Claves foraneas de GESTOR */
ALTER TABLE "dycicle".GESTOR ADD
	CONSTRAINT FK_GESTOR_Usuario FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".USUARIO;

/* Claves foraneas de Notificar */
ALTER TABLE "dycicle".Notificar ADD
	CONSTRAINT FK_Notificar_Usuario1 FOREIGN KEY (Nom_Emisor)
		REFERENCES "dycicle".USUARIO (NombreUsuario);

ALTER TABLE "dycicle".Notificar ADD
	CONSTRAINT FK_Notificar_Usuario2 FOREIGN KEY (Nom_Dest)
		REFERENCES "dycicle".USUARIO (NombreUsuario);

/* Claves foraneas de POSTULACION 
ALTER TABLE "dycicle".POSTULACION ADD
	CONSTRAINT FK_Postulacion_estudiante FOREIGN KEY (NomEst, CarnetEst)
		REFERENCES "dycicle".ESTUDIANTEUSB (NombreUsuario, Carnet);


ALTER TABLE "dycicle".POSTULACION ADD
	CONSTRAINT FK_Postulacion_postulante FOREIGN KEY (NomPostulante, CodigoPost)
		REFERENCES "dycicle".POSTULANTE (NombreUsuario, Codigo);


/* Claves foraneas de ComentarioPostulacion 
ALTER TABLE "dycicle".ComentarioPostulacion ADD
	CONSTRAINT FK_ComentarioPostulacion FOREIGN KEY (Numero)
		REFERENCES "dycicle".POSTULACION;
*/

/* Claves foraneas de Consulta */
ALTER TABLE "dycicle".Consulta ADD
	CONSTRAINT FK_Consulta_Estudiante FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".ESTUDIANTE;

ALTER TABLE "dycicle".Consulta ADD
	CONSTRAINT FK_Consulta_Postulacion FOREIGN KEY (Numero)
		REFERENCES "dycicle".POSTULACION;

/* Claves foraneas de Postula 
ALTER TABLE "dycicle".Postula ADD
	CONSTRAINT FK_Postula_Estudiante FOREIGN KEY (NomEst, CarnetEst)
		REFERENCES "dycicle".ESTUDIANTE (NombreUsuario, Carnet);


ALTER TABLE "dycicle".Postula ADD
	CONSTRAINT FK_Postula_Postulante FOREIGN KEY (NomPost, CodigoPost)
		REFERENCES "dycicle".POSTULANTE (NombreUsuario, Codigo);
*/

/* Claves foraneas de Editar */
ALTER TABLE "dycicle".Editar ADD
	CONSTRAINT FK_Editar_GESTOR FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".GESTOR;

ALTER TABLE "dycicle".Editar ADD
	CONSTRAINT FK_Editar_Postulacion FOREIGN KEY (Numero)
		REFERENCES "dycicle".POSTULACION;

/* Claves foraneas de Modifica */
ALTER TABLE "dycicle".Modifica ADD
	CONSTRAINT FK_Modifica_Historico FOREIGN KEY (Fecha, Hora, Accion)
		REFERENCES "dycicle".HISTORICO;

/* Clave foranea de Idiomas*/
ALTER TABLE "dycicle".IDIOMAS ADD
	CONSTRAINT FK_Idiomas_Usuario FOREIGN KEY (NombreUsuario)
		REFERENCES "dycicle".USUARIO;

/* INSERT de un usuario administrador por defecto */
INSERT INTO "dycicle".USUARIO VALUES ( 'admin','email@gmail.com', 1, 'Administrador', 'admin1234');
