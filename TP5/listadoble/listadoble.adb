with Ada.Unchecked_Deallocation;

package body Listadoble is
   
   procedure Free is new Ada.Unchecked_Deallocation(Tiponodo,Tipolista);
   
   function Esta (Lista: Tipolista; Elem: Tipoelem) return Boolean is
      
      Ptr: Tipolista:= Lista;
      
   begin
      
      if Lista = null then return False;
      
      else if Ptr /= null and then Ptr.Info = Elem then Return true;
      
         else return Esta (Lista.Sig, Elem);
         
         end if;
         
      end if;
      
   end Esta;
   
   procedure Insertar (Lista: in out Tipolista; Elemento: in Tipoelem) is
      
      Nuevonodo: Tipolista:= new Tiponodo'(Elemento, null, null);
      
   begin -- inserta por el frente
      
      if Vacia (Lista) then Lista:= Nuevonodo;
      
      else Nuevonodo.Sig := Lista;
      
         Lista.Ant:= Nuevonodo;
         
         Lista:= Nuevonodo;
         
      end if;
      
   end Insertar;
   

   procedure Suprimir (Lista:in out Tipolista; Elemento: in Tipoelem) is
      
      Actual: Tipolista:=Lista;
      
   begin
      
      if Vacia (Lista) then raise Listavacia;
      
      else while Actual /= null and then Actual.Info /= Elemento loop --Busca El Nodo A Liberar
         
            Actual:= Actual.Sig;
            
         end loop;
         
         if Actual /= null then--significa que encontré el elemento
            
            if Actual.Ant = null then -- es el primer elemento de la lista
               
               if Actual.Sig /= null then Actual.Sig.Ant:= null; -- es el primer elemento pero no es el único elemento, lo desvinculo del segundo elemento
                  
               end if; 
               
               Lista:= Lista.Sig; -- sobreescribo el puntero original de lista para que apunte al segundo elemento.Ahora actual apunta al nodo a liberar
                  
            else Actual.Ant.Sig:= Actual.Sig; --si no es el primer elemento. Y si fuera el último deja al anteúltimo apuntando a null en .sig
                  
                  if Actual.Sig /= null then Actual.Sig.Ant:= Actual.Ant; --si no es el último elemento, es decir esta en el medio(caso mas común) desvinculo el elemento
                     
                  end if;
                   
            end if; 
                     
               Free (Actual); -- todos los casos en los que se encuentra el elemento desembocan en este free
               
                     
            end if; --por lo tanto todo esto es si actual /=null. significa que si el elemento no está este procedimiento no hace nada
               
         end if; --si vacia(lista)


   end Suprimir;
   




 procedure Limpiar (Lista: in out Tipolista) is
      
      Temp: Tipolista:= Lista;
      
   begin
      
      while Lista /= null loop
               
         Temp:= Lista;
         
         Lista:= Lista.Sig;
         
         Free (Temp);
         
      end loop;
      
   end Limpiar;
  

function Vacia (Lista: in Tipolista) return Boolean is
      
   begin -- la lista está vacía si el puntero externo es nulo
      
      return Lista = null;
      
   end Vacia;


function Info (Lista: in Tipolista) return Tipoelem is 
      
      begin
         
         if Lista /= null then return Lista.Info;
         
         else raise Listavacia;
         
         end if;
         
      end Info;  
      
      
  function Sig (Lista: in Tipolista) return Tipolista is
      
   begin
      
      if Vacia(Lista) then raise Listavacia;
      
      else return Lista.Sig;
      
      end if;
      
   end Sig;
   

end listadoble;

