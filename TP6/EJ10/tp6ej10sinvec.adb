with Ada.Integer_Text_Io,Ada.Text_Io,Listanoord, listaord, ada.Characters.Handling;
use Ada.Integer_Text_Io, Ada.Text_Io, ada.Characters.Handling;

procedure Tp6ej10sinvec is
 
   Cantpostres:Positive:=2;
   
   subtype Cade is String(1..20);
   
   type Tregingrediente is record
      Ingrediente:Cade;
      Long:positive;
   end record;
   
   package Ingrelista is new Listanoord(Tregingrediente);
   use ingrelista;
        
   type Tpostre is record
      Postrenombre:Cade;
      nombre_long:positive;
      Listaingredientes:Tipolista;
   end record;
   
   function "<"(X,Y:Tpostre) return Boolean is
   begin
      return X.Postrenombre<Y.Postrenombre;
   end "<";
   
   function ">"(X,Y:Tpostre) return Boolean is
   begin
      return X.Postrenombre<Y.Postrenombre;
   end ">";
   
   package Postrelista is new Listaord(Tpostre, "<", ">"); 
   use Postrelista;--------------------------------------------------------------------------------------  
   procedure Ingresaingredientes (Ingredienteslista: out Ingrelista.Tipolista) is
      Cant:Positive;
      regiaux:tregingrediente;
   begin
      Put("ingresa la cantidad de ingredientes: ");  
      Get(Cant);skip_line;
      for I in 1..Cant loop
         Put_line("ingresa el nombre del ingrediente "&integer'image(i)&" : ");         Get_Line(regiaux.Ingrediente, regiaux.long);
         insertar(ingredienteslista,regiaux);
      end loop;
   end Ingresaingredientes;
   

   procedure Ingresapostre(regipostre:out tpostre) is                                 ---estos tres procedimientos corresponden al llenado de la estructura
   listaux:ingrelista.tipolista;
   begin
      Put_line("ingrese el nombre del postre a agregar: ");
      Get_Line(regipostre.Postrenombre, regipostre.Nombre_Long);
      Ingresaingredientes(Listaux);
      regipostre.Listaingredientes:=Listaux;
   end Ingresapostre;
   

   procedure Insertolistapostres(Listapostres:out Postrelista.Tipolista) is
   regiaux:tpostre;
   begin
      for i in 1..cantpostres loop
      Ingresapostre(Regiaux);
      Insertar(Listapostres, Regiaux);
      end loop;
   end Insertolistapostres;
-------------------------------------------------------------------------------------   
   procedure Imprimoingredientes(Listapostres:in Postrelista.Tipolista) is --a)
      Listapostresaux:Postrelista.Tipolista:=Listapostres;
      listaingredientesaux:ingrelista.tipolista;
      Postrebuscado:Cade;
      Long:Positive;
      encontrado:boolean:=false;
   begin
      Put_Line("ingrese el postre a buscar: ");
      get_line(postrebuscado,long);skip_line;
      while not Vacia(Listapostresaux) loop
         
         if Info(Listapostresaux).Postrenombre(1..Long) = Postrebuscado(1..Long) then
            encontrado:=true;
            Put(Postrebuscado(1..long));New_Line;
            listaingredientesaux:=info(listapostresaux).listaingredientes;
            Put_Line("sus ingredientes son: ");
            
            while not Vacia(Listaingredientesaux) loop
               Put(Info(Listaingredientesaux).Ingrediente(1..Info(Listaingredientesaux).Long));new_line;
               listaingredientesaux:=sig(listaingredientesaux);
            end loop;
            
         end if;
         
         Listapostresaux:=Sig(Listapostresaux);
                
      end loop;
      
      if not Encontrado then
         Put_line("el postre no fue encontrado");
      end if;
      
      
   end Imprimoingredientes;
 ----------------------------------------------------------------------------------------------------  
  



   procedure Agregoingredientes(Listapostres:in out Postrelista.Tipolista) is--b)
      Listapostresaux:Postrelista.Tipolista:=Listapostres;
      Encontrado:Boolean:=False;
      Regingrediente:Tregingrediente;
      Postrebuscado:Cade;
      Long:Positive;
      Rta:Character;
      regipostreauxnuevo,regipostreauxviejo:tpostre;
   begin
      Put_Line("ingrese el postre al que quiera agregar ingredientes");
      Get_Line(Postrebuscado,Long);
      
      while not Vacia(Listapostresaux) loop
         
         if Info(Listapostresaux).Postrenombre(1..Long) = Postrebuscado(1..Long) then
            Encontrado:=True;
            

            Regipostreauxviejo.postrenombre:=info(listapostresaux).postrenombre;--copio en el registro viejo la info actual 
            Regipostreauxviejo.nombre_long:=info(listapostresaux).nombre_long;
            Regipostreauxviejo.Listaingredientes:=Info(Listapostresaux).Listaingredientes;
            
            regipostreauxnuevo:=regipostreauxviejo;--copio la info del viejo en el nuevo            
            Rta:='S';
            
                       
            while RTA='S' loop
               Put_line("ingrese el ingrediente a agregar: ");
               Get_Line(Regingrediente.Ingrediente, Regingrediente.Long);
               Insertar(regipostreauxnuevo.listaingredientes,Regingrediente);--inserto en la lista del registro nuevo, los ingredientes agregados   
               Put_Line("ingrese 'S' si desea continuar agregando ingredientes: ");
               Get(Rta); Skip_Line;
               rta:=to_upper(rta);
            end loop;
            
            Suprimir(Listapostres, regipostreauxviejo); --borro el registro viejo, no tengo que usar el "esta" porque lo copie tal cual, ya se que va a estar 
            insertar(listapostres, regipostreauxnuevo);  --agrego el nuevo con la lista actualizada 
         
         end if;
         
         Listapostresaux:=Sig(Listapostresaux);
                
      end loop;
      
      if not Encontrado then
         Put_Line("el postre no se encuentra en la lista");
      end if;
      
      
   end Agregoingredientes;
   
----------------------------------------------------------------------------------------------------------------------------------  
   procedure Eliminaingredientes(Listapostres:in out Postrelista.Tipolista) is --c)
      Postrebuscado:Cade;
      Long:Positive;
      Listapostresaux:Postrelista.Tipolista:=Listapostres;
      Regipostreauxviejo,Regipostreauxnuevo:Tpostre;
      Listauxregiviejo:Ingrelista.Tipolista;
      Rta:Character;
      Regingrediente:Tregingrediente;
      encontrado:boolean:=false;
   begin
      
      Put_Line("ingrese el postre al que quiera eliminarle ingredientes: ");
      Get_Line(Postrebuscado,Long);
      
      while not Vacia(Listapostresaux) loop
         
         if Info(Listapostresaux).Postrenombre(1..Long) = Postrebuscado(1..Long) then
            
         
            Regipostreauxviejo.Postrenombre:=Info(Listapostresaux).Postrenombre;--copio en el registro viejo la info actual 
            Regipostreauxviejo.Nombre_Long:=Info(Listapostresaux).Nombre_Long;            
            Regipostreauxviejo.Listaingredientes:=Info(Listapostresaux).Listaingredientes; 
            listauxregiviejo:=Regipostreauxviejo.Listaingredientes;
      
            Regipostreauxnuevo:=Regipostreauxviejo;
            Rta:='S';
            
            while Rta='S' loop
               
               Put_Line("ingrese el ingrediente a eliminar: ");
               Get_Line(Regingrediente.Ingrediente, Regingrediente.Long);skip_line;
               
               while not Vacia(Listauxregiviejo) loop
                  
                  if  Regingrediente.Ingrediente(1..Regingrediente.Long)=info(listauxregiviejo).Ingrediente(1..Regingrediente.Long) then
                     Suprimir(Regipostreauxnuevo.Listaingredientes,Regingrediente);
                     Suprimir(Listapostres, Regipostreauxviejo);
                     Insertar(Listapostres, Regipostreauxnuevo);
                     encontrado:=true;                
                  end if;                  
                   
                  listauxregiviejo:=sig(listauxregiviejo);
               end loop;
               
               if not Encontrado then
                  Put_Line("el ingrediente no se encontro");
               end if;
               
               
               Put_Line("ingrese 'S' si desea continuar eliminando ingredientes: ");              
               Get(Rta);Skip_Line;               
               Rta:=To_Upper(Rta);                 
                             
            end loop;
            
         end if;
         
         Listapostresaux:=Sig(Listapostresaux);

                  
      end loop;
      
   end Eliminaingredientes;
   
-----------------------------------------------------------------------------------------------------         

   procedure Agregarpostre (Listapostres:in out Postrelista.Tipolista) is--d)
   regiaux:tpostre;
   begin
      Ingresapostre(Regiaux);
      Insertar(Listapostres, Regiaux);
   end Agregarpostre;
           
-----------------------------------------------------------------------------------------------------            

   procedure Quitarpostre (Listapostres:in out Postrelista.Tipolista) is--e)
      Regiaux:Tpostre;
      Listapostresaux:Postrelista.Tipolista:=Listapostres;
      Postreingresado:Cade;
      Long:Positive;
      encontrado:boolean:=false;
   begin
      Put_Line("ingrese el postre para dar de baja:" );
      Get_Line(Postreingresado,Long);Skip_Line;
      
      while not Vacia(Listapostresaux) loop
         
         if Info(Listapostresaux).Postrenombre(1..Long) = Postreingresado(1..Long) then
            encontrado:=true; 
                   
            Suprimir(Listapostres,Info(Listapostresaux));
            
            Put_Line("el postre ha sido dado de bajaa");
            
         end if;
         listapostresaux:=sig(listapostresaux);
      end loop;
      listapostres:=listapostresaux;--importante asignarle el nuevo frente a la lista original sino no se borra nada
      
      if not Encontrado then
         Put("el postre no fue encontrado");
      end if;
      
   end Quitarpostre;
   
 ------------------------------------------------------------------------------------------------------                
        
               

               
     

      
   
      
  list:Postrelista.Tipolista; 
   
begin
  insertolistapostres(list);  
  --Imprimoingredientes(List);
  --Agregoingredientes(List);
  --Imprimoingredientes(List); 
  --Eliminaingredientes(List); 
  --Imprimoingredientes(List);
   --Agregarpostre(List);
   --Imprimoingredientes(List);
   Quitarpostre(List);
   imprimoingredientes(list);
    
end Tp6ej10sinvec;
   
            
      
            
            
            
         
      
   
   