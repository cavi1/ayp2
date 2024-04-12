generic
   type Telemento is private;
   type Tindice is (<>);
   
   with procedure Put (X: in Telemento);
   with procedure Get (X: out Telemento);
   
   with function "+" (X,Y: in Telemento) return Telemento;
   with function "*" (X,Y: in Telemento) return Telemento;
   
   package Vector is 
      type Tvector is array (Tindice) of Telemento;
      procedure Leer (V: out Tvector);
      procedure Imprimir (V: in Tvector);
   end Vector;
   
