--hacer una cola de pila de vectores, primero vec despues pila y despues cola
--a) Obtener la posición (dentro del vector) del elemento mayor del vector que se encuentra
--en la cabeza de la pila, que está en el frente de la cola. 

with Pila, Cola, Vecunipaqbas, Ada.Integer_Text_Io, ada.Text_IO;
use ada.Integer_Text_IO, ada.Text_IO;

procedure Tp2ej9 is
   
   Dimvec:Integer:=5;
   Tamaniopila:Integer:=2;
   tamaniocola:integer:=3;


   subtype Tindex is Integer range 1..dimvec;
   

   procedure Putint (X:in Integer) is
   begin
      Put(X);
   end Putint;
   
   procedure Getint (X:out Integer) is
   begin
      Get(X);skip_line;
   end Getint;
    
   package Vecint is new Vecunipaqbas(Integer, Tindex, Putint, Getint);
   
   use Vecint;
   
   package Pilavec is new Pila(tarreglo);
   
   use Pilavec;
   
   subtype tPilaX is tPila(tamaniopila);
   
   package Colapilavec is new Cola(tPilaX);
   
   use Colapilavec;
   
   subtype tColaX is tCola(tamaniocola);
   
   
   
   procedure Llenaestruc(Cola:out Tcolax) is
      Vecaux:Tarreglo;
      pilaux:tpilax;
   begin
      limpiar(cola);
      while not Llena(Cola) loop
         limpiar(pilaux);
         while not Llena(Pilaux) loop
            leer(Vecaux);
            meter(pilaux, vecaux);
         end loop;
         Insertar(Cola,Pilaux);
      end loop;
      
   end Llenaestruc;
   
   procedure Imprimoestruc(Cola:in Tcolax) is
      Colaux:Tcolax;
      Pilaux:Tpilax;
      vecaux:tarreglo;
   begin
      colaux:=cola;
      while not Vacia(Colaux) loop
         while not Vacia(Pilaux) loop
            Sacar(Pilaux, Vecaux);
            Escribir(Vecaux);
         end loop;
         Suprimir(Colaux,Pilaux);
      end loop;
   end Imprimoestruc;
   
               
colaint:tcolax;   
   
         
   
begin
   Llenaestruc(Colaint);
  
end;
  
   
   
