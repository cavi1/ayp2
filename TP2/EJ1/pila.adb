package  body pila is
   
   procedure Limpiar(Pila:in out Tpila) is
   begin
      Pila.Cabeza:=0;
   end Limpiar;
   
   function Vacia(Pila:Tpila) return Boolean is
   begin
      
      return Pila.Cabeza=0;
   end Vacia;
   
   function Llena(Pila:Tpila)  return Boolean is
   begin
      
      return Pila.Cabeza=Pila.Max;
   end Llena;
   
   procedure Meter(Pila:in out Tpila; Nuevoelem:in Telemento) is
   begin
      if Llena(Pila) then
         raise Overflow; --PREGUTAR .la exception deberia detener la ejecucion antes que se modifique cabeza(creo)
      end if;
      Pila.Cabeza:=Pila.Cabeza+1;
      Pila.Elementos(Pila.Cabeza):=Nuevoelem;
   end Meter;
   
   procedure Sacar(Pila: in out Tpila; Elemsacado: out Telemento) is
   begin
      if Vacia(Pila) then
         raise Underflow;--los manejadores se crean en el usa
      end if;
      elemsacado:=pila.elementos(pila.cabeza);
      Pila.Cabeza:=Pila.Cabeza-1;
   end Sacar;


end Pila;