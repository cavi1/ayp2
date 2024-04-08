--hacer una pila de vectores de 5 elementos
--a) obtener la sumatoria de las componentes del vector de la cabeza de la pila
--b) obtener La posición del vector dentro de la pila, cuya sumatoria es mayor. (al finalizar el algoritmo la pila debe quedar sin modificaciones) 
--es decir cual de todos los elementos de la pila tiene la mayor sumatoria

with Pila, Vecunipaqbas, Ada.Integer_Text_Io, ada.Text_IO;
use ada.Integer_Text_IO, ada.Text_IO;
procedure Tp2ej8 is

   
Dimvec:integer:=5;
Tamaniopila:Integer:=3; 
  
subtype Tindex is Integer range 1..Dimvec;

procedure Putint(X:in integer) is
begin
   Put(X);
end Putint;

procedure Getint(X: out integer) is
begin
   Get(X);
   end getint;
   
package Vecint is new Vecunipaqbas(integer, Tindex, Putint, Getint);

use Vecint;

package Pilavec is new Pila(Tarreglo);

use Pilavec;

subtype tpila3 is tpila(tamaniopila);

function Sumatoriacabeza(Pila: Tpila3) return integer is
   Pilaux:Tpila3;
   Vec:Tarreglo;
   sum:integer;
begin
   Pilaux:=Pila;
   Sacar(Pilaux, Vec);
   sum:=0;
   for I in Tindex'range loop
      Sum:=Sum+Vec(I);
   end loop;
   return sum;
end Sumatoriacabeza;


function Comparasumatorias(Pila: Tpila3) return integer is
   Pilaux: Tpila3;
   Vec: Tarreglo;
   Mayorsuma, Sum: Integer;
   i,posi:integer:=0;
begin
   pilaux:=pila;
   mayorsuma:=sumatoriacabeza(pilaux);  
   while not Vacia(Pilaux) loop
      
      Sum:=Sumatoriacabeza(Pilaux);
      Sacar(Pilaux, Vec);
      
      if Sum > Mayorsuma then
         posi:=i;
      end if;
      
      I:=I+1;
      
   end loop;
   return posi;
end Comparasumatorias;

   

procedure Llenoestructura(Pila:in out Tpila3) is
vec:tarreglo;
begin
   while not Llena(Pila) loop
      Leer(Vec);
      Meter(Pila, Vec);
   end loop;
end Llenoestructura;

   
Pilavectores:Tpila3;
resu, summayor:integer;
begin
   
   put_line("ingrese los " & integer'image(dimvec*tamaniopila)& " de la estructura: ");   
   Llenoestructura(Pilavectores); 
   Put_Line("la sumatoria de los elementos de la cabeza de la pila es: ");
   resu:=sumatoriacabeza(pilavectores); --punto a)  
   Put(Resu);
   New_Line;
   Put_Line("la posicion en la pila del vector al que corresponde la sumatoria mas grande es: ");
   summayor:=comparasumatorias(pilavectores);
   Put(tamaniopila-summayor);
      


   
end Tp2ej8;

   
   
   
