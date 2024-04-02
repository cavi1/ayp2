generic   
   type Telemento is private;
   type tFil is (<>);
   type Tcol is (<>);
   with procedure get(X:out Telemento);
   with procedure Put(X:in Telemento);
   with function ">"(X,Y:Telemento)return Boolean;
   with function "-"(x,y:tfil)return tfil;
   
   package Matpaqcom is
      type Matrix is array(Tfil, Tcol) of Telemento;
      procedure escribomat(matriz:in matrix);
      procedure Leomat(Matriz: out Matrix);
      function Comparacion(Mat1,Mat2:matrix)return boolean;
      procedure Ordenamiento(Mat:in out Matrix; Fil:in Tfil;coleleg: in tcol);
      procedure Busqueda(Mat: in Matrix; Elem: in Telemento;Posifils:out Tfil;Posicols:out Tcol; Found: out Boolean);
      type Transmatrix is array(Tcol,Tfil) of Telemento;
      procedure Transponer(Mat1: in Matrix;mat2: out transmatrix);
      procedure escribomattrans(matriz: in transmatrix);
   end Matpaqcom;
   
   
