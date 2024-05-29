with Ada.Unchecked_Deallocation; -- procedimiento genérico para liberar memoria
   
package body Listanoord is -- implementación del paquete Lista
   
   procedure Free is new Ada.Unchecked_Deallocation(Tiponodo,Tipolista);



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
      
      function Esta (Lista: Tipolista; Elem: Tipoelem) return Boolean is
         
         Ptr: Tipolista:= Lista;
         
      
      begin -- Iterativo
         
         if Vacia (Lista) then return False;
         
         else while Ptr /= null loop
            
               if Ptr.Info = Elem then return True;
               
               end if;
               
               Ptr:= Ptr.Sig;
               
            end loop;
            
         end if;
         
         return False;
         
      end Esta;
      
   

   function Estarec (Lista: Tipolista; Elem: Tipoelem) return Boolean is
      
      Ptr: Tipolista:= Lista;-- es necesario?
      
   begin -- recursivo
      
      if Vacia(Lista) then return False;--caso base 1
      
      else if Ptr /= null and then Ptr.Info = Elem then return True;--caso base 2 
                                                                           --and then significa que una vez q la primera condicion sea verdadera ahi recién chequea la otra sino es al pedo 
      
         else return Esta (Lista.Sig, Elem);--caso recursivo llama a esta del siguiente elemento
         
         end if;
         
      end if;
      
   end Estarec;
   

   procedure Insertar (Lista: in out Tipolista; Elemento: in Tipoelem) is--inserta por el comienzo de la lista (el elemento insertado pasa a ser el primero)
      
      Nuevonodo: Tipolista:= new Tiponodo'(Elemento, null);
      
   begin -- se inserta al comienzo de una lista
      
      if Vacia (Lista) then Lista:= Nuevonodo;
      
      else Nuevonodo.Sig := Lista;
      
         Lista:= Nuevonodo; -- se inserto el valor
            
      end if;
      
   end Insertar;
  

   procedure Insertarporfinal (Lista: in out Tipolista; Elem: in Tipoelem) is
      
      Nodo: Tipolista:= new Tiponodo'(Elem, null);
      
      Ptr: Tipolista:= Lista;--es necesario para no perder el apuntador original
      
   begin
      
      if Ptr = null then Lista:= Nodo; -- es el primer elemento
         
      else Ptr:= Lista;
      
         while Ptr.Sig /= null loop
            
            Ptr:= Ptr.Sig;
            
         end loop;
         
         Ptr.Sig:= Nodo; -- enlaza el nuevo nodo al final de la lista
            
      end if;
      
   end Insertarporfinal;
      




   
   
   function Sig (Lista: in Tipolista) return Tipolista is
      
   begin
      
      if Vacia(Lista) then raise Listavacia;
      
      else return Lista.Sig;
      
      end if;
      
   end Sig;
      

      
   procedure Suprimir (Lista: in out Tipolista; Elemento: in Tipoelem) is
      
      Actual: Tipolista:= Lista;
      
      Ant: Tipolista:= null;
      
   begin
      
      if Vacia(Lista) then raise Listavacia;
      
      else while Actual /= null and then Actual.Info /= Elemento loop
         
            Ant:= Actual;
            
            Actual:= Actual.Sig;
            
         end loop;
         
         if Ant = null then Lista:= Lista.Sig; -- se elimina el primer elemento
            
            else Ant.Sig:= Actual.Sig;-- se elimina un elemento de otra posición desengancho el elemento de actual y engancho anterior con el siguiente de actual
            
         end if;
            
            Free (Actual);
            
      end if;
      
   end Suprimir;
   


   procedure Suprimirporfrente (Lista:in out Tipolista;Elem: out Tipoelem) is
      
      Ptr: Tipolista:= Lista;--se queda apuntando al primer elemento para poder liberarlo con el free
      
   begin
      
      if not Vacia (Lista) then
         
         Elem:= Lista.Info;
         
         Lista:= Lista.Sig;
         
         Free (Ptr);
         
      else raise Listavacia;
      
      end if;
      
   end Suprimirporfrente;
   
   



procedure Crear (Lista: out Tipolista) is
begin
   Lista:=null;
end Crear;

end Listanoord;
   
      
   
      
