with Ada.Text_Io, ada.Characters.Handling, ada.Integer_Text_IO;
use ada.Text_IO, ada.Characters.Handling, ada.Integer_Text_IO;

package body Receta is
   
   procedure Creolistaingredientes(Listaing:out Tipolista) is
      Regi:Tingrediente;
      rta:character;
   begin
      Crear(Listaing);
      Limpiar(Listaing);
      loop
         
         loop
         begin
         Put_Line("ingrese ingrediente: ");
         Get_Line(Regi.Nombre_Ingrediente,Regi.Long_Nombre_Ingrediente);
         Put_Line("ingrese cantidad del ingrediente en gramos: ");          
         Get(Regi.Ingrediente_Cantidad);Skip_Line;
         Insertar(Listaing,Regi);
         put_line("ingrediente insertado con exito ");      
         exit; 
                     
         exception
         when Data_Error =>
               Put_Line("vuelva a ingresar los datos: "); New_Line;
         end;
         
         end loop;
      
         
         Put_Line("presione 'S' si desea seguir ingresando ingredientes: ");
         Get(Rta); Skip_Line;
         Rta:=To_Upper(Rta);
         
         exit when Rta='S';
         
   end loop;       
            
end Creolistaingredientes;

procedure Cargofecha(Regifecha:out Tregi_Fecha) is
   Bisiesto,Treintayuno,Treinta,Febrero:Boolean:=False;
   Discrepancia:exception;
begin
   
   loop
   begin
         
   Put_Line("ingrese anio: ");
   Get(Regifecha.Anio);Skip_Line;
   
   if Regifecha.Anio rem 4 = 0 then
      Bisiesto:=True;
   end if;
   
   Put_Line("ingrese mes: ");
   Get(Regifecha.Mes);skip_line;
   
   case Regifecha.Mes is
      when 1|3|5|7|8|10|12 => Treintayuno:=True;
      when 4|6|9|11 => Treinta:=True;
      when others => Febrero:=True;
   end case;
       
   Put_Line("ingrese dia: ");
   Get(Regifecha.Dia);skip_line;
   
   if Regifecha.dia > 30 and not Treintayuno then
      raise Discrepancia;
   end if;
   
   if Regifecha.Dia > 28 and Febrero and not bisiesto then
      raise Discrepancia;
   end if;
   
   if Regifecha.Dia > 29 and Febrero and Bisiesto then
      raise Discrepancia;
   end if;
   
   exit;
   
   exception
      when Data_Error => Put_Line("error en el tipo de dato, vuelva a ingresar la fecha: ");New_Line;
  
      when constraint_error => Put_Line("error en el rango numerico, vuelva a ingresar la fecha: ");New_Line;
   
      when Discrepancia => Put_Line("los datos de fecha ingresados no son validos, vuelva a ingresar la fecha: ");New_Line;
   end;
   
end loop;

   
   
end Cargofecha;
   


procedure Creareceta(Receta:out Treceta) is
begin
   Put_Line("ingrese el nombre de la receta: ");
   Get_Line(receta.Nombre_Receta,receta.Long_Nombre_receta);
   Put_Line("ingrese la lista de ingredientes: ");
   Creolistaingredientes(Receta.Lista_Ingredientes);
   Put_Line("ingrese el modo de preparacion de la receta: ");
   Get_Line(receta.Modo_Preparacion,receta.Long_Modo_Preparacion);
   put_line("ingrese el tiempo de preparacion en minutos: ");
   Get(Receta.Tiempo_Preparacion);Skip_Line;
   Put_Line("a continuacion debera ingresar la fecha de uso: ");
   Cargofecha(Receta.Fecha_Uso);
   put_line("la receta ha sido creada con exito");      
end Creareceta;

procedure Agregaingrediente(Receta:in out Treceta) is
begin
   null;
end Agregaingrediente;

   
procedure Eliminaingrediente(Receta:in out Treceta) is
begin
   null;
end Eliminaingrediente;

procedure Desplegareceta(Receta:in Treceta) is
begin
   null;
end Desplegareceta;



      
 end Receta;
   
      


