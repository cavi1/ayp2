with Recetario, Receta, Ada.Text_Io;
use ada.Text_IO;
   
procedure Programappal is
      
use receta;      
use Recetario;
   
   
recetario:trecetario;   
--receta:treceta;
   
begin
   Crear_Recetario(Recetario);
   Agregar_Receta(Recetario);
   agregar_receta(recetario);
   --se podrian agregar mas 
   Modificar_Receta(Recetario);
   Usar_Receta(Recetario);
   Eliminar_Receta(Recetario);
   generar_listado(recetario);
end Programappal;

         
