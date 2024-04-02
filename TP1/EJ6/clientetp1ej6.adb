with Cola;

procedure Clientetp1ej6 is  

   package Colaenteros is new Cola(Integer);
   use Colaenteros;
   
   package Colareales is new Cola(float);
   use Colareales;
   
   Colae:Colaenteros.Tcola(5);
   Colar:Colareales.Tcola(10);
   
begin

   null;end Clientetp1ej6;
   
   
   
