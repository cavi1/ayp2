generic 
   type Telemento is private;
   type Tindice is (<>);
   accum:telemento;
   with procedure Get(X:out Telemento);   with procedure Put(X:in Telemento);
   with function "*"(X,Y: Telemento) return Telemento;
   with function "+"(X,Y: Telemento) return Telemento;
   with function Sqrt(X: Telemento) return Telemento;
   with function ">"(X,Y: Telemento) return Boolean;
   with function "-"(x,y:tindice)return tindice;


   package Paqveccom is 
      type Tvec is array(Tindice) of Telemento;
      procedure Leer(Vec:out Tvec);
      procedure Escribir(Vec:in Tvec);
      function Comparacion(Vec1,Vec2:Tvec) return Boolean;
      procedure Ordenamiento(Vec:in out Tvec);
      procedure Busqueda(Vec: in Tvec; Elem: in Telemento; pos:out tindice; found:out boolean);
   end Paqveccom;
   
