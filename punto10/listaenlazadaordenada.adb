with ada.Unchecked_Deallocation;
package body Listaenlazadaordenada is

   procedure Free is new Ada.Unchecked_Deallocation (Tnodo, Tlista);
   

   function Vacia (Lista: Tlista) return Boolean is
   begin
      return Lista = null;
   end Vacia;
   

   function Esta (Lista: Tlista; elemento: tdato) return Boolean is
      Ptr: Tlista:= Lista;
   begin
      if Vacia (Lista) then
         return False;
      else
         while Ptr /= null loop
            if Ptr.Info= elemento then
               return True;
            end if;
            Ptr:=Ptr.Sig;
         end loop;
      end if;
      return False;
   end Esta;
   

   procedure Insertar (Lista: in out Tlista; Elemento: in Tdato) is
      Nuevonodo: Tlista:= new tnodo'(Elemento, null);
      Ptr, Ant: Tlista;
      Lugarencontrado: Boolean;
   begin
      if Vacia(Lista) then
         Lista:=Nuevonodo;
      else
         if Elemento < Lista.Info then
            Nuevonodo.Sig:=Lista;
            Lista:=Nuevonodo;
         else
            Ptr:=Lista;
            Lugarencontrado:=False;
            while not Lugarencontrado and Ptr /= null loop
               if Elemento > Ptr.Info then
                  Ant:=Ptr;
                  Ptr:= Ptr.Sig;
               else
                  Lugarencontrado:= true;
               end if;
            end loop;
            Nuevonodo.Sig:= Ptr;
            if Ant= null then
               Lista:=Nuevonodo;
            else
               Ant.Sig:=Nuevonodo;
            end if;
         end if;
      end if;
   end Insertar;


   procedure Suprimir (Lista: in out Tlista; Elemento: in Tdato) is -- hace falta ver si esta ele elemento primero
      Actual: Tlista:=Lista;
      Ant: Tlista:=null;
   begin
      while Actual /= null and then Actual.Info < Elemento loop
         Ant:=Actual;
         Actual:= Actual.Sig;
      end loop;
      if Ant = null then
         Lista:= Lista.Sig;
      else
         Ant.Sig:= Actual.Sig;
      end if;
      Free (Actual);
   end Suprimir;
   

   procedure Limpiar (Lista: in out Tlista) is
      Temp: Tlista:= Lista;
   begin
      while lista /= null loop
         Temp:=Lista;
         Lista:= Lista.Sig;
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
   

end Listaenlazadaordenada;

      
