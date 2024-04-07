package body Cola is
   
   procedure Insertar(Cola: in out Tcola; Nuevoelem: in Telemento)is
   begin
      
      if Llena(Cola)then
         raise Overflow;
         
      else 
         
         if Cola.Final=Cola.Max then--¿quien es cola.max??
            Cola.Final:=1;
         else 
            Cola.Final:=Cola.Final+1;  
         end if;
         
         Cola.Elementos(Cola.Final):=nuevoelem; 
         
      end if;
      
   end Insertar;
   
   
   procedure Suprimir(Cola: in out Tcola; Sacaelem: out Telemento) is
   begin
      
      if Vacia(Cola) then
         raise Underflow;
      else 
         
         if Cola.Frente=Cola.Max then--¿quien es cola.max??
            Cola.Frente:=1;
         else 
            Cola.frente:=Cola.frente+1;  
         end if;
         
         Sacaelem:=Cola.Elementos(Cola.frente); 
         
      end if;

      

   end Suprimir;
   
   function Llena(Cola:Tcola)return Boolean is
      siguiente:positive;
   begin
      
      if Cola.Final=cola.Max then
         Siguiente:=1;
      else Siguiente:=Cola.Final+1;
      end if;
      
      return Siguiente=Cola.Frente;
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
   
   
      
   


         

