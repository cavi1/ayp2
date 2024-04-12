package body Pila is
   
   procedure Limpiar (Pila: in out Tpila) is 
   begin
      Pila.Cabeza:=0;
   end Limpiar;
   
   function Vacia (Pila: Tpila) return Boolean is
   begin
      return Pila.Cabeza = 0;
   end Vacia;
   
   function Llena (Pila: Tpila) return Boolean is
   begin
      return Pila.Cabeza = Pila.Max;
   end Llena;
   
   procedure Meter (Pila:in out TPila; Nuevoelemento: in Tdato) is
   begin
      if not Llena(Pila) then
         Pila.Cabeza:= Pila.Cabeza + 1;
         Pila.Elementos(Pila.Cabeza):= Nuevoelemento;
      else raise Overflow;
      end if;
   end Meter;
   
   procedure Sacar (Pila: in out Tpila; Elementosacado: out Tdato) is
   begin
      if not Vacia(Pila) then
         Elementosacado:=Pila.Elementos (Pila.Cabeza);
         Pila.Cabeza:= Pila.Cabeza - 1;
      else
         raise Underflow;
      end if;
   end Sacar;
   
   --procedure Imprimirpila (Pila: in Tpila) is 
   --begin
      --for I in arreglopila'First..arreglopila'Last loop
         --Put (Pila.Elemento(I));
         --New_Line;
      --end loop;
   --end Imprimirpila;
   
   
end pila;      
         
