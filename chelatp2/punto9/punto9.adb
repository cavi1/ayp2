with Ada.Integer_Text_Io, Ada.Text_Io, Pila, Cola, vector;
use Ada.Integer_Text_Io, Ada.Text_Io;

procedure Punto9 is
   Rango:Integer:= 5;
   subtype Tindex is integer range 1..Rango;

   procedure Putint (X:in Integer) is 
   begin
      Put(X);
   end Putint;
   
   procedure Getint (X: out Integer) is
   begin
      Get(X);
   end Getint;


   package Vecint is new Vector(Integer, tindex, Putint, Getint, "+", "*");
   use Vecint;
   

   package Pilavec is new Pila (Tvector);
   use Pilavec;
   subtype Pilavec3 is tpila(3);
   
   Package Colapilavec is new Cola(Pilavec3);
   use Colapilavec;
   subtype Colapilavec3 is tcola(4); -- una cola de 3 pilas q tienen 3 vectores de 4 elementos
    

   procedure Crearvec (Vec: out Tvector) is
   begin
      for I in Tindex'First..Tindex'Last loop
         Put(" ingrese el elemento " &Integer'Image(I)& " del vector... ");
         Get(Vec(I));
         Skip_Line;
      end loop;
   end Crearvec;
   
   procedure Crearpila (Pila: in out Pilavec3) is
      Vecaux: Tvector;
   begin
      Crearvec(Vecaux);
      Put(" metiendo vector en la pila ");
      New_Line;
      Meter(Pila, Vecaux);
   end Crearpila;
   
   procedure Crearcola (Cola:in out Colapilavec3) is
      Pilaux: Pilavec3;
   begin
      for I in 1..3 loop
         Crearpila(Pilaux);
         Put(" insertando en la pila dada en la cola xD... ");
         New_Line;
         Insertar(Cola, Pilaux);
         limpiar(Pilaux);
      end loop;
   end Crearcola;
   
   procedure Mayorposi (Cola: in out Colapilavec3) is
      Pilaux:Pilavec3;
      Vecaux: Tvector;
      Posicion, valor:Integer;
   begin
      Suprimir (Cola, Pilaux);
      Sacar(Pilaux, Vecaux);
      Posicion:= Tindex'First;
      Valor:= Vecaux(Posicion);
      for I in Tindex'First..Tindex'last loop
         if Vecaux(posicion) < Vecaux(i) then
            Posicion:= I;
            Valor:= Vecaux(I);
         end if;
      end loop;
      Put (" la posicion del elemento mayor del vector que se encuentra en la cabeza de la pila que esta en el frente de la cola es " &Integer'Image(Posicion)& " con un valor de " &Integer'Image (Valor));
      Meter(Pilaux, Vecaux);
      Insertar (Cola,Pilaux);
   end Mayorposi;
   
   Mastercola: colapilavec3;
   
begin
   Crearcola (Mastercola);
   Mayorposi (Mastercola);
end Punto9;

