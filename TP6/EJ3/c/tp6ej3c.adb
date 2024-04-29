with Listanoord, Ada.Integer_Text_Io;
use Ada.Integer_Text_Io;



procedure Tp6ej3c is
   
   package Listaint is new Listanoord(Integer);
   
   use Listaint;
   
   function Cuentaparesrec (Lista:Tipolista) return Integer is
      
   begin
      
      if Vacia(Lista) then return 0;
      
      else
         
         if Info(Lista) mod 2 /= 0 then
            
               return Cuentaparesrec(Sig(Lista)) + 0;
              
         else
            
            return Cuentaparesrec(Sig(Lista)) + 1;
            
         end if;
         
      end if;      
         
   end Cuentaparesrec;
   
list:tipolista;

begin
   
   for I in 1..10 loop
      Insertar(List,I);
   end loop;
   
   
   Put(Cuentaparesrec(List));
   
end Tp6ej3c;


      
            

            
      
