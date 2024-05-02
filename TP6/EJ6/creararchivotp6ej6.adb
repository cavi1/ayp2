with ada.Text_Io,ada.Sequential_IO, ada.characters.handling, ada.Integer_Text_IO; 
use ada.Text_Io, ada.characters.handling, ada.Integer_Text_IO; 


procedure Creararchivotp6ej6 is 
   
   longcade:natural:=12;


   subtype Cade is String(1..Longcade);
   
   type Templeado is record
      Apellido:Cade;
      Long_apellido:natural;      
      Nombre:Cade;
      Telefono:Cade;
      Long_Telefono:Natural;
   end record;
   
   package Archi_Empleado_Sec is new Ada.Sequential_Io(Templeado);
   use Archi_Empleado_Sec;
   
   F_Entrada:Archi_Empleado_Sec.File_Type;
   
   Empleado:Templeado;
    
   procedure Carga_Registro(Persona:out Templeado) is
   long:natural;
   begin
      Put_Line("ingrese el nombre del empleado: ");
      Get_line(Persona.Nombre,long);SKIP_LINE;
      Put_Line("ingrese el apellido del empleado: ");
      Get_Line(persona.Apellido, persona.Long_Apellido); Skip_Line;
      Put_Line("ingrese el numero de telefono del empleado: ");
      Get_Line(Persona.Telefono, Persona.Long_Telefono);Skip_Line;
   end Carga_Registro;
   
begin
   Create(F_Entrada,Out_File,"empleados.dat");
   for I in 1..5 loop
      Carga_Registro(Empleado);
      write(f_entrada, empleado);
   end loop;
   Close(F_Entrada);
end Creararchivotp6ej6;

   
        
