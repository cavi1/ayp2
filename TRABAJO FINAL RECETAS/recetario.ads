with Receta, Listaord;
use Receta;
package Recetario is --desarrollado por Gonzales Francisco
   type Trecetamaster is private;
   type Trecetario is private;
   Receta_Repetida, Receta_Inexistente, ingreditne_inexistente: exception;
   
   procedure Agregar_Receta (Recetario: in out Trecetario);-- Receta: in Treceta);
   procedure Eliminar_Receta (Recetario: in out Trecetario);-- Receta: in Treceta);
   procedure Modificar_Receta (Recetario: in out Trecetario);-- por ahora que llame a la funcion agg ingrediente o quitar ingrediente
   procedure Buscar_Receta (Recetario: in out Trecetario; nombre_receta: in out string; long_nombre: in positive; encontrado: out boolean ) ;
   procedure Crear_Recetario( Recetario: in out Trecetario);-- inicializar la lista osea crear y limpiar
   procedure Generar_Listado (Recetario: in  Trecetario);
   procedure usar_receta (recetario: in out trecetario);
   
   
   private
   type Trecetamaster is record
      Aperturas: natural;
      Receta: Treceta;
   end record;
   
   function "<" (X,Y: Trecetamaster) return Boolean;
   function ">" (X,Y: Trecetamaster) return Boolean;
  
   package Recetario is new Listaord(Trecetamaster, "<", ">");   use Recetario;
   type Trecetario is new Tipolista;
   
end Recetario;
   
      
