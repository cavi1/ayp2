with Ada.Integer_Text_Io, ada.Text_IO, Pila;
use Ada.Integer_Text_Io, ada.Text_IO;

procedure Punto7 is
   
   package Pilaint is new Pila (Integer);
   use Pilaint;
   subtype Pilaint3 is Tpila(3);
   
   type Tvec is array (1..5) of Pilaint3;
   

   procedure Crearpilas (Pila: out pilaint3) is
      X:Integer;
   begin
      for I in 1..3 loop
         Get(X);
         Skip_Line;
         Meter(Pila,X);
      end loop;
   end Crearpilas;
   

   procedure Crearvec (Vec:out Tvec) is
      Pilaux: Pilaint3;
   begin
      for I in Tvec'First..Tvec'Last loop
         Crearpilas(Pilaux);
         Vec(I):= Pilaux;
         Limpiar(Pilaux);
      end loop;
   end Crearvec;


   procedure Sacarimpar (Vec: in out Tvec) is
      X:Integer;
   begin
      for I in Tvec'First..Tvec'Last loop
         if I rem 2 /= 0 then
            Sacar(vec(i),X);
            Put(X);
            New_Line;
            Meter(vec(i),X);
         end if;
      end loop;   end Sacarimpar;
   

   procedure Sumatoriapar (Vec:in out Tvec) is
      X, Sumatoria:Integer;
   begin
      Sumatoria:=0;
      for I in Tvec'First..Tvec'Last loop
         if I rem 2 = 0 then
            for j in 1..3 loop
               Sacar (vec(i),X);
               Sumatoria:= Sumatoria + X;
            end loop;
            Put(" la sumatoria de los elementos de la pila en la posicion " &Integer'Image(I)& " es de " &Integer'Image(Sumatoria));
            Sumatoria:=0;         end if;
      end loop;
   end Sumatoriapar;
   

   Pila:Pilaint3;
   Vec: Tvec;
   
begin
   Put ( " acontinuacion ingrese los 3 elementos de cada pila para las 5 pilas del vector XD ");
   New_Line;
   Crearvec(Vec);
   Put (" estos son los elementos que estan a la cabeza de las pilas que se encuentran en las posiciones impares del vector ");
   New_Line;
   Sacarimpar(Vec);
   Put (" ahora mostramos las sumatorias d los elementos d las pilas en las posiciones pares del vector ");
   New_Line;
   Sumatoriapar (Vec);
end Punto7;

