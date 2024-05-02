generic 
   type Telemento is private;   type Tindice is (<>);
   with procedure Put(X:in Telemento);
   with procedure Get(X:out Telemento);
   
   package vecUniPaqBas is
      type Tarreglo is array(Tindice) of Telemento;
      procedure Leer(V:out Tarreglo);
      procedure Escribir(V:in Tarreglo);
   end vecUniPaqBas;
      
