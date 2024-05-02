with Listaord, Ada.Sequential_Io, Ada.Text_Io;
use ada.Text_IO;

procedure Tp6ej6 is

longcade:natural:=12;


   subtype Cade is String(1..Longcade);
   
   type Templeado is record
      Apellido:Cade;
      Long_apellido:natural;      
      Nombre:Cade;
      Telefono:Cade;
      Long_Telefono:Natural;
   end record;

   function "<" (X,Y: Templeado) return Boolean is
   begin
      return X.Apellido < Y.Apellido;
   end "<";
      

   function ">" (X,Y: Templeado)return Boolean is
   begin
      return X.Apellido > Y.Apellido;
   end ">";
   
   
   package Listaorden is new Listaord(Templeado, "<", ">");
   use Listaorden;
  

   package lista_empleados is new ada.Sequential_IO(templeado);
   use lista_empleados;
   
   procedure Bajar_Archivo(Lista: out Tipolista) is
      
      F_Entrada:lista_empleados.File_Type;
      Regaux:Templeado;
      
   begin
      Open(F_Entrada,In_File,"empleados.dat"); 
        
      while not End_Of_File(F_Entrada) loop
         Read(F_Entrada, regaux);
         Insertar(Lista,Regaux);
      end loop;
      
      Close(F_Entrada);
      
   end Bajar_Archivo;
   
   List:Tipolista;
    
begin
   Bajar_Archivo(List);
   
   while not Vacia(List) loop
      put_line("apellido: ");
      Put(Info(List).Apellido(1..Info(List).Long_Apellido));New_Line;
      Put_Line("nro de telefono: ");
      Put(Info(List).telefono(1..Info(List).Long_telefono));New_Line;
      list:=sig(list);
   end loop;
  
         
end Tp6ej6;

   
   
   

