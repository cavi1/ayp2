generic   
   type Telemento is private;
   type tFil is (<>);
   type Tcol is (<>);
   with procedure get(X:out Telemento);
   with procedure Put(X:in Telemento);
   
   package Matpaqbas is
      type Matrix is array(Tfil, Tcol) of Telemento;
      procedure escribomat(matriz:out matrix);
      procedure Leomat(matriz: in matrix);
   end Matpaqbas;
   
      
   
