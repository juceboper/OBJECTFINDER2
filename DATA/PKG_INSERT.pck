create or replace package PKG_INSERT is

  -- Author  : JULIO.BOLANOS
  -- Created : 22/03/2016 10:17:41
  -- Purpose : 
  
  
  --INSERTA UN USUARIO
  PROCEDURE SP_INSERT_USUARIO
    (
            PNOMBRE1                 IN VARCHAR2, 
            PNOMBRE2                 IN VARCHAR2, 
            PAPELLIDO1               IN VARCHAR2, 
            PAPELLIDO2               IN VARCHAR2,
            PFECHA_REGISTRO          IN DATE,
            PID_ESTADO               IN INTEGER,
            PTELEFONO                IN INTEGER,
            PCELULAR                 IN INTEGER,    
            PEMAIL                   IN VARCHAR2,
            PFECHA_NACIMIENTO        IN DATE,
            PGENERO                  IN CHAR,
            PID_INTEGRACION          IN INTEGER,
            PUSUARIO                 IN VARCHAR2,
            PCLAVE                   IN VARCHAR2
   );
  
  --INSERTA UN REGISTRO REALIZADO POR CUALQUIER USUARIO
  PROCEDURE SP_INSERT_REGISTRO
    (
            PID_OBJETO               IN INTEGER,
            PID_USUARIO              IN INTEGER,
            PID_FACULTAD             IN INTEGER,
            PID_ESTADO               IN INTEGER,
            POBSERVACION             IN VARCHAR2       
    );
    
  --INSERTA UN OBJETO CREADO POR UN USUARIO
  PROCEDURE SP_INSERT_OBJETO
    (
            PID_CATEGORIA        IN INTEGER,
            PNOMBRE_OBJETO       IN VARCHAR2,
            PPALABRAS_CLAVES     IN VARCHAR2,
            PID_ESTADO           IN INTEGER
    );
  
  --INSERTA CUALQUIER NOTIFICACION QUE HAGA EL USUARIO
  PROCEDURE SP_INSERT_NOTIFICACION
    (
            PID_OBJETO             IN INTEGER,
            PID_USUARIO            IN INTEGER,
            PMENSAJE_NOTIFICACION  IN VARCHAR2
    );
  
  --INSERTA UNA ARCHIVO (IMAGEN DEL OBJETO)
  PROCEDURE SP_INSERT_MEDIA
    (
            PID_OBJETO          IN INTEGER,
            PTIPO_IMAGEN        IN VARCHAR2,
            PNOMBRE_IMAGEN      IN VARCHAR2,
            PIMAGEN             IN BLOB
    );
    
  

end PKG_INSERT;
/
create or replace package body PKG_INSERT
is

  --INSERTA UN USUARIO
  PROCEDURE SP_INSERT_USUARIO
    (
            PNOMBRE1                 IN VARCHAR2, 
            PNOMBRE2                 IN VARCHAR2, 
            PAPELLIDO1               IN VARCHAR2, 
            PAPELLIDO2               IN VARCHAR2,
            PFECHA_REGISTRO          IN DATE,
            PID_ESTADO               IN INTEGER,
            PTELEFONO                IN INTEGER,
            PCELULAR                 IN INTEGER,    
            PEMAIL                   IN VARCHAR2,
            PFECHA_NACIMIENTO        IN DATE,
            PGENERO                  IN CHAR,
            PID_INTEGRACION          IN INTEGER,
            PUSUARIO                 IN VARCHAR2,
            PCLAVE                   IN VARCHAR2
    )
    AS
    BEGIN
      INSERT INTO USUARIO 
      VALUES
      (
            id_usuario_seq.nextval   ,
            PNOMBRE1                 ,
            PNOMBRE2                 ,
            PAPELLIDO1               ,
            PAPELLIDO2               ,
            PFECHA_REGISTRO          ,
            PID_ESTADO               ,
            PTELEFONO                ,
            PCELULAR                 ,
            PEMAIL                   ,
            PFECHA_NACIMIENTO        ,
            PGENERO                  ,
            PID_INTEGRACION          ,
            PUSUARIO                 ,
            PCLAVE      
      );
      COMMIT;
    END SP_INSERT_USUARIO;
    
  --INSERTA UN REGISTRO REALIZADO POR CUALQUIER USUARIO
  PROCEDURE SP_INSERT_REGISTRO
    (
            PID_OBJETO               IN INTEGER,
            PID_USUARIO              IN INTEGER,
            PID_FACULTAD             IN INTEGER,
            PID_ESTADO               IN INTEGER,
            POBSERVACION             IN VARCHAR2       
    )
    AS
    BEGIN
      INSERT INTO REGISTRO
      VALUES
      (
            id_registro_seq.nextval  ,
            SYSDATE                  ,
            PID_OBJETO               ,
            PID_USUARIO              ,
            PID_FACULTAD             ,
            PID_ESTADO               ,
            POBSERVACION   
      );
      COMMIT;
    END SP_INSERT_REGISTRO;
    
  --INSERTA UN OBJETO CREADO POR UN USUARIO
  PROCEDURE SP_INSERT_OBJETO
    (
            PID_CATEGORIA        IN INTEGER,
            PNOMBRE_OBJETO       IN VARCHAR2,
            PPALABRAS_CLAVES     IN VARCHAR2,
            PID_ESTADO           IN INTEGER
    )
    AS
    BEGIN
      INSERT INTO OBJETO 
      VALUES
      (
            id_objeto_seq.nextval,
            PID_CATEGORIA        ,
            PNOMBRE_OBJETO       ,
            PPALABRAS_CLAVES     ,
            PID_ESTADO     
      );
      COMMIT;
  END SP_INSERT_OBJETO;
   
  --INSERTA CUALQUIER NOTIFICACION QUE HAGA EL USUARIO
  PROCEDURE SP_INSERT_NOTIFICACION
    (
            PID_OBJETO             IN INTEGER,
            PID_USUARIO            IN INTEGER,
            PMENSAJE_NOTIFICACION  IN VARCHAR2
    )
    AS
    BEGIN
      INSERT INTO NOTIFICACION
      VALUES
      (     id_notif_seq.nextval,
            PID_OBJETO 				,
            PID_USUARIO 			,
            SYSDATE           ,
            PMENSAJE_NOTIFICACION 	                        
      );
      COMMIT;
  END SP_INSERT_NOTIFICACION;
  
  
  --INSERTA UNA ARCHIVO (IMAGEN DEL OBJETO)
  PROCEDURE SP_INSERT_MEDIA
    (
            PID_OBJETO          IN INTEGER,
            PTIPO_IMAGEN        IN VARCHAR2,
            PNOMBRE_IMAGEN      IN VARCHAR2,
            PIMAGEN             IN BLOB
    )
    AS
    BEGIN
      INSERT INTO MEDIA
      VALUES
      (
            id_media_seq.nextval,
            PID_OBJETO          ,
            PTIPO_IMAGEN        ,
            PNOMBRE_IMAGEN      ,
            PIMAGEN    
      );
      COMMIT;
  END SP_INSERT_MEDIA;
end PKG_INSERT;
/
