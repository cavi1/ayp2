generic
   type Telemento is private;
   package Cola is
      type Tcola(Max:Positive) is  private;-- diferencia entre private y limited private: private se define en usar y limited private se define en el paquete mas abajo
      Overflow, Underflow: exception;
      procedure Limpiar(Cola: in out Tcola);
      procedure Insertar(Cola: in out Tcola; Nuevoelem: in Telemento);
      procedure Suprimir(Cola: in out Tcola; Sacaelem: out Telemento);
      function Llena(Cola: Tcola) return Boolean;
      function Vacia(Cola:Tcola) return Boolean;
      private
      type Arrcola is array (Positive range <>) of Telemento;
      type Tcola(Max:Positive) is record
         Elementos:Arrcola(1..Max);
         frente:positive:=max;
         Final:Positive:=Max;
      end record;
      end Cola;
      
         
      
