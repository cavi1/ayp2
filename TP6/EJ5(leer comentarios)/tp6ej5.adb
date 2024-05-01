--Desarrollar el programa que realice lo siguiente:
--¨ Lea una lista A, cuyos nodos son una lista de caracteres.
--¨ A partir de A, generar una lista B que contenga sólo aquellos nodos de A que estén
--repetidos consecutivamente en ella.


--segun el ejemplo cada nodo de la lista A contiene una cadena de caracteres y si se repite alguna se debe copiar a la lista B
--ERROR QUE NO SE COMO ARREGLAR: si le doy al programa strings que comienzan con la misma letra (ej : abc a abc) y los escribo consecutivos, por mas que sean distintos, me los toma como iguales 
with Listanoord, Ada.Text_Io, ada.Integer_Text_IO;
use ada.Text_IO, ada.Integer_Text_IO;

procedure Tp6ej5 is
   
   cantpalabras:natural:=3;
   longmax:natural:=5;
   
   subtype Cadena is String(1..longmax);
   
   type Tregi is record
      Str:Cadena;
      Long:Natural;
   end record;
   
   
   package Listacomun is new Listanoord(tregi);
   use Listacomun;
   
   procedure Llenaestruc(Lista:in out Tipolista) is
   regaux:tregi;
   begin
      for I in 1..Cantpalabras loop
         Put_line("ingrese palabra: ");
         Get_Line(Regaux.Str,Regaux.Long);skip_line;
         Insertar(Lista, Regaux);
      end loop;
   end Llenaestruc;
   
   procedure Palarepe(Lista1: in Tipolista; Lista2: in out Tipolista) is
      Ptr,ant:Tipolista:=Lista1;
      Regaux:Tregi;
      Hayrepe:Boolean:=False;
      begin
         Ptr:=Sig(Ptr);
         
         while not Vacia(Ptr) loop
            
            if Info(ant).Str=info(ptr).str then--si estan repetidos pero no son consecutivos no se agregan
             
               if not esta(lista2,info(ant)) then
               Regaux.Str:=Info(ant).Str;
               Regaux.Long:=Info(ant).Long;
               Insertar(Lista2, Regaux);
               Hayrepe:=True;
               end if;                                  
               
            end if;
            ant:=ptr;
            Ptr:=Sig(Ptr);
            
         
      end loop;
      
      if not Hayrepe then
         Put("no hay string repetidos");
      end if;
      
   end Palarepe;
   
   procedure Imprimolista(Lista: in Tipolista) is
      Ptr:Tipolista:=Lista;
      regaux:tregi;
   begin
      while not Vacia(Ptr) loop
         Regaux.str:=Info(Ptr).Str;
         Regaux.long:=Info(Ptr).Long;
         Put(Regaux.Str(1..Regaux.Long));New_Line;
         ptr:=sig(ptr);
      end loop;
   end Imprimolista;
   


     
   List, listrepe:Tipolista;
         
   
begin
   Llenaestruc(List);
   put_line("la lista original es: ");
   Imprimolista(List);
   Put_Line("los elementos repetidos son: ");
   Palarepe(List,Listrepe);
   imprimolista(listrepe);
   
end Tp6ej5;

   
