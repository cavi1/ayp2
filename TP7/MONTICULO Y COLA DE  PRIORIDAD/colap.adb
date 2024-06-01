with Monticulo;

package body Colap is
   
package monticulocp is new monticulo(TipoElemento,VecCola,">");
use Monticulocp;
   

   procedure Insertar(Cp: in out Tipocolap; Elem: in Tipoelemento) is
      
   begin
      
      if Cp.Final = Cp.Max then raise Overflow;--porque está llena( es estática)
      
      else Cp.Final:= Cp.Final + 1;
      
         Cp.Elementos(Cp.Final):= Elem;
         
         Restaurararriba(Cp.Elementos(1..Cp.Final));--le hace mantener la propiedad de orden
         
      end if;
      
   end Insertar;
   
   procedure Suprimir(Cp: in out Tipocolap ; Elem: out Tipoelemento)is
      
   begin
      
      if Cp.Final= 0 then raise Underflow;--si esta vacio el vector
      
      else Elem:= Cp.Elementos(1);--me llevo el primer elemento ya que es la prioridad
      
         Cp.Elementos(1) := Cp.Elementos(Cp.Final);--lo intercambio por el ultimo (no importa que se desordene)
         
         Cp.Final := Cp.Final -1;--disminuyo el final para que sepa que hay espacio
         
         Restaurarabajo (Cp.Elementos(1..Cp.Final));--no importa que quede desordenado porque con esto lo acomodo para que respete el orden
         
      end if;
      
   end Suprimir;
   
   function Llena(Cp: in Tipocolap) return Boolean is
      
   begin
      
      return Cp.Final = Cp.Max;
      
   end Llena;
   
   function Vacia(Cp: in Tipocolap) return Boolean is
      
   begin
      
      return Cp.Final = 0;
      
   end Vacia;
   
   procedure Inicializar(Cp: in out Tipocolap) is
      
   begin
      
      Cp.Final:= 0;
      
   end Inicializar;
     
end colap;