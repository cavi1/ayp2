--crear un vector de 5 pilas 
--a)debe imprimir en pantalla a los elementos de la cabeza de la pila de las posiciones impares del vector ( v(1) v(3) v(5) )
--b)debe imprimir en pantalla la suma de los elementos de las pilas de las posiciones pares del vector  ( v(2)  v(4) )
--no especifica el uso de estructuras auxiliares ni el tipo dde dato (voy a usar integer positivos)

with Pila, Vecunipaqbas, Ada.Integer_Text_Io, Ada.Text_IO;
use Ada.Integer_Text_Io, Ada.Text_IO;




procedure Tp2ej7 is
  --¿puedo crear un tipo y luego cambiarlo desde aca para que se cambie en todos lados?
   Dimvector:Integer:=5; 
   tamaniopila:integer:=3;

   subtype Tindex is Integer range 1..Dimvector;
   
   package Pilaint is new Pila(integer);
     
   use Pilaint;
   
   subtype tpila3 is tpila(tamaniopila);
       
            
   procedure Putpil(X:in Tpila3) is-- ni lo use pero bueno
      Elem:Integer;
      y:tpila3;
   begin
      Y:=X;
      while not vacia(y) loop
         Sacar(Y,Elem);
         Put(Elem);
      end loop;
      
   end Putpil;
   
      
   procedure Getpil(X:out Tpila3) is
   elem:integer;
   begin
      limpiar(x);
      while not llena(x) loop
      Get(Elem);skip_line;
       Meter(X, Elem);
      end loop;
      
   end getpil;
      
   
   package Vecpilas is new Vecunipaqbas(tpila3, Tindex, Putpil, Getpil);
   use Vecpilas;
   
   vpila:tarreglo; --arreglo de dimvector elementos de pilas de tamaniopila elementos
   
   

   procedure Solocabezasimpares(Vec:in Tarreglo) is
      Pilaux:Tpila3;
      elem:integer;
   begin
      for I in Tindex'range loop
         pilaux:=vec(i);
         if I mod 2 /=0 then
            Sacar(pilaux, Elem);
            Put(Elem);
         end if;
      end loop;
   end Solocabezasimpares;
   
      
      
   
   procedure Sumapilaspospares (Vec: in Tarreglo) is
      Pilaux:Tpila3;
      Elem, sum:Integer;
   begin
      for I in Tindex'range loop
         Pilaux:=Vec(I);
         sum:=0;
         if I mod 2=0 then
            while not vacia(pilaux) loop
            Sacar(Pilaux, Elem);
            Sum:=Sum+Elem;
            end Loop;
               Put(Sum);
         end if;
      end loop;
   end Sumapilaspospares;
      
           
               
      
              
begin
   Put_line("ingrese los " & Integer'Image(Dimvector*Tamaniopila) & " elementos del vector de pilas");
   
   Leer(Vpila);
   
   Put_Line("el/los elemento/s de la cabeza de la/s pila/s de la/s posicion/es impar/es es/son: ");
   
   Solocabezasimpares(Vpila);
   new_line;
   
   put_line("la/s sumatoria/s de la/s pila/s de la/s posicion/es par/es del vector es/son: ");
   sumapilaspospares(vpila);
   
exception
   when Data_Error => begin
         Put("error dato"); end;
         
   
   
   

      
end Tp2ej7;

   
