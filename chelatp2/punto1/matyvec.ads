generic
   type Tdato is private;
   type Tindice is (<>);
   type fila is (<>);
   type columna is (<>);
   
   
   with procedure Get (X: out Tdato);
   with procedure Put (X: in Tdato);
   with function "=" (X,Y: Tindice) return Boolean;
   with function "=" (X:Tindice; Y:columna) return Boolean;
   with function "+" (X,Y: Tdato) return Tdato;
   with function "*" (X,Y: Tdato) return Tdato;
   with function ">" (X,Y: Fila) return Boolean;
   with function "<" (X,Y: Tdato) return Boolean;
   with function "/" (X,y: Tdato) return Tdato;
   Valorinicial: Tdato;
   
   

   package Matyvec is
      type Tvector is array (Tindice) of Tdato;
      type Tmatriz is array (Fila, Columna) of Tdato;
      type Tvecmat is array (Fila) of Tdato;
      

      function Dimvec (X,Y: Tindice) return Boolean;
      function Dimvecmat (X: Tindice; Y: columna) return Boolean;
      procedure vecsuma (V1, V2: in Tvector; vresu: out tvector);
      procedure vecprod (V1, V2: in Tvector; vresu: out tvector);
      procedure vecmatprod (V: in Tvector; M: in Tmatriz; vresu: out tvecmat);
      function Matprom (M: Tmatriz) return Tdato;
      procedure Matmax (M: in Tmatriz; Col: out Columna; Fil: out Fila; max: out tdato);
      function Vecmin (V: Tvector) return Tdato;
      function Matsum (M: Tmatriz) return Tdato;
      function Vecprod (V: Tvector) return Tdato;
      function Mattraza (M: Tmatriz) return Tdato;
   end Matyvec;
      
   