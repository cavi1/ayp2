with Ada.Integer_Text_Io, Paqveccom, ada.Text_IO, ada.Numerics.Elementary_Functions;
use ada.Integer_Text_IO, ada.Text_IO, ada.Numerics.Elementary_Functions;

procedure Clientetp1ej2 is
   subtype Tindex is Integer range 1..5;
   
   procedure Getint(X: out Integer)is
   begin
      Get(X);
      skip_line;
   end Getint;
   procedure Putint(X:in Integer) is
   begin
      Put(X);
   end Putint;
   function Sqrtint(X:Integer)return Integer is
   begin
      return Integer(Sqrt(Float(X)));
   end Sqrtint;
      


   package vecint is new paqveccom(integer,tindex,0,getint,putint,"*","+",sqrtint,">","-");
   
   use vecint;
   V1,V2:Tvec;
   Posi:Tindex;
   esmayor,Encontrado:Boolean;
begin
   Put("ingrese los elementos del vector 1");
   New_Line;
   Leer(V1);
   Put("el vector es:");
   New_Line;
   Escribir(V1);
   
   Put("ingrese los elementos del vector 2");
   New_Line;
   Leer(V2);
   Put("el vector es:");
   New_Line;
   Escribir(V2);
   New_Line;
   
   Esmayor:=Comparacion(V1,V2);
   if Esmayor then
      Put("v1 es mayor que v2");
   else
      Put("v2 es mayor o igual que v1");
   end if;
   New_Line;
   
   Ordenamiento(V1);
   Put("el vector 1 ordenado es");
   New_Line;
   Escribir(V1);
   New_Line;
   
   Busqueda(V1, 3, Posi, Encontrado);
   if Encontrado then
      Put("el elemento fue encontrado, esta en la posicion " & Integer'Image(Posi));
   else
      Put("el elemento no fue encontrado");
   end if;
   
   
end clientetp1ej2;
   
   
   
   
