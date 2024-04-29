with Listanoord, Ada.Integer_Text_Io, Ada.Text_Io;
use ada.Text_IO,Ada.Integer_Text_Io;


procedure Tp6ej3b is
   
   tamaniolista:positive:=4;
   
   package Listaint is new Listanoord(Integer);
   
   use Listaint;   
   function Cumple(Lista: Tipolista) return Boolean is
      
      Ant,Actual:Tipolista:=Lista;
      estaordenado:boolean:=true;
   
   begin
       
      if Vacia(lista) then
         
         return false;
     
      else     
      
      while not Vacia(Actual) and estaordenado loop
          
         if info(ant)<=info(actual) then-- la primera comparacion actual y anterior valen lo mismo
            
            estaordenado:=true;
         
         else 
            
            Estaordenado:=False;
            
         end if;
       
         Ant:=Actual;
         Actual:=Sig(Actual);
              
         
         end loop;
         
      end if;
      
     
   return estaordenado;
      
   end Cumple;
   




 function Cumplerec(Lista: Tipolista) return Boolean is
      
 begin
 
    if Vacia(lista)then  return false;--caso en que la lista pasada se encuentra sin elementos, si tiene elementos nunca va a entrar acá
    
    else 
       
       if Vacia(sig(Lista))then  return True;
       
       else
                       
          return Info(Lista)<=Info(Sig(Lista)) and Cumplerec(Sig(Lista));
          
       end if;
       
    end if;
    
      
 end Cumplerec;

   

   --procedure Imprimo(Lista: Tipolista) is
      --Ant,Actual:Tipolista:=Lista;
   --begin
      
      --while not Vacia(Actual) loop
        -- Put(Info(Ant));
        -- Put(Info(Actual));
         --Ant:=Actual;
         --Actual:=Sig(Actual);
     -- end loop;
  -- end Imprimo;
   




   List:Tipolista;
   
begin
   
  
   for I in 1..tamaniolista loop
      Insertarporfinal(List, I);
   end loop;
   
     --insertar(list,8);
  
   put(info(list));
   
   if Cumplerec(List) then
      Put("la lista esta ordenada");
   else 
      Put("la lista no esta ordenada/esta vacia");
   end if;
   
end Tp6ej3b;

      
         
         
