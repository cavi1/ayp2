--Un algoritmo bien conocido para encontrar el máximo común divisor de dos enteros es el
--Algoritmo De Euclides. 
      
      --La función del máximo común divisor se define de la siguiente manera:
        -- MCD(N, M) si N > M
         --MCD (M,N) = M si N = 0
         --Mcd(N, Resto(M,N)) Si N > 0
      
--Donde RESTO(M,N) es M módulo N , el residuo de dividir M por N. Construir una función
--recursiva para resolver este problema (sin utilizar la función predefinida MOD) Haga una traza
--para M=20 y N=6 .


--se tiene dos segmentos a y b, a mide 87 y b mide 27, tengo que encontrar el maximo numero que divide a ambos, para esto debo ver cuantas veces cabe 
--el mas chico en el mas grande, es decir, debo dividir, 87/27=3, pero esta división no es exacta, porque sobran 6, 
--entonces debo ver cuantas veces cabe el 6 en 27, debo dividir, 27/6=4, pero esta división no es exacta, porque sobran 3
--entonces debo ver cuantas veces entra el 3 en 6, esta división resulta ser exacta, lo cual significa que puedo descomponer tanto al 27 como al 87 en sumatorias de 3, 
--y esto se traduce como decir que el maximo comun divisor entre 87 y 27 es 3.

with Ada.Integer_Text_Io, ada.Text_IO;
use ada.Integer_Text_IO, ada.Text_IO;
procedure Tp3ej1 is
 

   --function Resto(N, M: Integer) return Integer is
  -- resu:integer;
   --begin
      --resu:=N;
      --while RESU>=M loop
         --Resu:=Resu-M;
     -- end loop;
      --return Resu;
   --end Resto;
   
   function Resto(N, M: Integer) return Integer is
   begin
      if N<M then
         return N;
      else 
         return Resto(N-M,M);
      end if;
      
   end Resto;
   
   A:Integer:=87;
   b:integer:=27;
   
   function  Mcd(N,M: Integer) return Integer is
      ordenincorrecto:exception;           

   begin
      --if N<M then raise Ordenincorrecto;
      --end if;
      
      if resto(N,M)=0 then
         return M;
      else 
         return Mcd(M, Resto(N,M));
      end if;
      
      --exception 
   --when Ordenincorrecto => begin
      --Put("el primer parametro debe ser mayor al segundo");
         --end; 
                  
   end Mcd;
      

begin
   Put(Resto(A,B));
   put(MCD(A,B));
   

   
end Tp3ej1;
   
