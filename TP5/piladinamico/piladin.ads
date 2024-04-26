generic
   type Telemento is private;
   package PilaDIN is
      type Tpila is private; 
      Underflow:exception;
      procedure Limpiar(Pila: in out Tpila);--crea/limpia la pila
      function Vacia(Pila:Tpila)return Boolean;--chequea si está vacía
      procedure Meter(Pila: in out Tpila; Nuevoelem:in Telemento);--pone un elemento
      procedure Sacar(Pila: in out Tpila; Elemsacado:out Telemento);--saca un elemento y lo guarda
      private
      type TipoNodo;
      type TPila is access TipoNodo;
      type TipoNodo is
      record
         Info: Telemento;
         Sig: Tpila;
      end record;
   end PilaDIN;