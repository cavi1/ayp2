--Dado un vector cuyos elementos son pilas (con implementación dinámica) de registros
--compuestos por dos campos, uno de tipo entero y el otro de tipo carácter, programar un
--procedimiento que permita obtener el promedio de los valores enteros contenidos en los
--registros que están en el tope de cada pila. Se debe conservar la información almacenada
--en la estructura.

with Piladin, Vecunipaqbas, ada.Integer_Text_IO, ada.Text_IO, ada.Float_Text_IO;
use ada.Integer_Text_IO, ada.Text_IO, ada.Float_Text_IO;


procedure tp6ej1 is

   type Tregi is record
      
      Entero:Integer;
      Char:Character;
      
   end record;
      
   package Pilaregisdin is new Piladin(Tregi);
      
   use Pilaregisdin;  
   
   Tamaniovec:Positive:=3;
   
   subtype Tindex is Positive range 1..Tamaniovec;
   
   procedure Putint(X:in tpila) is
   begin
      null;
   end Putint;
   
   procedure getint(X:out tpila) is
   begin
      null;
   end Getint;
    
   package Vecpilasregis is new Vecunipaqbas(TPILA, Tindex, Putint, Getint);
   
   use Vecpilasregis;
    
   regi:tregi;
   pil1,pil2,pil3:tpila;--tuve que hacer 3 pilas distintas, ya que si usaba la misma pila, perdía la referencia del elemento de la cabeza cada vez que cargaba un elemento y ademas los elementos iniciales se mantenian
   V:Tarreglo;
   
   

   --como la pila no tiene limite debo ir llenando la pila cargarla en el vector y luego limpiarla 
   --y llenarla de vuelta, sino el vector va a quedar con todos los elementos iguales
   

   procedure Promedio(V:in Tarreglo) is
         Pilaux:Tpila;
         Regaux:Tregi;
         Sumatoria:float:=0.0;
         Prom,total:Float;
      
   begin
      for i in v'range loop
         Pilaux:=V(I);
         Sacar(Pilaux, Regaux);
         Sumatoria:=Sumatoria+Float(Regaux.Entero);
         Total:=Float(I);
         meter(pilaux,regaux);--para que vuelva a quedar todo como estaba
      end loop;
      
      Prom:=Sumatoria/total;
      
      put_line("el promedio de los valores enteros de los registros contenidos en la cabeza de la pilas de cada una de las celdas del vector es"); 
      
      Put(Prom,3,4,0);

   end Promedio;
        

begin
  
   Regi.Entero:=5;
   Regi.Char:='a';
   Meter(Pil1,Regi);
   Regi.Entero:=6;--este queda en la cabeza de pil1
   Regi.Char:='b';
   Meter(Pil1,Regi);
   V(1):=Pil1;
   
   
   


  Regi.Entero:=7;
  Regi.Char:='c';
  Meter(Pil2,Regi);
  Regi.Entero:=8;
  Regi.Char:='d';
  Meter(Pil2,Regi);
  Regi.Entero:=9;.-- este queda en la cabeza de pil2
  Regi.Char:='f';
  Meter(Pil2,Regi);
  V(2):=Pil2;
  
  

   
  Regi.Entero:=10;--este queda en la cabeza de pil3
  Regi.Char:='g';
  Meter(Pil3,Regi);
  V(3):=Pil3;
   
  

   
   --llene un vector de 3 celdas con pilas dinamicas...
   
   --obtener el promedio de los valores enteros contenidos en los
   --registros que están en el tope de cada pila. Se debe conservar la información almacenada
   --en la estructura.

   promedio(v);
   
   

      
   
end Tp6ej1;

      
   
