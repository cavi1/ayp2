with Receta, Ada.Text_Io, ada.Characters.Handling, Ada.Integer_Text_Io;
use Receta, Ada.Text_Io, ada.Characters.Handling, Ada.Integer_Text_Io;
package body Recetario is
   
   function "<" (X,Y: Trecetamaster) return Boolean is
   begin
      return X.Aperturas < Y.Aperturas;
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
      Insertar(Recetario, Recetamasteraux);
   end Agregar_Receta;
      
  procedure Buscar_Receta (Recetario: in out Trecetario; Nombre_Receta: in out Cade_Nombre_Receta; long_nombre: in positive; encontrado: out boolean ) is
  begin
      Nombre_Receta:= To_Upper(Nombre_Receta);
      Encontrado:= False;
      while not Vacia(Recetario) and not encontrado loop
         if Nombre_Receta (1..Long_nombre) = Info_Nombre_Receta(Recetario) then
            Encontrado:= True;
         end if;
         Recetario:= Sig(Recetario);
       end loop;
       if not Encontrado then
          raise Receta_Inexistente;
       end if;
    end Buscar_Receta;
   
   procedure Eliminar_Receta (Recetario: in out Trecetario) is
      Nombre_R_E: Cade_Nombre_Receta;
      Long_A_E: Positive;
      Encontrado: Boolean;
      Recetario_Aux: Trecetario:= Recetario;
   begin
      Put(" ingrese el nombre de la receta que quiere eliminar ");
      Get_Line (Nombre_R_E, Long_A_E);
      Skip_Line;
      Nombre_R_E:= To_Upper(Nombre_R_E(1..Long_A_E));
         Buscar_Receta (Recetario_Aux, Nombre_R_E, Long_A_E, Encontrado);
      if Encontrado then
         Suprimir(Recetario_aux, Info(Recetario_aux));         end if;
      end Eliminar_Receta;
      
   procedure Modificar_Receta (Recetario: in out Trecetario) is
      Recetario_Aux: Trecetario:= Recetario;
      Encontrado: Boolean;
      Recetamasteraux: Trecetamaster;
      Nombre_R_M: Cade_Nombre_Receta;
      Long_A_M: Positive;      Rta:Character;
   begin
      Put(" ingrese el nombre de la receta que quiere modificar ");
      Get_Line (Nombre_R_m, Long_A_m);
      Skip_Line;
      Nombre_R_m:= To_Upper(Nombre_R_m(1..long_a_m));
      Encontrado:= False;
      Buscar_Receta (Recetario_Aux, Nombre_R_m, Long_A_m, Encontrado);
      if Encontrado then
         Suprimir (Recetario_Aux, Recetamasteraux);
         Put(" ingrese 'a' si quiere agregar un ingrediente a la lista, sino ingrese 'e' si quiere eliminar un ingrediente ");
         Get(Rta);
         if Rta /= 'a' and Rta /= 'e' then
            raise Data_Error;
         else
            if Rta = 'a' then
               Agregaingrediente( Recetamasteraux.Receta );
            else
               if Rta ='e' then
                  Eliminaingrediente ( Recetamasteraux.Receta );
               end if;
            end if;
         end if;
      end if;
   end Modificar_Receta;
           
   procedure Crear_Recetario (Recetario: in out Trecetario) is
   begin
      Crear (Recetario);
      Limpiar(Recetario);
   end Crear_Recetario;
   
   procedure Generar_Listado (Recetario: in out Trecetario) is
      Recetario_Aux: Trecetario:=Recetario;
      Recetamasteraux: Trecetamaster;
   begin
      while not Vacia(Recetario_Aux) loop
         Suprimir(Recetario_Aux, Recetamasteraux);
         Put(Info_Nombre_Receta(Recetamasteraux.Receta));
         New_Line;
         Insertar(Recetario_Aux,Recetamasteraux);
      end loop;
   end Generar_Listado;
   
   procedure Usar_Receta (Recetario: in out Trecetario) is
      Recetario_Aux: Trecetario:= Recetario;
      Recetamasteraux: Trecetamaster;
      Nombre_R_U: Cade_Nombre_Receta;
      Long_R_U: Positive;
      Encontrado: Boolean;
   begin
      Put (" ingrese el nombre de la receta que quiere usar ");
      Get_Line (Nombre_R_U, Long_R_U);
      Buscar_Receta ( Recetario_Aux, Nombre_R_U, Long_R_U, Encontrado);
      if Encontrado then
         Suprimir (Recetario_Aux, Recetamasteraux);
         Desplegareceta (Recetamasteraux.Receta);
         Recetamasteraux.Aperturas:= Recetamasteraux.Aperturas;
      end if;
   end Usar_Receta;
   


      end Recetario;

