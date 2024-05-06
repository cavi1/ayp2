generic
   type Tipoelem is private;
   
   with function "<" (X, Y: Tipoelem) return Boolean;
   
   with function ">" (X, Y: Tipoelem) return Boolean;
   
package Listaord is
   
      type Tipolista is private;
      
      
      procedure Crear (Lista: out Tipolista);
              
      function Vacia (Lista: Tipolista) return Boolean;
      
      function Esta (Lista: Tipolista; Elem: Tipoelem) return Boolean;
      
      function Estarec (Lista: Tipolista; Elem: Tipoelem) return Boolean;
     
      procedure Insertar (Lista: in out Tipolista; Elemento: in Tipoelem);
      
     --procedure Insertarporfinal (Lista: in out Tipolista; Elem: in Tipoelem);
       
      procedure Suprimir (Lista: in out Tipolista; Elemento: in Tipoelem);
      
      --procedure Suprimirporfrente (Lista:in out Tipolista;Elem: out Tipoelem); 
      
      procedure Limpiar (Lista: in out Tipolista);
      
      function Info (Lista: in Tipolista) return Tipoelem;--info y sig sirven para poder tener acceso directo a la lista desde el prog ppal
      
      function Sig (Lista: in Tipolista) return Tipolista;
      
      Listavacia: exception;
      
      private
         
      type Tiponodo;
      
      type Tipolista is access Tiponodo;
      
      type Tiponodo is record
         
         Info: Tipoelem;
         
         Sig: Tipolista;
         
      end record;
      
   end Listaord;
