procedure Heapsort is
  

type vecmonticulo is array(1..5) of integer;


procedure Intercambiar(Izq, Der: in out integer) is
   
   Temp: integer;
   
begin
   
   Temp:= Izq; Izq:= Der; Der:= Temp;
   
end Intercambiar;




function Hijomayor (Vm: in Vecmonticulo) return Positive is --indice del hijo mayor
   
   Hijoizq, Hijoder: Positive;
   
begin
   
   Hijoizq:=
      
   Vm'First * 2;
      
   Hijoder:= Vm'First * 2 + 1;
   
   if Hijoder > Vm'Last then return Hijoizq; --HijoDer fuera de rango
      
   else if Vm(Hijoizq) > Vm(Hijoder) then return Hijoizq; --no hay orden
      
      else return Hijoder;
      
      
      end if;
      
   end if;
   
end Hijomayor;


procedure Restaurarabajo (Vm: in out Vecmonticulo) is
   
   Raiz, Mayor: Positive;
   
begin
   
   Raiz := Vm'First;
   
   if Raiz <= Vm'Last / 2 then --Verifica Que No Sea Nodo Hoja
      
      mayor:= Hijomayor(Vm);
   
      if Vm(Mayor) > Vm(Raiz) then
         
         Intercambiar(Vm(Raiz), Vm(Mayor));
         
         Restaurarabajo(Vm(Mayor..Vm'Last));
         
      end if;
      
   end if;
   
end Restaurarabajo;


procedure Constmonticulo (Datos: in out vecmonticulo) is
   
begin
   
   for I in reverse Datos'First..Datos'Last/2 loop
      restaurarabajo(Datos(I..Datos'Last));  
   end loop;
   
end Constmonticulo;


procedure Ordmonticulo (Datos: in out vecmonticulo) is
   
begin
   
   Constmonticulo(Datos);
   
   for I in reverse 2 .. Datos'Last loop
      
      Intercambiar (Datos(1), Datos(I));
      
      Restaurarabajo(Datos(1..I - 1));
      
   end loop;
   
end Ordmonticulo;


begin
   null;
end Heapsort;




