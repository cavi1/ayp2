generic -- especificación del paquete de lista enlazada no ordenada

   type Tipoelem is private;
   
   package Listacircular is
      
      type Tipolista is private;
      
      procedure Crear (Lista: out Tipolista);
      
      function Vacia (Lista: Tipolista) return Boolean;
      
      function Esta (Lista: Tipolista; Elem: Tipoelem) return Boolean;
      
      --function Estarec (Lista: Tipolista; Elem: Tipoelem) return Boolean;
     
      procedure Insertar (Lista: in out Tipolista; Elemento: in Tipoelem);     
       
      procedure Suprimir (Lista: in out Tipolista; Elemento: in Tipoelem);
          
      procedure Limpiar (Lista: in out Tipolista);
      
      function Info (Lista: in Tipolista) return Tipoelem;--info y sig sirven para poder tener acceso directo a la lista desde el prog ppal
      
      function Sig (Lista: in Tipolista) return Tipolista;
      
      Listavacia: exception;
      
      private
         
      type Tiponodo;
         
      type Tipolista is access Tiponodo;
      
      type Tiponodo is
         
      record
         
         Info: Tipoelem;
         
         Sig: Tipolista;
         
      end record;
      
      
   end Listacircular;