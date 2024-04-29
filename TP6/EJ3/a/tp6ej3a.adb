
--Escriba una función recursiva que cuente el número de nodos de una lista enlazada

with Listanoord, Ada.Integer_Text_Io, ada.Unchecked_Deallocation;
use ada.Integer_Text_IO;


procedure Tp6ej3a is
      
   cantelementos:positive:=10;--para cambiar la cantidad de elemntos de la lista

   package Listaint is new Listanoord(Integer);
   
   use Listaint;
   
   
 
   function Cuentanodosrec(Lista: Tipolista) return integer is 

      Ptr:Tipolista:=Lista;
      
   begin     
      
      if Vacia(Lista)then return 0; 
                           
         else
                 
            return Cuentanodosrec(sig(ptr)) + 1;
            
      end if;
      
        
   end Cuentanodosrec;
  
   List: Tipolista;
  

begin

   for I in 1..cantelementos loop
      Insertar(List, I);
   end loop;
   
put(cuentanodosrec(list));
   
end tp6ej3a;

