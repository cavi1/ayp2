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
         Regi.Nombre_Ingrediente(1..Regi.Long_Nombre_Ingrediente):=to_upper(Regi.Nombre_Ingrediente(1..Regi.Long_Nombre_Ingrediente));  
         Put_Line("ingrese cantidad del ingrediente en gramos: ");          
         Get(Regi.Ingrediente_Cantidad);Skip_Line;
         Insertar(Listaing,Regi);
         put_line("ingrediente insertado con exito ");      
         exit; 
                     
         exception
         when Data_Error =>
               Put_Line("error e el tipo de dato vuelva a ingresar los datos: "); Skip_Line;
         when constraint_Error =>
               Put_Line("el string es demasiado largo, vuelva a ingresar los datos: "); skip_Line;
         end;
         
         end loop;
      
         
         Put_Line("presione 'S' si desea seguir ingresando ingredientes: ");
         Get(Rta); Skip_Line;
         Rta:=To_Upper(Rta);
         
         exit when Rta/='S';
         
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
      when Data_Error => Put_Line("error en el tipo de dato, vuelva a ingresar la fecha: ");skip_Line;
  
      when constraint_error => Put_Line("error en el rango numerico, vuelva a ingresar la fecha: ");skip_Line;
   
      when Discrepancia => Put_Line("los datos de fecha ingresados no son validos, vuelva a ingresar la fecha: ");skip_Line;
   end;
   
end loop;

   
   
end Cargofecha;
   

procedure Creareceta(Receta:out Treceta) is
begin
   Put_Line("ingrese el nombre de la receta: ");
   Get_Line(Receta.Nombre_Receta,Receta.Long_Nombre_Receta);
   Receta.Nombre_Receta(1..Receta.Long_Nombre_Receta):=to_upper(Receta.Nombre_Receta(1..Receta.Long_Nombre_Receta));
   Put_Line("ingrese la lista de ingredientes: ");
   Creolistaingredientes(Receta.Lista_Ingredientes);        
   Put_Line("ingrese el modo de preparacion de la receta: ");
   Get_Line(Receta.Modo_Preparacion,Receta.Long_Modo_Preparacion);
   
   loop
   begin
   put_line("ingrese el tiempo de preparacion en minutos: ");
   Get(Receta.Tiempo_Preparacion);Skip_Line;
   exit;
   exception
   when data_error=>put_line("error en el dato, vuelva a ingresar el tiempo de preparacion");skip_line;
   end;
   end loop;

   Put_Line("a continuacion debera ingresar la fecha de uso: ");
   Cargofecha(Receta.Fecha_Uso);
   put_line("la receta ha sido creada con exito");      
end Creareceta;

procedure Agregaingrediente(Receta:in out Treceta) is--ya se sabe de que receta se trata
   Regi:Tingrediente;
   rta:character;
begin
   loop
         
         loop
         begin
         Put_Line("ingrese ingrediente a agregar: ");
         Get_Line(Regi.Nombre_Ingrediente,Regi.Long_Nombre_Ingrediente);
         Regi.Nombre_Ingrediente(1..Regi.Long_Nombre_Ingrediente):=to_upper(Regi.Nombre_Ingrediente(1..Regi.Long_Nombre_Ingrediente));  
         Put_Line("ingrese cantidad del ingrediente en gramos: ");          
         Get(Regi.Ingrediente_Cantidad);Skip_Line;
         Insertar(receta.lista_ingredientes,Regi);
         put_line("ingrediente insertado con exito ");      
         exit; 
                     
         exception
         when Data_Error =>
               Put_Line("error en el tipo de dato, vuelva a ingresar los datos: "); Skip_Line;
         when constraint_Error =>
               Put_Line("el string es muy largo, vuelva a ingresar los datos: "); skip_Line;
         end;
         
         end loop;
      
         
         Put_Line("presione 'S' si desea seguir ingresando ingredientes: ");
         Get(Rta); Skip_Line;
         Rta:=To_Upper(Rta);
         
      exit when Rta/='S';
      
   end loop;

end Agregaingrediente;


procedure Eliminaingrediente(Receta:in out Treceta) is
   Ptr:Tipolista;
   Ing:Cade_Nombre_Ingrediente;
   Long:Positive;
   Encontrado:Boolean:=False;
begin
   --loop
   --begin
   Put_Line("ingrese el ingrediente a eliminar: ");
   Get_Line(Ing,Long);
   ing(1..long):=to_upper(ing(1..long));  
   ptr:=receta.lista_ingredientes;  
      while not Vacia(Ptr) and not Encontrado loop
                
      if Info(Ptr).Nombre_Ingrediente(1..Long)=Ing(1..Long) then
         Encontrado:=True;    
         Suprimir(Receta.Lista_Ingredientes,info(ptr));--ya se que esta
         Put_Line("ingrediente eliminado con exito");
                                       
      end if;         
         Ptr:=Sig(Ptr);                 
      end loop;
      
      --exit;
      
     -- exception      
      --when constraint_Error=>Put_Line("el string es muy largo, vuelva a realizar el ingreso: ");New_Line;
           --encontrado:=false;
      --end;
      
--end loop;
if not Encontrado then
   put_line("el ingrediente no ha sido encontrado");   
end if;        
   
end Eliminaingrediente;


procedure Desplegaingredientes(Listaing:in Tipolista)is
ptr:tipolista:=listaing;
begin
   while not Vacia(ptr) loop
      put(info(ptr).nombre_ingrediente(1..info(ptr).long_nombre_ingrediente));new_line;
      Put_Line("cantidad: "&Integer'Image(Info(Ptr).Ingrediente_Cantidad)&"g");
      ptr:=sig(ptr);
   end loop;
end Desplegaingredientes;


procedure Desplegareceta(Receta:in Treceta) is
begin
   Put_Line("Nombre de la receta: ");
   Put(Receta.Nombre_Receta(1..receta.Long_Nombre_Receta));New_Line;
   Put_Line("Sus ingredientes son: ");
   Desplegaingredientes(Receta.Lista_Ingredientes);
   Put_Line("modo de preparacion: ");
   Put(Receta.Modo_Preparacion(1..Receta.Long_Modo_Preparacion));New_Line;
   put_line("el tiempo de preparacion es de "& integer'image(receta.tiempo_preparacion)&" minutos");
   put_line("su fecha de uso fue "&integer'image(receta.fecha_uso.dia)&"/"&integer'image(receta.fecha_uso.mes)&"/"&integer'image(receta.fecha_uso.anio));          
end Desplegareceta;


function Info_Nombre_Receta(Receta:Treceta) return string is
begin
   return receta.Nombre_Receta(1..receta.Long_Nombre_Receta);
end Info_Nombre_Receta;

      
end Receta;
   
      


