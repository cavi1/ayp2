with Recetario, Receta, Ada.Text_Io;
use ada.Text_IO;
   
procedure Programappal is
      
use receta;      
use Recetario;
   
   
recetario:trecetario;   
--receta:treceta;
   
begin
   -------------------------------SE SUBE EL ARCHIVO CON X RECETAS
   --Crear_Recetario(Recetario);
   --Agregar_Receta(Recetario);
   --Agregar_Receta(Recetario);
   --Agregar_Receta(Recetario);
   --cargar_archivo(recetario);
   -------------------------------SE BAJA EL ARCHIVO CON X RECETAS
   Bajar_Archivo(Recetario); 
   --Modificar_Receta(Recetario);--puedo cambiarle ingredientes
   --Usar_Receta(Recetario);--puedo desplegar toda una receta, por cada despliegue se le agrega +1 uso
   --agregar_receta(recetario);--puedo agregar mas recetas
   --Eliminar_Receta(Recetario);--puedo eliminar una receta   
   generar_listado(recetario);--debería poder ver en el frende del recetario al elemento con mas usos
end Programappal;

         
