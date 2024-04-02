--promedio de una matriz: suma de sus elementos dividido la cantidad de elementos

with ada.Integer_Text_IO, ada.Text_IO, matpaqbas, ada.Float_Text_IO;   
use ada.Integer_Text_IO, ada.Text_IO, ada.Float_Text_IO;

procedure Tp2ej1c is
   
   Maxfils:Integer:=3;
   Maxcols:Integer:=4;

   subtype Fil is Integer range 1..Maxfils;
   subtype Col is Integer range 1..Maxcols;
   
   procedure Getint(X:out Integer) is
     negativo:exception;
   begin
      Get(X); if x<0 then raise negativo; end if;
      Skip_Line;
      
     
   end Getint;
   
   procedure Putint(X:in Integer) is
   begin
      Put(X);
   end Putint;
   
   
   
   package Matint is new Matpaqbas(Integer, Fil, Col, Getint, Putint);
   use matint;
   
   function Promedio(Mat: Matrix) return Float is
      Accum:Float:=0.0;
      Cont:float:=0.0;
   begin
      
      for I in Fil'range loop
         for j in Col'range loop
            Accum:=Accum+float(Mat(I,J));
            Cont:=Cont+1.0;
         end loop;
      end loop;
      return Accum/Cont;
   end Promedio;
    
   M:Matrix;
   Prom:Float;
   negativo:exception;
begin
     
   Put_Line("ingrese la matriz: ");
   Leomat(M);
   Put_Line("la matriz es: ");
   Escribomat(M);
   prom:=Promedio(M);
   new_line;
   Put_Line("el promedio es:" );
   Put(Prom, 6, 3, 0);
   
  
      
   
end tp2ej1c;
   
