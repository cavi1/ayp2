with Ada.Integer_Text_Io, Ada.Text_Io, Pila, vector;
use Ada.Integer_Text_Io, Ada.Text_Io;

procedure Punto8 is
   
   procedure Putint (X:Integer) is
   begin
      put(X);
   end Putint;
   
   procedure Getint (X: out Integer) is 
   begin
      Get(X);
      Skip_Line;
   end Getint;

   Rangovec:Integer:=5;
   subtype Tindex is Integer range 1..Rangovec;
   package Vecint is new Vector(Integer,tindex, putint, getint, "+", "*");
   use Vecint;

   package Pilavectorial is new Pila(Tvector);
   use Pilavectorial;
   subtype tPilavec is Tpila (4);
   
   

   procedure Crearpila (Pila: in out Tpilavec) is
      Vecaux: Tvector; 
   begin
      for I in 1..4 loop
         Leer(Vecaux);
         Meter(Pila, Vecaux);
      end loop;
   end Crearpila;
   
   function Sumatoriavec (Vec:Tvector) return Integer is
      Sumatoria:Integer;
   begin
      Sumatoria:=0;
      for I in Tindex'First..Tindex'Last loop
         Sumatoria:= Sumatoria + Vec(I);
      end loop;
      return Sumatoria;
   end Sumatoriavec;
   


   procedure Sumatoriacabeza (Pila: in out Tpilavec) is
      Sumatoria: Integer;
      Vecaux: Tvector;
   begin
      Sacar (Pila, Vecaux);
      Sumatoria:=Sumatoriavec(Vecaux);
      Put (" la sumatoria de los elementos que estan en el vector en la cabeza de la pila es de " &Integer'Image(Sumatoria));
      New_Line;
      Meter(Pila, Vecaux);
   end Sumatoriacabeza;
   

   procedure Reponerpila (Pila: in out Tpilavec; Pilaux: in out Tpilavec) is
      vecaux: tvector;
   begin
      for I in 1..4 loop
         Sacar(Pilaux, Vecaux);
         Meter(Pila, Vecaux);
      end loop;
   end Reponerpila;
   

   procedure Mayorsum (Pila:in out Tpilavec) is
      Sumatoriaux, sumatoriamax, Posicion: Integer;
      Vecaux: Tvector;
      Pilaux: Tpilavec;
   begin
      Sumatoriamax:=0;
      for I in 1..4 loop
         Sacar(Pila,Vecaux);
         Sumatoriaux:=Sumatoriavec(Vecaux);
         if Sumatoriaux > Sumatoriamax then
            Sumatoriamax:=Sumatoriaux;
            Posicion:= 5 - I;
         end if;
         Meter (Pilaux, Vecaux);
      end loop;
      Reponerpila(Pila,Pilaux);
      Put (" el vector que esta en la posicion " &Integer'Image(Posicion)& " de  la pila tiene la mayor sumatoria de componentes con respecto a los demas vectores: " &Integer'Image(Sumatoriamax));
      New_Line;      
   end Mayorsum;
   
   Masterpila: Tpilavec;

begin
   Put (" ingrese los 5 elementos para los 4 vectores que van a estar dentro de la pila.. ");
   New_Line;
   Crearpila (Masterpila);
   New_Line;
   Sumatoriacabeza (Masterpila);
   Mayorsum (Masterpila);
end Punto8;

