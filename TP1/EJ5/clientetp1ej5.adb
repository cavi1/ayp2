with Pila, Ada.Text_Io;
use ada.Text_IO;

procedure Clientetp1ej5 is
   package Pilaenteros is new Pila(Integer);
      use Pilaenteros;
   package Pilareales is new Pila(Float);
   use Pilareales;
   
   Pilae:Pilaenteros.Tpila(5);--pilaenteros y pilareales se pone porque hay mas de un paquete dentro del código
   Pilar:Pilareales.Tpila(20);--sino no sería necesario
   x:integer;
begin
   Meter(Pilae, 1);
   Meter(Pilae, 2);
   Meter(Pilae, 3);
   Meter(Pilae, 4);
   Meter(Pilae, 5);
   limpiar(pilae);
   Meter(Pilae, 6);

exception
   when Clientetp1ej5.Pilaenteros.Underflow => begin --dudas
      put("no hay nada en la pila");end;
   when Clientetp1ej5.Pilaenteros.overflow => begin
      put("la pila esta llena");end;
      

   
   
end Clientetp1ej5;

