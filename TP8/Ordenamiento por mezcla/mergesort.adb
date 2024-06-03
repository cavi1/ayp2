procedure Mergesort is
   
   type tarray is array (1..5) of integer;
   
   procedure Mezclar (Datos: in out Tarray; Izqprim, Izqult, Derprim, Derult: in Integer) is
      
      Temp: Tarray; -- arreglo Auxiliar
         
      Indice: Integer;
      
      Izqactual, Deractual : Integer;
      
   begin -- Mezclar
      
      Izqactual:= Izqprim;
      
      Deractual:= Derprim;
      
      Indice:= Izqprim;
      
      -- mientras haya elementos en ambos arreglos, son procesados
      
      while Izqactual <= Izqult and Deractual <= Derult loop
         
         if Datos (Izqactual) < Datos(Deractual) then -- El elemento de la izquierda es menor
               
         Temp(Indice):= Datos (Izqactual);
         
         Izqactual:= Izqactual + 1;
         
         else -- El elemento de la derecha es menor o igual
            
         Temp(Indice):= Datos (Deractual);
         
         Deractual:= Deractual + 1;
         
      end if;
      
      Indice:= Indice + 1;
      
   end loop;
   
   -- mientras queden elementos en el arreglo, se copian los elementos restantes de la mitad Izquierda en Temp
   
   while Izqactual <= Izqult loop
      
      Temp(Indice):= Datos (Izqactual);
      
      Izqactual:= Izqactual + 1;
      
      Indice:= Indice + 1;
      
   end loop;
   
   -- mientras queden elementos, se copian los elementos restantes de
   
   --la mitad Derecha en Temp
   
   while Deractual <= Derult loop
      
      Temp(Indice):= Datos (Deractual);
      
      Deractual:= Deractual +1;
      
      Indice:=Indice +1;
      
   end loop;
   
   -- se copian en Datos, los elementos que están ordenados en Temp
   
   for Indice in Izqprim .. Derult loop
      
      Datos(Indice):=Temp(Indice);
      
   end loop;
   
end Mezclar;



procedure OrdMezcla (Datos: in out Tarray; Primero, Ultimo: integer)is
   Mitad: Integer;
   
begin -- ordMezcla
   
   if Primero < Ultimo then
      
      Mitad := (Primero + Ultimo)/2;
      
      Ordmezcla(Datos, Primero, Mitad); -- ordena el sub array izq.
         
      Ordmezcla(Datos, Mitad +1, Ultimo); -- ordena el sub array der
         
      Mezclar(Datos, Primero, Mitad, Mitad+1, Ultimo);
      
   end if; -- Caso General
      
   end Ordmezcla;
     

begin
   null;
end Mergesort;

