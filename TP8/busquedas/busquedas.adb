procedure Busquedas is
 
type vec is array(1..5) of integer;--acomodado para vectores de enteros


   procedure Buslineal (V: Vec; Elembuscado: integer; Encontrado: out Boolean; Posi: out Integer) is--sobre arreglo desordenado
      
      I: Integer;
      
   begin
      
      I:= Vec'First;
      
      loop
         
         exit when I > Vec'Last or else Elembuscado = V(I);
         
         I:= Integer'Succ(I);
         
      end loop;
      
      Encontrado:= I <= Vec'Last;
      
      if Encontrado then Posi:= I; else Posi:= 0; end if;
      
   end Buslineal;
   
   procedure Buslinealord (V: Vec; Elembuscado: integer; Encontrado: out Boolean; Posi: out Integer) is--sobre arreglo ordenado
      
      I: Integer;
      
   begin
      
      I:= Vec'First;
      
      loop
         
         exit when I> Vec'Last or else Elembuscado < V(I) or Else elembuscado = V(I);--evita constraint error si se pasa de rango
         
         I:= Integer'Succ(I);
         
      end loop;
      
      Encontrado:= I <= Vec'Last and then Elembuscado = V(I);
      
      if Encontrado then Posi:= I; else Posi:= 0; end if;
      
   end Buslinealord;
   


procedure BusBin (Datos: vec; elemBuscado: integer; posi: out integer) is--solucion iterativa para busqueda binaria
   Encontrado: Boolean:=False;
   
   Mitad: Integer;
   
   Primero, Ultimo: Integer;
   
begin -- el vector Datos está ordenado
   
   Primero:= 1;
   
   Ultimo:= Datos'Last;
   
   while Primero <= Ultimo and not Encontrado loop
      
      Mitad:= (Primero + Ultimo)/2;
      
      if Datos(Mitad) = Elembuscado then Encontrado:= True;
      
      elsif Datos(Mitad) > Elembuscado then Ultimo:= Mitad-1;
      
      else Primero:= Mitad+1;
      
      end if;
      
   end loop;
   
   if Encontrado then Posi:= Mitad;
   else Posi:= 0;
   end if;
   

end Busbin;
   


   procedure Busbinrec (Datos: Vec; Pi, Pf: Natural; Elembuscado: Integer; Posi: out Natural) is--solucion recursiva
      
      Mitad: Natural;
      
   begin -- el vector Datos está ordenado
      
      Mitad:= (Pi+Pf)/2;
      
      if Pi > Pf then Posi:= 0; -- caso base 1
         
      elsif Datos(Mitad) = Elembuscado then
         
         Posi:= Mitad; -- caso base 2
            
      elsif Datos(Mitad) > Elembuscado then
         
         Busbinrec(Datos, Pi, Mitad-1, Elembuscado, Posi);
         
      else Busbinrec(Datos, Mitad+1, Pf, Elembuscado, Posi);
      
      end if;
      
   end Busbinrec;
   

begin
   null;
end Busquedas;

   
