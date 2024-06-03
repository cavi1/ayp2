procedure Quicksort is


   type Tipovector is array(1..5) of Integer;--para q compile
   
   
   procedure Intercambiar(Izq, Der: in out integer) is --porque el vector es de integer
   
   Temp: integer;
   
   begin
   
   Temp:= Izq; Izq:= Der; Der:= Temp;
   
   end Intercambiar;





   procedure Dividir (Datos: in out Tipovector; Primero, Ultimo: in Integer; Puntodivision: In out Integer) is
      
      -- elige el valor de division V y acomoda Datos de manera que:
      
      -- Datos(Primero)..Datos(PuntoDivision - 1) <= V y
      

      -- Datos(PuntoDivision + 1) .. Datos(Ultimo ) > V
      
      Derecha, Izquierda : Integer; V: Integer;
      
   begin -- Dividir
      
      V:= Datos(Primero);
      
      Derecha := Primero + 1;
      
      Izquierda := Ultimo;
      
      loop
         
         while Derecha < Izquierda and Datos(Derecha) <= V loop
            
            Derecha := Derecha + 1;
            
         end loop;
         
         if Derecha = Izquierda and Datos(Derecha) <= V then Derecha := Derecha + 1;
         
         end if;
         
         while Derecha <= Izquierda and Datos(Izquierda) > V loop
            
            Izquierda := Izquierda - 1;
            
         end loop;
         
         if Derecha < Izquierda then Intercambiar(Datos(Derecha), Datos(Izquierda));
         
            Derecha :=Derecha +1;
            
            Izquierda:= Izquierda -1;
            
         end if;
         
         exit when Derecha > Izquierda;
         
      end loop;
      
      Intercambiar(Datos(Primero), Datos(Izquierda));
      
      Puntodivision:= Izquierda;
      
   end Dividir;
   

   procedure Ordrapida (Datos: in out Tipovector; Primero, Ultimo: In integer) is
      
      Puntodivision: Integer;
      
   begin
      
      if Primero < Ultimo -- no terminó la recursión (la porción del arreglo que 
                           --se está ordenando tienen dos o más elementos)
      then
               
         -- llama al procedimiento Dividir, que determina el valor de división
         
         --V Y acomoda el arreglo de tal manera que:
            
            -- Datos(Primero)..Datos ( PuntoDivision-1) < V, Datos(PuntoDivision)
            
            --= V, Datos(PuntoDivision+1) .. Datos(Ultimo) > V
               
         Dividir(Datos, Primero, Ultimo, Puntodivision);
         
         Ordrapida(Datos, Primero, Puntodivision -1);
         
         Ordrapida(Datos, Puntodivision +1, Ultimo);
         
      end if;
      
   end Ordrapida; -- fin de OrdRapida
      

begin
   null;
end Quicksort;

      
