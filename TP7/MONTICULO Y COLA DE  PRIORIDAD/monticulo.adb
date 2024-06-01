package body monticulo is 


procedure Intercambiar(Izq, Der: in out Tipoelemento) is
   
   Temp: Tipoelemento;
   
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

procedure Restaurarabajo (Vm: in out Vecmonticulo)is
   
   Raiz, Mayor: Positive;
   
begin
   
   Raiz := Vm'First;
   
   if Raiz <= Vm'Last / 2 then-- Verifica Que No Sea Nodo Hoja
         
      Mayor:= Hijomayor(Vm);
      
      if Vm(Mayor) > Vm(Raiz) then
         
         Intercambiar(Vm(Raiz), Vm(Mayor));
         
         Restaurarabajo(Vm(Mayor..Vm'Last));
         
      end if;
      
   end if;
   
end Restaurarabajo;

procedure Restaurararriba (Vm: in out Vecmonticulo) is
   
   Ultimo, Padre: Positive;
   
begin
   
   Ultimo := Vm'Last;
   
   if Ultimo > Vm'First then Padre:= Ultimo / 2;
   
      if Vm(Ultimo) > Vm(Padre) then
         
         Intercambiar(Vm(Padre), Vm(Ultimo));
         
         Restaurararriba(Vm(Vm'First..Padre));
         
      end if;
      
   end if;
   
end Restaurararriba;

end monticulo;



