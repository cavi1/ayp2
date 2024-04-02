with Ada.Text_Io, Ada.Integer_Text_Io;
use Ada.Text_Io, Ada.Integer_Text_Io;
procedure Excep3 is
   Divnulo:exception;
   X,Y,Z:Integer;
begin
   Put_Line("ingrese x y");
   Get(X);
   Get(Y);
   Skip_Line;
   if Y=0 then
      raise Divnulo;
   end if;   Z:=X/Y;
   Put("Resultado: ");
   Put(Z);
   New_Line;
exception
   when Divnulo => Put_Line("divisor nulo");
   when Data_Error => Put_Line("error dato");
end Excep3;

