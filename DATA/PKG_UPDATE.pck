create or replace package PKG_UPDATE is

  -- Author  : JULIO.BOLANOS
  -- Created : 22/03/2016 17:14:15
  -- Purpose : 
  
  
  --ACTUALIZAR UN USUARIO
  PROCEDURE SP_UPDATE_USUARIO
  (
            PTELEFONO                IN INTEGER,
            PCELULAR                 IN INTEGER,    
            PCLAVE                   IN VARCHAR2,
            PID_USUARIO              IN INTEGER
   );
   
  --ACTUALIZAR OBJETO
  PROCEDURE SP_UPDATE_OBJETO
  (
            PID_OBJETO               IN INTEGER,
            PID_CATEGORIA            IN INTEGER,
            PNOMBRE                  IN VARCHAR2,
            P_PAL_CLAVE              IN VARCHAR2,
            PID_ESTADO               IN INTEGER
   );
   
  --ACTUALIZA UNA ARCHIVO (IMAGEN DEL OBJETO)
  PROCEDURE SP_UPDATE_MEDIA
    (
            PID_OBJETO          IN INTEGER,
            PTIPO_IMAGEN        IN VARCHAR2,
            PNOMBRE_IMAGEN      IN VARCHAR2,
            PIMAGEN             IN BLOB
    );

end PKG_UPDATE;
/
create or replace package body PKG_UPDATE is

  --ACTUALIZAR UN USUARIO
  PROCEDURE SP_UPDATE_USUARIO
  (
            PTELEFONO                IN INTEGER,
            PCELULAR                 IN INTEGER,    
            PCLAVE                   IN VARCHAR2,
            PID_USUARIO              IN INTEGER
   )
   AS
   BEGIN
         UPDATE USUARIO U
         SET U.CELULAR = PCELULAR, U.TELEFONO = PTELEFONO, U.CLAVE = PCLAVE
         WHERE U.ID_USUARIO = PID_USUARIO;
         COMMIT;
   END SP_UPDATE_USUARIO;
   
  --ACTUALIZAR OBJETO
  PROCEDURE SP_UPDATE_OBJETO
  (
            PID_OBJETO               IN INTEGER,
            PID_CATEGORIA            IN INTEGER,
            PNOMBRE                  IN VARCHAR2,
            P_PAL_CLAVE              IN VARCHAR2,
            PID_ESTADO               IN INTEGER
   )
   AS
   BEGIN
       UPDATE OBJETO O
       SET O.ID_ESTADO = PID_ESTADO, O.ID_CATEGORIA = PID_CATEGORIA, O.NOMBRE_OBJETO = PNOMBRE, O.PALABRAS_CLAVES = P_PAL_CLAVE
       WHERE O.ID_OBJETO = PID_OBJETO;
       COMMIT; 
   END SP_UPDATE_OBJETO;
   
  --ACTUALIZA UNA ARCHIVO (IMAGEN DEL OBJETO)
  PROCEDURE SP_UPDATE_MEDIA
    (
            PID_OBJETO          IN INTEGER,
            PTIPO_IMAGEN        IN VARCHAR2,
            PNOMBRE_IMAGEN      IN VARCHAR2,
            PIMAGEN             IN BLOB
    )
    AS
    BEGIN
      UPDATE MEDIA M
      SET M.TIPO_IMAGEN = PTIPO_IMAGEN, M.NOMBRE_IMAGEN = PNOMBRE_IMAGEN, M.IMAGEN = PIMAGEN
      WHERE M.ID_OBJETO = PID_OBJETO;
      COMMIT;
    END SP_UPDATE_MEDIA;
   
end PKG_UPDATE;
/
