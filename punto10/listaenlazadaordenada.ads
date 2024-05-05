generic 
   type Tdato is private;
   with function "<" (X,Y: Tdato) return Boolean;
   with function ">" (X,Y: Tdato) return Boolean;
   
   package Listaenlazadaordenada is
      type Tlista is private;
      Listavacia :exception;
      function Vacia (Lista: Tlista) return Boolean;
      function Esta (Lista: Tlista; Elemento: Tdato) return Boolean;
      procedure Insertar (Lista: in out Tlista; Elemento: in Tdato);
      procedure Suprimir (Lista: in out Tlista; Elemento: in Tdato);
      procedure Limpiar (Lista: in out Tlista);
      function Info (Lista: Tlista) return Tdato;
      function Sig (Lista: Tlista) return Tlista;
      
      private
      type Tnodo;
      type Tlista is access Tnodo;
      type Tnodo is record
         Info: Tdato;
         Sig: Tlista;
      end record;
   end Listaenlazadaordenada;
   
      
      
