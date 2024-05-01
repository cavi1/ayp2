--se llena una lista circular con registros que tienen un nombre y un entero asociado 
--elijo una persona y un número N, a partir de ahí avanzo por las personas N veces y en donde caiga elimino, el siguiente avance se hace en base al N de la persona eliminada 
--si tengo A(4) B(6) C(2) D(1) E(9)  y se elige como persona A y como Nro 2, el orden de eliminacion será B D E A C

with Listacircular, Ada.Text_Io, Ada.Integer_Text_Io;
use ada.Integer_Text_IO, ada.Text_IO;

procedure Tp6ej2 is
   
   Participantes:natural:=5;


   type Tregi is record
      
      Nombre:CHARACTER;
      Nro:Natural;
      
   end record;
   

   package Ronda is new Listacircular(Tregi);
      
   use Ronda;
   
   
   procedure Llenaestructura(Lista:in out Tipolista) is--inserto del ultimo al primero ya que en el adb esta programado para que quede apuntando al ultimo ingresado
      Regiaux:Tregi;
   begin
      for I in 1..Participantes loop
         Put_line("ingrese el nombre del participante "&integer'image(i)& ": ");
         Get(Regiaux.Nombre);skip_line;--debo ingresar primero al ultimo participante, por ej: E 
         Put_Line("ingrese el numero del participante "&Integer'Image(I)& ": ");
         Get(Regiaux.Nro);Skip_Line;
         insertar(lista, regiaux);
      end loop;
   end Llenaestructura;
      
      
   procedure Eliminacion(Lista:in out Tipolista) is
      Persona:Character;
      Nro:Natural;
      Primerapersona:Boolean:=True;
      regi:tregi;
   begin
      
      Put_line("ingrese participante: ");
      Get(Persona);Skip_Line;
      Put_Line("ingrese nro: ");
      get(nro);skip_line;
      
      while Info(Lista).Nombre/=Persona loop
         Lista:=sig(lista);
      end loop;--encontré la persona indicada
      
      primerapersona:=true;
      while not Vacia(Lista) loop
         for i in 1..nro loop
         if not Primerapersona then
            Lista:=sig(lista);
            end if;
            Primerapersona:=False;
         end loop;
         Put_line("la persona eliminada es: ");
         Put(Info(Lista).Nombre);new_line;
         Regi.Nombre:=Info(Lista).Nombre;
         Regi.Nro:=Info(Lista).Nro;
         nro:=Info(Lista).Nro;
         Suprimir(Lista,Regi);
      end loop;
   end Eliminacion;       
        
      

   List:Tipolista; 
begin
   
   Llenaestructura(List);
   
   eliminacion(list);
   
exception
   
   when Data_Error => begin Put("error en el tipo de dato"); end;
      
   
   
 
end Tp6ej2;
     
   
