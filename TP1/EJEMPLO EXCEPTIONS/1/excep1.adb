with Ada.Float_Text_Io, Ada.Integer_Text_Io, Ada.Text_Io;
use Ada.Float_Text_Io, Ada.Integer_Text_Io, Ada.Text_Io;
procedure Excep1 is 
   Vec: array(1..10) of float;
   B:Integer;
begin
   Get(B);
   Vec(B):=10.0;
   Put(Vec(B),4,2,0);
   Put(B);
exception
   when Constraint_Error => begin Put_Line("error de indice"); Put(B);end;
   when data_error => begin put_line("error de tipo"); b:=18; put("debe ingresar un valor numerico");end;
      
      end Excep1; 
      
