

   
with Ada.Unchecked_Deallocation;

package body Coladin is
   
   procedure Free is new Ada.Unchecked_Deallocation(Tiponodo,Tipopun);
   
   function Vacia (Cola: in Tcola) return Boolean is
      
   begin
                                    -- la cola esta vacía si el valor de frente es nulo
       return Cola.Frente = null;
       
   end Vacia;
   
   procedure Insertar (Cola:in out Tcola; nuevoelem: in Telemento) is
            
      Nuevonodo: Tipopun:= new Tiponodo'(nuevoelem, null);--se crea el nodo suelto por asi decirlo, no apunta a nadie
      
   begin
      
      if Vacia (Cola) then Cola.Frente:= Nuevonodo; -- si es el primer elemento el frente apunta al nodo creado
      
      else Cola.Final.Sig:= Nuevonodo; --sino el final apunta al nodo creado, con esta asignación accedo al puntero que esta dentro del nodo al que apunta el puntero llamado final
      
      end if;
      
      Cola.Final:= Nuevonodo; --se actualiza el puntero externo
         
   end Insertar;
   
   procedure Suprimir (Cola:in out TCola; sacaelem: out TElemento) is
      Temp: Tipopun:= Cola.Frente;
      
   begin
      
      if Vacia (Cola) then raise Colavacia;
      
      else sacaelem:= Cola.Frente.Info;
      
         Cola.Frente:= Cola.Frente.Sig; --actualiza puntero externo
      
      end if;
         
         if Cola.Frente = null then Cola.Final:= null; --evita puntero colgante
         end if;
         
         
         Free (Temp);
         
      end Suprimir;
      



      procedure Limpiar (Cola: in out Tcola) is
         
            Temp: Tipopun:= Cola.Frente;
            
      begin
         
         while not Vacia (Cola) loop
            
            Cola.Frente:= Cola.Frente.Sig;
            
            Free (Temp);
            
            Temp:= Cola.Frente;
            
         end loop;
         
         cola.final:=null;
         
      end Limpiar;
      
      procedure Crear(Cola:out Tcola) is
      begin
         Cola.Frente:=null;
         Cola.Final:=null;
      end Crear;
      
        


   end Coladin;
   
