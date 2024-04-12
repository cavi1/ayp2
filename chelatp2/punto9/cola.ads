generic
   type Tdato is private;
   package Cola is
      type Tcola (Max: Positive) is private;
      Overflow, Underflow: exception;
      procedure Limpiar (Cola: in out Tcola);
      procedure Insertar (Cola: in out Tcola; elemento: in Tdato);
      procedure Suprimir (Cola: in out Tcola; Elementosup: out Tdato);
      function Llena (Cola: Tcola) return Boolean;
      function Vacia (Cola: Tcola) return Boolean;
      
      private
      type Arreglocola is array (Positive range <>) of Tdato;
      type Tcola (Max:Positive) is
      record
         Elementos: Arreglocola (1..Max);
         Frente: Positive:= Max;
         Final: Positive:= Max;
      end record;
   end Cola;
   
      
