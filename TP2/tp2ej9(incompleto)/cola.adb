package body Cola is
   
   procedure Insertar(Cola: in out Tcola; Nuevoelem: in Telemento)is
   begin
      
      if Llena(Cola)then
         raise Overflow;
      end if;
      
      if Cola.Final=Cola.Max then--¿quien es cola.max??

         cola.frente:=1; 
      else Cola.Final:=Cola.Final+1;
      end if;
      
      Cola.Elementos(Cola.Final):=Nuevoelem;
      
    end Insertar;
   
   
   procedure Suprimir(Cola: in out Tcola; Sacaelem: out Telemento) is
   begin
      
      if Vacia(Cola) then
         raise Underflow;
      end if;
   
      if Cola.Frente=cola.Max then
         Cola.Frente:=1;
      else Cola.Frente:=Cola.Frente+1;
      end if;
      
      sacaelem:=cola.elementos(cola.frente);
      

   end Suprimir;
   
   function Llena(Cola:Tcola)return Boolean is
      siguiente:positive;
   begin
      
      if Cola.Final=cola.Max then
         Siguiente:=1;
      else Siguiente:=Cola.Final+1;
      end if;
      
      return Siguiente =Cola.Frente;
   end Llena;
   
   function Vacia(Cola:Tcola) return Boolean is
   begin
      return Cola.Frente=Cola.Final;
   end Vacia;
   
   procedure Limpiar(Cola: in out Tcola) is
   begin
      Cola.Frente:=Cola.Final;-- hace cola.frente:=cola.max cola.final:=cola.max ¿no es lo mismo?
   end Limpiar;
   
end cola;
   
   
      
   


         

