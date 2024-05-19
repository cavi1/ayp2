with Receta, Ada.Text_Io, ada.Characters.Handling, Ada.Integer_Text_Io;
use Receta, Ada.Text_Io, ada.Characters.Handling, Ada.Integer_Text_Io;
package body Recetario is
   
   function "<" (X,Y: Trecetamaster) return Boolean is
   begin
      return info_nombre_receta(X.receta) < info_nombre_receta(y.receta);
   end "<";
   
   function ">" (X,Y: Trecetamaster) return Boolean is
   begin
      return X.Aperturas > Y.Aperturas;
   end ">";
   
   
   procedure Agregar_Receta (Recetario: in out Trecetario) is
      Receta: Treceta;
      Recetamasteraux: Trecetamaster;
   begin
      Creareceta(Receta);
      Recetamasteraux.Receta:= Receta;
      recetamasteraux.aperturas:=0;
      Insertar(Recetario, Recetamasteraux);
   end Agregar_Receta;
      
  procedure Buscar_Receta (Recetario: in out Trecetario; Nombre_Receta: in out string; long_nombre: in positive; encontrado: out boolean ) is
  begin
      Nombre_Receta:=To_Upper(Nombre_Receta);
      Encontrado:= False;
      while not Vacia(Recetario) and not encontrado loop
         if Nombre_Receta (1..Long_nombre) = Info_Nombre_Receta(info(Recetario).receta) then
           Encontrado:= True;
         end if;
         exit when encontrado;
         Recetario:= Sig(Recetario);
       end loop;
       if not Encontrado then
          raise Receta_Inexistente;
       end if;
    end Buscar_Receta;
   
   procedure Eliminar_Receta (Recetario: in out Trecetario) is
      Nombre_R_E:cade_nombre_receta;
      Long_A_E: Positive;
      Encontrado: Boolean;
      Recetario_Aux: Trecetario:= Recetario;
   begin
      Put(" ingrese el nombre de la receta que quiere eliminar ");
      Get_Line(Nombre_R_E, Long_A_E);Skip_Line;
      Buscar_Receta(Recetario_Aux, Nombre_R_E, Long_A_E, Encontrado);
      --put_line(info_nombre_receta(info(recetario_aux).receta));
      if Encontrado then
         Suprimir(Recetario, Info(Recetario_Aux));--aca hace mal las cosas, elimina uno de los elementos que no corresponde con el seleccionado...
         put_line("eliminado...");
      end if;
      
      end Eliminar_Receta;
      
   procedure Modificar_Receta (Recetario: in out Trecetario) is
      Recetario_Aux: Trecetario:= Recetario;
      Encontrado: Boolean;
      Recetamasteraux: Trecetamaster;
      Receta_M: Treceta;
      Nombre_R_M: Cade_Nombre_Receta;
      Long_A_M: Positive;
      Rta:Character;
   begin
      Put(" ingrese el nombre de la receta que quiere modificar ");
      Get_Line(Nombre_R_m, Long_A_m);
      Skip_Line;
      Encontrado:= False;
      Buscar_Receta (Recetario_Aux, Nombre_R_M, Long_A_M, Encontrado);
      Put(" receta encontrada... ");
      if Encontrado then
         Recetamasteraux:=Info(Recetario_Aux);
         Suprimir (Recetario_Aux, Info(Recetario_Aux));
         Put(" ingrese 'a' si quiere agregar un ingrediente a la lista, sino ingrese 'e' si quiere eliminar un ingrediente ");
         Get(Rta);skip_line;
         if Rta /= 'a' and Rta /= 'e' then
            raise Data_Error;
         else
            if Rta = 'a' then
               Agregaingrediente( Recetamasteraux.Receta );
               Put(" ingrediente agregado.. ");
               New_Line;
            else
               if Rta ='e' then
                  Eliminaingrediente ( Recetamasteraux.Receta );
                  Put(" ingrediente eliminado.. ");
                  New_Line;
               end if;
            end if;
         end if;
         Insertar(Recetario_Aux, Recetamasteraux);
         --Put(" reinsertado correctamente ");
      end if;
   end Modificar_Receta;
           
   procedure Crear_Recetario (Recetario: in out Trecetario) is
   begin
      Crear (Recetario);
      Limpiar(Recetario);
   end Crear_Recetario;
   
   procedure Generar_Listado (Recetario: in Trecetario) is
      Recetario_Aux: Trecetario:=Recetario;
   begin
      while not Vacia(Recetario_Aux) loop        
         Put(Info_Nombre_Receta(info(recetario_aux).receta));
         New_Line;
         recetario_aux:=sig(recetario_aux);        
      end loop;
         
   end Generar_Listado;
   
   procedure Usar_Receta (Recetario: in out Trecetario) is
      Recetario_Aux: Trecetario:= Recetario;
      --Recetamasteraux: Trecetamaster;
      Nombre_R_U: Cade_Nombre_Receta;
      Long_R_U: Positive;
      Encontrado: Boolean;
   begin
      Put(" ingrese el nombre de la receta que quiere ver ");
      Get_Line(Nombre_R_U, Long_R_U);Skip_Line;
      
      Buscar_Receta (Recetario_Aux, Nombre_R_U, Long_R_U, Encontrado);
      
      if Encontrado then
         Desplegareceta(info(recetario_aux).Receta);
      end if;
   end Usar_Receta;
   


end Recetario;
