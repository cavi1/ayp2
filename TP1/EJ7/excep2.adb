with Ada.Text_Io, Ada.Integer_Text_Io;
use Ada.Text_Io, Ada.Integer_Text_Io;

procedure excep2 is
subtype rango is integer range 1..10;
a, b: rango;
begin
get (b);
a := 5 / b + 10;
put (a); put (b);
exception
when constraint_error => a := 8;
when data_error => a := 3;
end Excep2;
--b=5 hace que a=8, ya que a y b
--b=8 ni idea porque funciona
--b=j data error
--b=12 constraint error

