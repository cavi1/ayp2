generic
   type Telemento is private;
   package Coladin is
      type Tcola is private;-- diferencia entre private y limited private: private se define en usar y limited private se define en el paquete mas abajo
      colavacia: exception;
      procedure limpiar(Cola: in out Tcola);
      procedure Insertar(Cola: in out Tcola; Nuevoelem: in Telemento);
      procedure Suprimir(Cola: in out Tcola; Sacaelem: out Telemento);
      function Vacia(Cola:Tcola) return Boolean;
      private
         
      type TipoNodo;
      type Tipopun is access Tiponodo;-- y mediante el tipopun accedo al nodo que tambien tiene un puntero adentro
      
      type Tiponodo is
         
      record
         
         Info: Telemento;
         
         Sig: Tipopun;
         
      end record;
      
      type Tcola is
         
      record
         
         Frente, Final: Tipopun;--mediante este registro accedo al tipopun 
         
      end record;
      
      end Coladin;
