with Ada.Integer_Text_Io, ada.Text_IO,vecunipaqbas, matpaqbas;
use ada.Integer_Text_IO, ada.Text_IO;

procedure Tp2ej1b is

   --condicion para multiplicar vectores : que sean iguales, se multiplica elemento a elemento, si inicializo dos con el mismo paquete no debería haber problema ya que su dim es igual.
   --condicion para multiplicar matrices con vectores : en la consigna me dice que debo multiplicar vector por matriz, por lo tanto voy a considerar la multiplicacion en ese orden (V*M) y no al revés.
   --sabiendo que el vector es de 1*m, la condicion para poder realizar la multiplicacion con una matriz, es que esta sea de m*n, y por lo tanto, el resultado de esta multiplicacion será un vector de 1*n.

   Maxdimvec:integer:=5;
   Maxfilmat:integer:=5;
   Maxcolmat:Integer:=2;

   subtype Tindex is Integer range 1..maxdimvec;
   subtype Tfils is Integer range 1..maxfilmat;
   subtype tcols is integer range 1..maxcolmat;
   
     
   procedure Putint(X:in Integer) is
   begin
      Put(X);
   end Putint;
   
   procedure getint(X:out Integer) is
   begin
      Get(X);
      skip_line;
   end Getint;
   
   package Vecint1 is new Vecunipaqbas(Integer, Tindex, Putint, Getint);
   
   function Dimcheck(Vecdim, Matfil:Integer) return Boolean is
   begin
      return Vecdim=Matfil;
   end Dimcheck;
   
   
   package Matint is new Matpaqbas(Integer, Tfils, Tcols, Getint, Putint);
   use Vecint1;
   use Matint;
   
   procedure Prodvecint(Vec1,Vec2:in Tarreglo; vec3:out tarreglo) is
   begin
      for I in Tindex'range loop
         Vec3(I):=Vec1(I)*Vec2(I);
      end loop;
   end Prodvecint;
   
   package Vecint2 is new Vecunipaqbas(Integer, Tcols, Putint, Getint);
   use Vecint2;
   
   
   procedure Prodmatvecint(Vec:in vecint1.tarreglo; Mat:in Matrix ; Resu: out vecint2.tarreglo) is
   accum:integer:=0;
   begin
      
      for I in Tcols'range loop
         for J in Tfils'range loop
            Accum:=Accum+Vec(J)*Mat(J,I);
            end loop;
         Resu(I):=Accum;
         accum:=0;
      end loop;
      
   end Prodmatvecint;


   V1:vecint1.tarreglo;
   M1:Matrix;
   vecresu:vecint2.tarreglo;
      
      

begin
   
   loop
   begin
   Put_line("ingrese un vector:");
   Leer(V1);
   Put_Line("el vector es: ");
   Escribir(V1);
   New_Line;
   Put_Line("ingrese la matriz: ");
   Leomat(M1);
   Put_Line("la matriz es: ");
   Escribomat(M1);
   exit;
      
   exception
   when Data_Error=>begin
      Put_line("error en el dato, vuelva a realizar el ingreso");skip_line;
         end;
         
   end; 
end loop;
  
   
    
   if not Dimcheck(Maxdimvec, Maxfilmat) then
      Put("no puede realizarse el producto");
   else
      Prodmatvecint(V1, M1, Vecresu);
      Put_Line("el vector resultante es: ");
      escribir(vecresu);
   end if;   


end Tp2ej1b;

   

   


