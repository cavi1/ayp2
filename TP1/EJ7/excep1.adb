with  ada.Integer_Text_IO, ada.Text_IO;
use  ada.Integer_Text_IO, ada.Text_IO;


procedure excep1 is
vec: array(1..10) of float;
b: integer;
begin
get (b);
vec(b) := 10.0;
put (b);
exception
when constraint_error => b := 15;
when data_error => b:= 18;
end Excep1;


--b=5 imprime 5
--b=12 no imprime nada(me lo transforma en 15)
--b=a no imprime nada(me lo transforma en 18)
--b=0 no imprime nada (me lo transforma en 15)

