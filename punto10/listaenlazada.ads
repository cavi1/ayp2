generic
   type Tdato is private;
   
   package Listaenlazada is
      type Tlista is private;
      Listavacia: exception;
      function Vacia (Lista: Tlista) return Boolean;
      function Esta (Lista: Tlista; Elemento: Tdato) return Boolean;
      procedure Insertar (Lista: in out Tlista; Elemento: in Tdato);
      procedure Suprimir (Lista: in out Tlista; Elemento: in Tdato);
      procedure Limpiar (Lista: in out Tlista);
      function Info (Lista: Tlista) return Tdato;
      function Sig (Lista: Tlista) return Tlista;
      procedure Suprimirporfrente (Lista: in out Tlista; Elemento: out Tdato);
      procedure Insertarporfinal (Lista: in out Tlista; Elemento: in Tdato);


      private
      type Tnodo;
      type Tlista is access Tnodo;
      type Tnodo is record
         Info: Tdato;
         Sig: Tlista;
      end record;
   end Listaenlazada;