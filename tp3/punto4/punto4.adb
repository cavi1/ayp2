with Ada.Integer_Text_Io, ada.Text_IO;
use Ada.Integer_Text_Io, ada.Text_IO;
procedure Punto4 is
   
   function Productoria (X: Integer) return integer is
   begin
      if X=1 then
         return 1;
      else 
         return x * Productoria (X-1);
      end if;
   end Productoria;
   
   X,prod:Integer;
   
   
begin
   Get(X);
   if X < 0 then
      X:= X * (-1);
   end if;
   Prod:=Productoria(X);
   Put(" la productoria de" &Integer'Image(X)& " es" &Integer'Image(Prod));
   
end Punto4;

   
