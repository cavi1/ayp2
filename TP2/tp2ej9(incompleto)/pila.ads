generic
   type Telemento is private;
   package Pila is
      type Tpila(Max:Positive) is  private;-- si agrego limited antes de private significa que este tipo d edato sólo puede ser operado con las operaciones de abajo
      Underflow, Overflow:exception;
      procedure Limpiar(Pila: in out Tpila);--crea/limpia la pila
      function Vacia(Pila:Tpila)return Boolean;--chequea si está vacía
      function Llena(Pila:Tpila)return Boolean;--chequea si esta llena
      procedure Meter(Pila: in out Tpila; Nuevoelem:in Telemento);--pone un elemento
      procedure Sacar(Pila: in out Tpila; Elemsacado:out Telemento);--saca un elemento y lo guarda
      private
      type Arreglopila is array(Positive range <>) of Telemento;
      type Tpila (Max:Positive) is record
         Cabeza:Natural:=0;
         Elementos:Arreglopila(1..Max);
      end record;
   end Pila;