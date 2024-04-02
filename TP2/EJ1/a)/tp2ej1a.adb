with Vecunipaqbas, Ada.Integer_Text_Io, ada.Text_IO;
use ada.Integer_Text_IO, ada.Text_IO;

procedure Tp2ej1a is --suma de vectores elemento a elemento (la dimension de los vectores debe ser igual)
   
   subtype Tindex is Integer range 1..6;--la dimension siempre va a ser igual si inicializo dos vectores con el mismo paquete...
   
   procedure Putint(X:in Integer) is
   begin
      Put(X);
   end Putint;
   
   procedure getint(X:out Integer) is
   begin
      Get(X);
      skip_line;
   end Getint;
   
   package Vecint1 is new Vecunipaqbas(Integer, Tindex, Putint, Getint);

      
   use Vecint1;
   
   Vec1,Vec2,Vec3: Tarreglo;
   
   procedure Suma(Vec1,Vec2:in Tarreglo; Vec3: out Tarreglo)is
   begin
      
      for I in Tindex'range loop
         Vec3(I):=Vec1(I)+Vec2(I);
      end loop;
   end Suma;
   
begin
   
   loop
   begin
      
   Put("escriba vec1: ");
   new_line;
   Leer(Vec1);
   New_Line;
   Put("escriba vec2: ");
   New_Line;
   Leer(Vec2);
   New_Line;
   suma(vec1,vec2,vec3); 
   Put("la suma de vec1 y vec 2 es: ");
   New_Line;
   Escribir(Vec3);
   exit;
      
   exception
         when Data_Error => begin
         Put_line("error en tipo de dato, ingrese nuevamente...");skip_line; 
         end;
         
   end;
   end loop;
   
 end Tp2ej1a;

      
         
   

         
       
   

