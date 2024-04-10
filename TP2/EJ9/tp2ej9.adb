--hacer una cola de pila de vectores, primero vec despues pila y despues cola
--a) Obtener la posición (dentro del vector) del elemento mayor del vector que se encuentra
--en la cabeza de la pila, que está en el frente de la cola. 

with Pila, Cola, vecunipaqbas, Ada.Integer_Text_Io, ada.Text_IO;
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
   
      
    
   package Vecint is new vecunipaqbas(Integer, Tindex, putint,getint);
   
   use Vecint;
   
   package Pilavec is new Pila(tarreglo);
   
   use Pilavec;
   
   subtype tPilaX is tPila(tamaniopila);
   
   package Colapilavec is new Cola(tPilaX);
   
   use Colapilavec;
   
   subtype tColaX is tCola(tamaniocola);
   
   
   
   procedure Llenaestruc(Cola:out Tcolax) is
      Vecaux:tarreglo;
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
   
   --procedure Imprimocola(Cola: in Tcolax) is--no modifica la cola original
      --Pilaux:Tpilax;
      --Vecaux:Tvec;
      --colaux:tcolax;
   --begin
      --colaux:=cola;
      --while not Vacia(Colaux) loop
         --Suprimir(Colaux,Pilaux);
         --while not Vacia(Pilaux) loop
            --sacar(Pilaux, Vecaux);
            --Escribir(Vecaux);
         --end loop;
      --end loop;
      
   --end Imprimocola;
   
   function Posdelmayor(Vec: Tarreglo)return Integer is
   mayor, posi:integer;
   begin
      Mayor:=Vec(1);
      posi:=1;
      for I in vec'range loop
         if Vec(I)>Mayor then-- la primera comparación es redundante pero bueno, sino "i" debería ir de 1 a dimvec pero dimvec es variable global...
            Posi:=I;
         end if;
      end loop;
      return Posi;
    end posdelmayor;
            
   procedure Consigna(Cola:in Tcolax) is
      Pilaux:Tpilax;
      Vecaux:Tarreglo;
      Colaux:Tcolax;
   begin
      colaux:=cola;
      
      Suprimir(Colaux,Pilaux);
         
      sacar(Pilaux, Vecaux);
      
      
      put("el elemento mas grande del primer vector de la cabeza de la pila del frente de la cola esta en la posicion: " & integer'image(posdelmayor(vecaux)));
      
           
   end Consigna;
   
  colaint:tcolax;        
   
begin
   llenaestruc(colaint);
   --imprimocola(colaint);
   consigna(colaint);
   end;
  
   
   
