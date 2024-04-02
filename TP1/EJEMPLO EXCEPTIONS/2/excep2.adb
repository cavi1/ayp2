with Ada.Integer_Text_Io, Ada.Text_Io;
use ada.Integer_Text_IO, ada.Text_IO;



procedure Excep2 is 
   X,Y,Z: Integer;
begin
   loop
      begin
         Put_Line("ingrese x,y,z");
         Get(X);
         Get(Y) ;         Get(Z);
         exit;
         exception
         when Data_Error =>
         Put_Line("ingrese los datos nuevamente");         Skip_Line;
      end;
   end loop;
end Excep2;

           
