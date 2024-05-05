with Ada.Unchecked_Deallocation;
package body Listaenlazada is
   
   procedure Free is new Ada.Unchecked_Deallocation(Tnodo, Tlista);
   
   function Vacia (Lista: Tlista) return Boolean is
   begin
      return Lista = null;
   end Vacia;
   

   function Esta (Lista: Tlista; Elemento: Tdato) return Boolean is
      Ptr: Tlista := Lista;
   begin
      if Vacia(Lista) then
         return False;
      else
         while Ptr /= null loop
            if Ptr.Info = Elemento then
               return True;            end if;
            Ptr:= Ptr.Sig;
         end loop;
      end if;
      return False;
   end Esta;
   

   procedure Insertar (Lista: in out Tlista; Elemento: in Tdato) is
      Nuevonodo: Tlista:= new Tnodo'(Elemento,null);
   begin
      if Vacia (Lista) then
         Lista:= Nuevonodo;
      else
         Nuevonodo.Sig:=Lista;         Lista:= Nuevonodo;
      end if;
   end Insertar;
   
   procedure Suprimir (Lista: in out Tlista; Elemento: in Tdato) is
      Actual: Tlista:= Lista;
      Ant: Tlista:= null;
   begin
      if Vacia (Lista) then
         raise Listavacia;
      else
         while actual /= null and then actual.info /= elemento loop
            Ant:= Actual;
            Actual:= Actual.Sig;
         end loop;
         if Ant= null then
            Lista:= Lista.Sig;
         else
            Ant.Sig:= Actual.Sig;
         end if;
         Free (Actual);
      end if;
   end Suprimir;
   
   procedure Limpiar (Lista: in out Tlista) is
      Temp:Tlista:=Lista;
   begin
      while Lista /= null loop
         Temp:= Lista;
         Lista:=Lista.Sig;
         Free (Temp);
      end loop;
   end Limpiar;
   

   function Info (Lista: Tlista) return Tdato is
   begin
      if lista /= null then
         return Lista.Info;
      else
         raise Listavacia;
      end if;
   end Info;
   
   function Sig (Lista: Tlista) return Tlista is
   begin
      if Vacia(Lista) then
         raise Listavacia;
      else
         return Lista.Sig;
      end if;
   end Sig;
   
   
   procedure Suprimirporfrente (Lista:in out Tlista;Elemento: out Tdato) is
      Ptr: Tlista:= Lista;
   begin
      if not Vacia (Lista) then
         Elemento:= Lista.Info;
         Lista:= Lista.Sig;
         Free (Ptr);
      else
         raise Listavacia;
      end if;
   end Suprimirporfrente;
   

   procedure Insertarporfinal (Lista: in out Tlista; Elemento: in Tdato) is
      Nodo: Tlista:= new Tnodo'(Elemento, null);
      Ptr: Tlista:= Lista;
   begin
      if Ptr = null then Lista:= Nodo; -- es el primer elemento
      else
         Ptr:= Lista;
         while Ptr.Sig /= null loop
            ptr:= ptr.Sig;
         end loop;
         Ptr.Sig:= Nodo;-- enlaza el nuevo nodo al final de la lista
      end if;
   end Insertarporfinal;
   
end Listaenlazada;

         
