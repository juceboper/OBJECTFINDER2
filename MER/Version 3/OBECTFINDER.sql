------------------------------------------------------
-- Export file for user ADMIN                       --
-- Created by julio.bolanos on 27/02/2016, 13:13:41 --
------------------------------------------------------

set define off
spool OBECTFINDER.log

prompt
prompt Creating table CATEGORIA
prompt ========================
prompt
create table ADMIN.CATEGORIA
(
  id_categoria     INTEGER not null,
  nombre_categoria NVARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.CATEGORIA
  add constraint CATEGORIA_PK primary key (ID_CATEGORIA)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DEPARTAMENTO
prompt ===========================
prompt
create table ADMIN.DEPARTAMENTO
(
  id_dane_departamento INTEGER not null,
  nombre_departamento  NVARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.DEPARTAMENTO
  add constraint DEPARTAMENTO_PK primary key (ID_DANE_DEPARTAMENTO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ESTADO
prompt =====================
prompt
create table ADMIN.ESTADO
(
  id_estado     INTEGER not null,
  nombre_estado NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.ESTADO
  add constraint ESTADO_PK primary key (ID_ESTADO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table INTEGRACION
prompt ==========================
prompt
create table ADMIN.INTEGRACION
(
  id_integracion     INTEGER not null,
  nombre_integracion NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column ADMIN.INTEGRACION.nombre_integracion
  is 'EN ESTA PARTE ES DONDE SE VAN A GUARDAR LOS TIPOS DE INTEGRACION DEL SISTEMA, ES DECIR SI LA PERSONA SE LOGUA POR:
1. GOOGLE +
2. FACEBOOK
2. NATIVO';
alter table ADMIN.INTEGRACION
  add constraint INTEGRACION_PK primary key (ID_INTEGRACION)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MUNICIPIO
prompt ========================
prompt
create table ADMIN.MUNICIPIO
(
  id_dane_municipio    INTEGER not null,
  nombre_municipio     NVARCHAR2(200),
  id_dane_departamento INTEGER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.MUNICIPIO
  add constraint MUNICIPIO_PK primary key (ID_DANE_MUNICIPIO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.MUNICIPIO
  add constraint MUNICIPIO_DEPARTAMENTO_FK foreign key (ID_DANE_DEPARTAMENTO)
  references ADMIN.DEPARTAMENTO (ID_DANE_DEPARTAMENTO) on delete cascade;

prompt
prompt Creating table LOCALIDAD
prompt ========================
prompt
create table ADMIN.LOCALIDAD
(
  id_localidad      INTEGER not null,
  id_dane_municipio INTEGER not null,
  nombre_localidad  NVARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.LOCALIDAD
  add constraint LOCALIDAD_PK primary key (ID_LOCALIDAD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.LOCALIDAD
  add constraint LOCALIDAD_MUN_PK unique (ID_LOCALIDAD, ID_DANE_MUNICIPIO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.LOCALIDAD
  add constraint LOCALIDAD_MUNICIPIO_FK foreign key (ID_DANE_MUNICIPIO)
  references ADMIN.MUNICIPIO (ID_DANE_MUNICIPIO);

prompt
prompt Creating table OBJETO
prompt =====================
prompt
create table ADMIN.OBJETO
(
  id_objeto       INTEGER not null,
  id_categoria    INTEGER not null,
  nombre_objeto   NVARCHAR2(500),
  palabras_claves NVARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.OBJETO
  add constraint OBJETO_PK primary key (ID_OBJETO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.OBJETO
  add constraint OBJETO_CAT_PK unique (ID_OBJETO, ID_CATEGORIA)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.OBJETO
  add constraint OBJETO_CATEGORIA_FK foreign key (ID_CATEGORIA)
  references ADMIN.CATEGORIA (ID_CATEGORIA);

prompt
prompt Creating table MEDIA
prompt ====================
prompt
create table ADMIN.MEDIA
(
  id_media      INTEGER not null,
  id_objeto     INTEGER not null,
  tipo_imagen   VARCHAR2(10),
  nombre_imagen VARCHAR2(100),
  imagen        BLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.MEDIA
  add primary key (ID_MEDIA)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.MEDIA
  add constraint UNQ_ID_MEDIA_ID_OBJETO unique (ID_MEDIA, ID_OBJETO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.MEDIA
  add constraint FK_ID_OBJETO_MED foreign key (ID_OBJETO)
  references ADMIN.OBJETO (ID_OBJETO);

prompt
prompt Creating table USUARIO
prompt ======================
prompt
create table ADMIN.USUARIO
(
  id_usuario       INTEGER not null,
  primer_nombre    NVARCHAR2(100),
  segundo_nombre   NVARCHAR2(100),
  primer_apellido  NVARCHAR2(100),
  segundo_apellido NVARCHAR2(100),
  fecha_registro   DATE,
  id_estado        INTEGER,
  telefono         INTEGER,
  celular          INTEGER,
  email            NVARCHAR2(200),
  fecha_nacimiento DATE,
  genero           CHAR(1),
  id_integracion   INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.USUARIO
  add constraint USUARIO_PK primary key (ID_USUARIO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.USUARIO
  add constraint ID_ESTADO_USU_FK foreign key (ID_ESTADO)
  references ADMIN.ESTADO (ID_ESTADO);
alter table ADMIN.USUARIO
  add constraint ID_INTEGRACION_USU_FK foreign key (ID_INTEGRACION)
  references ADMIN.INTEGRACION (ID_INTEGRACION);

prompt
prompt Creating table NOTIFICACION
prompt ===========================
prompt
create table ADMIN.NOTIFICACION
(
  id_notificacion      INTEGER not null,
  id_objeto            INTEGER not null,
  id_usuario           INTEGER not null,
  fecha_notificacion   DATE not null,
  mensaje_notificacion NVARCHAR2(500) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.NOTIFICACION
  add constraint NOTIFICACION_PK primary key (ID_NOTIFICACION)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.NOTIFICACION
  add constraint ID_OBJETO_NOT_FK foreign key (ID_OBJETO)
  references ADMIN.OBJETO (ID_OBJETO);
alter table ADMIN.NOTIFICACION
  add constraint NOTIFICACION_USUARIO_FK foreign key (ID_USUARIO)
  references ADMIN.USUARIO (ID_USUARIO);

prompt
prompt Creating table PERFIL
prompt =====================
prompt
create table ADMIN.PERFIL
(
  id_perfil     INTEGER not null,
  nombre_perfil NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.PERFIL
  add constraint PERFIL_PK primary key (ID_PERFIL)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PROCESO_REGISTRO
prompt ===============================
prompt
create table ADMIN.PROCESO_REGISTRO
(
  id_proceso     INTEGER not null,
  nombre_proceso NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.PROCESO_REGISTRO
  add constraint PROCESO_REGISTRO_PK primary key (ID_PROCESO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PER_USUARIO
prompt ==========================
prompt
create table ADMIN.PER_USUARIO
(
  id_perfil  INTEGER not null,
  id_usuario INTEGER not null,
  id_proceso INTEGER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.PER_USUARIO
  add constraint ID_PROCESO_FK foreign key (ID_PROCESO)
  references ADMIN.PROCESO_REGISTRO (ID_PROCESO);
alter table ADMIN.PER_USUARIO
  add constraint ID_USUARIO_FK foreign key (ID_USUARIO)
  references ADMIN.USUARIO (ID_USUARIO);
alter table ADMIN.PER_USUARIO
  add constraint PER_USUARIO_PK foreign key (ID_PERFIL)
  references ADMIN.PERFIL (ID_PERFIL);

prompt
prompt Creating table REGISTRO
prompt =======================
prompt
create table ADMIN.REGISTRO
(
  id_registro    INTEGER not null,
  fecha_registro DATE,
  id_objeto      INTEGER not null,
  id_usuario     INTEGER not null,
  id_localidad   INTEGER not null,
  id_estado      INTEGER not null,
  observacion    VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.REGISTRO
  add constraint REGISTRO_PK primary key (ID_REGISTRO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.REGISTRO
  add constraint ID_ESTADO_REG_FK foreign key (ID_ESTADO)
  references ADMIN.ESTADO (ID_ESTADO);
alter table ADMIN.REGISTRO
  add constraint ID_LOCALIDAD_REG_FK foreign key (ID_LOCALIDAD)
  references ADMIN.LOCALIDAD (ID_LOCALIDAD);
alter table ADMIN.REGISTRO
  add constraint ID_OBJETO_FK foreign key (ID_OBJETO)
  references ADMIN.OBJETO (ID_OBJETO);
alter table ADMIN.REGISTRO
  add constraint ID_USUARIO_REG_FK foreign key (ID_USUARIO)
  references ADMIN.USUARIO (ID_USUARIO);


spool off
