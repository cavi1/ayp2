
with coladin, vecunipaqbas;

procedure Parcialej2 is
--crear una estructura de vector de colas de registros con campo numerico y cadena

   Cademax:Positive:=10;--por ser estático
   vecmax:positive:=5;--idem

subtype cade is string(1..cademax);

   type Tregi is record 
      Nro:Integer;
      Str:Cade;
      Long_Str:Positive;
   end record;
   
   subtype tindex is positive range 1..vecmax;
   
   package Colaregi is new Coladin(Tregi);
   use Colaregi;
   
   procedure Putregicola(X:in Tcola) is
   begin
      null;
   end Putregicola;
      procedure getregicola(X:out Tcola) is
   begin
      null;
   end Getregicola; 
   
   package vecolaregi is new vecunipaqbas(tcola,tindex,putregicola,getregicola);
   
   use Vecolaregi;
   
   procedure Reemplazar(V:in out Tarreglo) is --me tiene que intercambiar el nro de cada registro de cada cola de adentro del vector por el valor de la longitud de su string y conservar la estructura
      Regi:Tregi;
      colaux:tcola;
   begin                                    --supongo que se refiere a conservar el orden en el que estaban las cosas una vez intercambiado el nro, pero no la estructura tal cual con las cosas sin cambiar y a parte otra con las cosas cambiadas
      for I in 1..Vecmax loop               --yo lo pienso de esa manera
         while not vacia(v(i)) loop
            Suprimir(V(I), Regi);
            Regi.Nro:=Regi.Long_str;
            Insertar(Colaux,Regi);
         end loop;
         
         while not Vacia(Colaux) loop
            Suprimir(Colaux,Regi);
            Insertar(V(I),Regi);
         end loop;
         
      end loop;
   end Reemplazar;
   
begin
   null;
end Parcialej2;

         
            
      
   
