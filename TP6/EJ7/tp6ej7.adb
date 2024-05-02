--Definir la estructura cola de pila de vectores (5 elementos) y escribir el programa que permita:
--a) Obtener la posición (dentro del vector) del elemento mayor del vector que se encuentra
--en la cabeza de la pila, que está en el frente de la cola.
--cola dinamica, pila dinamica, vector de 5 elemento
--no pide mantener la estructura asi que la hago mierda
with Ada.Integer_Text_Io, Piladin, Coladin, Vecunipaqbas, ada.Text_IO;
use ada.Integer_Text_IO, ada.Text_IO;

procedure Tp6ej7 is
   
   Tamaniopila:Natural:=2;
   Tamaniocola:Natural:=2;
   
  
   subtype Tindex is Natural range 1..5;
   
   procedure Putint(X:in Integer)is
      
   begin
      put(x);
   end Putint;
   
   procedure getint(X:out Integer)is
      
   begin
      get(x);skip_line;
   end getint;
   

   package Vecint is new Vecunipaqbas(Integer, Tindex, Putint, Getint);
   use Vecint;
   
   package Pila is new Piladin(Tarreglo);
   use Pila;
   
   package Cola is new Coladin(Tpila);
   use Cola;
   
   
   procedure Llenaestr(Queue: in out Tcola) is
      V:Tarreglo;
      Pilaux:Tpila;
   begin
      for I in 1..Tamaniocola loop
         
         for J in 1..Tamaniopila loop
            
            leer(v);
            
            Meter(Pilaux,V);            
            
         end loop;
                    
         Insertar(queue,Pilaux);        
            
      end loop;     
         
   end Llenaestr;
   
   
   function Retornaposi(V: in Tarreglo) return Integer is
      Mayor:Integer:=V(1);
      posi:integer;
   begin
      for I in V'range loop
         if Mayor<V(I) then
            Posi:=I;
         end if;
      end loop;
      return posi;
   end Retornaposi;
   
   procedure Consigna(Queue: in out Tcola) is
     Pilaux:Tpila;
      V:Tarreglo;
      
  begin
     Suprimir(queue, Pilaux);
     Sacar(Pilaux,V);
     Put_line("la posicion (dentro del vector) del elemento mayor del vector que se encuentra en la cabeza de la pila, que esta en el frente de la cola es: ");
     Put(Retornaposi(V));
  end Consigna;
    



 
   

      





   --Obtener la posición (dentro del vector) del elemento mayor del vector que se encuentra en la cabeza de la pila, que está en el frente de la cola.
kiwi:tcola;   
   --Pilaa:Tpila;
   --v:tarreglo;      
         


begin
   Llenaestr(Kiwi);
   --Suprimir(Kiwi,Pilaa);
   --Sacar(Pilaa,V);
   --put(retornaposi(v));
   --put(v(1));
   consigna(kiwi);
   
end Tp6ej7;

      
   

