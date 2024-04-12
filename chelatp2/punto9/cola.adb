package body Cola is
   

   procedure Limpiar (Cola: in out Tcola) is 
   begin
      Cola.Frente:= Cola.Max;
      Cola.Final:= Cola.Max;
   end Limpiar;
   

   procedure Insertar (Cola: in out Tcola; Elemento: in Tdato) is
   begin
      if Llena (Cola) then
         raise Overflow;
      else
         Cola.Final:= Cola.Final rem Cola.Max + 1;
         Cola.Elementos (Cola.Final) := Elemento;
      end if;
   end Insertar;
   

   procedure Suprimir (Cola: in out Tcola; Elementosup: out Tdato) is
   begin
      if Vacia (Cola) then
         raise Underflow;
      else
         Cola.Frente:=Cola.Frente rem Cola.Max + 1;
         Elementosup:= Cola.Elementos (Cola.Frente);
      end if;
   end Suprimir;
   

   function Llena (Cola: Tcola) return Boolean is
      Siguiente: Positive;
   begin
      if Cola.Final = Cola.Max then
         Siguiente:=1;
      else
         Siguiente:= Cola.Final +1;
      end if;
      return Siguiente = Cola.Frente;
   end Llena;
   

   function Vacia (Cola: Tcola) return Boolean is
   begin
      return Cola.Frente = Cola.Final;
   end Vacia;
end Cola;

         
