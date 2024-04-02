with ada.Integer_Text_IO, ada.Text_IO;
use ada.Integer_Text_IO, ada.Text_IO;

procedure excep4 is
subtype rango is integer range 1..10;
cero: exception;
x, y: rango;
begin
get (y);
if Y = 0 then raise Cero; end if; 
   x := 9 / y + 8;
put (x); put (y);
exception
when constraint_error => x := 5;
when data_error => x := 7;
when cero => y := 1;
end excep4;
-- y=2 constraint error xq x vale mas q 10
-- y=z data error
-- y=0 raise cero
--y=9 funciona 

