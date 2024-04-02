with ada.Integer_Text_IO, ada.Text_IO;
use Ada.Integer_Text_Io, Ada.Text_Io;

procedure ejemploexcep is
subtype rango is integer range 1..25;
c, d, e: rango;
 procedure proc (a, b: integer; c: out rango) is
begin
 c:= 1;
 for i in 1..b loop
 c:= c * a;
 end loop;
exception
 when constraint_error => put ("valor fuera de rango");
end proc;
begin
 get (c);
 get (d);
proc (c, d, e);
c := 15 / d *e;
put (c); put (d); put (e);
exception
when constraint_error => c := 15;
when data_error => c := 18;
end ejemploexcep;
--c=p data error
--c=1 d=2 funciona
--c=2 d=3 constraint

