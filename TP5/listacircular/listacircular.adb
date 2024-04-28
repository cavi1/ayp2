with Ada.Unchecked_Deallocation;

package body Listacircular is
   
   procedure Free is new Ada.Unchecked_Deallocation(Tiponodo,Tipolista);
   
   procedure Insertar (Lista: in out Tipolista; Elemento: in Tipoelem) is
      
      Nuevonodo: Tipolista:= new Tiponodo'(Elemento, null);
      
   begin --Lista Apunta Al Final
      
         if Vacia (Lista) then Lista:= Nuevonodo;
         
         Lista.Sig:= Lista;-- si es el primer elemento, el siguiente de la lista es la propia lista
         
      else Nuevonodo.Sig:= Lista.Sig;--sino el siguiente del nuevonodo, apunta al siguiente de la lista
      
         Lista.Sig:= Nuevonodo;--el nodo agregado se transforma en el �ltimo elemento de la lista
         
      end if;
      
   end Insertar;
   

   procedure Suprimir (Lista: in out Tipolista; Elemento: in Tipoelem) is
      
      Actual: Tipolista:= Lista;
      
      Ant: Tipolista:= null;
      
   begin -- la lista no est� vac�a, el elemento existe y es �nico
      
      while Actual.Info /= Elemento loop
         
         Ant:= Actual;
         
         Actual:= Actual.Sig;
         
      end loop;
      
      if Ant = null then -- el elemento que encontr� es el "ultimo" de la lista
         
         if Actual = Actual.Sig then Lista:= null; -- es el �nico nodo de la lista
            
            else loop -- avanzar hasta llegar al anterior al "�ltimo"
            
            Ant:= Actual;
            
            Actual:= Actual.Sig;
            
            exit when Actual.Sig = Lista;--actual va a quedar en el anterior ya que el siguiente va a ser lista que es el �ltimo elemento
            
         end loop;--todo esto es s�lo para el caso en el que encontr� el elemento, es el �ltimo, y no es el �nico de la lista
         
         Actual.Sig:= Lista.Sig; --conecto el anterior al �ltimo con el primero de la lista
         
         Actual:= Lista; --avanzo actual para que coincida con el �ltimo (lo hago para liberarlo posteriormente)
         
         Lista:= Ant.Sig;--ant apuntaba al anterior del ante�ltimo por lo tanto ant.sig es el ante�ltimo, no se usa actual porque despues lo voy a tener q liberar para desvincular el elemento. 
                         --el ante�ltimo de la lista ahora se convierte en el �ltimo, el que era el �ltimo ya se encuentra desvinculado
      end if; 
      
      else Ant.Sig:= Actual.Sig;--este else es solo para el caso en que el elemento encontrado no es el �ltimo de la lista, ni es �nico. ser�a el caso mas com�n
                                --simplemente desvinculo actual que contiene al elemento encontrado
   end if;
   
   Free (Actual);--libero
   
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
      
   begin -- la lista est� vac�a si el puntero externo es nulo
      
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
   

   function Esta (Lista: Tipolista; Elem: Tipoelem) return Boolean is
         
         Ptr: Tipolista:= Lista.sig;
              
      begin -- Iterativo
         
         if Vacia (Lista) then return False;
         
         else  loop
            
               if Ptr.Info = Elem then return True;
               
                  end if;
                  
                  Ptr:= Ptr.Sig;
                              
               exit when Ptr /= Lista;
               
            end loop;
                      
         end if;
         
         return False;
         
      end Esta;
      
 

end Listacircular;

   




