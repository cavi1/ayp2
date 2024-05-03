--En un lavadero de autos se mantiene una lista de empleados cuyos elementos son registros
--que contienen el nombre de un empleado y una cola (implementada dinámicamente) de
--números de patentes de autos. Escribir un programa que incluya un procedimiento para
--imprimir el nombre del empleado y la patente del próximo auto a ser atendido. Los nombres de
--los empleados y de los restantes autos se deben mantener. 

--lista contiene registro con empleados y cola de patentes, debo imprimir el empleado y la patente y si lo invoco de vuelta me debe arrojar la siguiente patente 
-- que le corresponda atender al empleado, osea que el empleado debe ser un parametro del procedimiento ya que le puedo pasar cualquier empleado

with Ada.Integer_Text_Io, Ada.Text_Io, Coladin, Listacircular;
use ada.Integer_Text_IO,ada.Text_IO;
 
procedure Tp6ej9 is

   Cantpatentes:Natural:=3;
   Cantempleados:Natural:=2;
   


subtype Cade is String(1..10);
   
    type Tregipatente is record
      Patente:Cade;
      Long_Patente:Natural;
   end record;
   


package colapatentes is new coladin(tregipatente);
use Colapatentes;
   

   type Tregiempleado is record
      Empleado:Cade;
      long_nombre:natural;
      Patentes:Tcola;
   end record;
   
   package Listaempleados is new Listacircular(Tregiempleado);
   use Listaempleados;
   
   procedure Llenalista(Lista: in out Tipolista) is--hago 2 empleados y la cola tiene 3 patentes en total
      Regipat:Tregipatente;
      Regiemp:Tregiempleado;
      colapat:tcola;
   begin
      

      for i in 1..Cantpatentes loop 
                       
            Put_line("ingrese la patente numero " & Integer'Image(i) );
            
            Get_Line(Regipat.Patente,Regipat.Long_Patente);
            
            Insertar(Colapat,Regipat);
            
         end loop;



      for i in 1..Cantempleados loop 
              
         Put_Line("ingrese el nombre del empleado "& Integer'Image(i));
         
         Get_Line(Regiemp.Empleado,Regiemp.Long_Nombre);
         
         Regiemp.Patentes:=Colapat;
         
         Insertar(Lista, Regiemp);

         
      end loop;
         
      
   end Llenalista;


   procedure Siguiente(Lista: in out Tipolista) is
      Regipat:Tregipatente;
      Ptrpat:Tcola:=Info(Lista).Patentes;--refiere a una cola de registros de patentes
      ptr:tipolista:=lista;
   begin
 
      while not vacia(ptrpat) loop
         Put_Line("el empleado es "& Info(Lista).Empleado(1..Info(Lista).Long_Nombre));
         
         Suprimir(Ptrpat, Regipat);
         
         Put_line("le corresponde la patente: "& Regipat.Patente(1..Regipat.Long_Patente));
         
         Lista:=Sig(Lista); --como la lista es circular nunca se vacía da lo mismo donde caiga, le va a tocar la siguiente patente hasta que se acaben
      end loop;
         
      
      
   end siguiente;

   List:Tipolista;
   
begin
   Llenalista(List);
   siguiente(list);
end Tp6ej9;

      
                
   
      
