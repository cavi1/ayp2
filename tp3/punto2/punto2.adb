with Ada.Integer_Text_Io, ada.Text_IO;
use Ada.Integer_Text_Io, ada.Text_IO;

procedure Punto2 is
   
   function Incognita (N: Integer) return Integer is
   begin
      if N=0 then
         return Incognita (N);
      else
         return Incognita (N / 3 +1) + N -1;
      end if;
   end Incognita;

N: Integer;

begin
   Get(N);
   Put(" el valor de la incognita es" &Float'Image(Float(Incognita(N))));
end Punto2;

