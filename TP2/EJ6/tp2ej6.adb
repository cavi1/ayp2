--quitar elementos de una cola sin usar estructuras auxiliares en este caso los elementos pares 
with Cola, Ada.Integer_Text_Io;
use ada.Integer_Text_IO;
procedure Tp2ej6 is
   

   package Colaposi is new Cola(Positive);
   use Colaposi;
  
   Colap:Tcola(8);
   I:Positive:=1;
   elem:positive;
begin

   --Insertar(Colap, 34);
   --Insertar(Colap, 53);
   --Insertar(Colap, 11);
   --Insertar(Colap, 24);
   --Insertar(Colap, 32);
   --Suprimir(Colap, Elem);
   --Put(Elem);
   --Suprimir(Colap, Elem);
   --Put(Elem);
   --Suprimir(Colap, Elem);
   ---Put(Elem);
   --Suprimir(Colap, Elem);
   --Put(Elem);
   --Suprimir(Colap, Elem);
   --Put(Elem);


   

   
   while not Llena(Colap) loop     Insertar(Colap, I);
      I:=I+1;
   end loop;
   
   
   for j in 1..i loop --como mucho tiene i elementos impares
      
      Suprimir(Colap, Elem);
      if Elem mod 2 /= 0 then
         Insertar(Colap, Elem);
     end if;
      
   end loop;
   
   while not Vacia(Colap) loop
         Suprimir(Colap, Elem);
     Put(Elem);
   end loop;
   
end Tp2ej6;

   
      
