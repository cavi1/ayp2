With Ada.Integer_Text_Io, ada.Text_IO;
use ada.Integer_Text_IO, ada.Text_IO;

procedure excep3 is
divnulo: exception;
x, y, z: integer;
begin
put_line ("ingrese x, y");
get (x); get (y);
skip_line;
if y = 0 then raise divnulo; end if;
z := x / y;
put ("resultado:"); put (z); new_line;
exception
when divnulo => put_line ("divisor nulo");
when data_error => put_line ("error dato");
end Excep3;
--x=2 y=2  funciona
--x=0 y=w error dato
--x=5 y=0 divnulo
