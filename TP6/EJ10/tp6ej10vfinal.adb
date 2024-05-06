with Ada.Integer_Text_Io,Ada.Text_Io,Listanoord, listaord, ada.Characters.Handling;
use Ada.Integer_Text_Io, Ada.Text_Io, Ada.Characters.Handling;


procedure Tp6ej10vfinal is
 
cantpostres:positive:=2;

subtype cade is string(1..20);

type Tregingrediente is record
   Ingrediente:Cade;  
   Long:Positive;
end record;

package Listaingredientes is new Listanoord(Tregingrediente);--lista de ingredientes que tendrá cada postre
use Listaingredientes;

type Tpostre is record
   Nombre:Cade;
   Long:Positive;
   listaingredientes:tipolista;
end record;

 function "<"(X,Y:Tpostre) return Boolean is
   begin
      return X.nombre<Y.nombre;
   end "<";
   
   
   function ">"(X,Y:Tpostre) return Boolean is
   begin
      return X.nombre<Y.nombre;
   end ">";

package postrelista is new Listaord(Tpostre, "<", ">");
use postrelista;


--------------------------------------------------------------------------------
 procedure Ingresaingredientes (Ingredienteslista:out listaingredientes.Tipolista) is
      Cant:Positive;
      regiaux:tregingrediente;
   begin
      Put_line("ingresa la cantidad de ingredientes: ");  
      Get(Cant);skip_line;
      for I in 1..Cant loop
         Put_line("ingresa el nombre del ingrediente "&integer'image(i)&": ");         Get_Line(regiaux.Ingrediente, regiaux.long);skip_line;--lleno los ingredientes
         insertar(ingredienteslista,regiaux);--los inserto en la lista de ingredientes
      end loop;
   end Ingresaingredientes;
   

   procedure Ingresapostre(regipostre: out tpostre) is                                 ---estos tres procedimientos corresponden al llenado de la estructura
   listaux:listaingredientes.tipolista;
   begin
      Put_line("ingrese el nombre del postre a agregar: ");
      Get_Line(regipostre.nombre, regipostre.Long);skip_line;
      Ingresaingredientes(Listaux);
      regipostre.Listaingredientes:=Listaux;
   end Ingresapostre;
   

   procedure Insertolistapostres(Listapostres:out Postrelista.Tipolista) is
   regiaux:tpostre;
   begin
      for i in 1..cantpostres loop
      Ingresapostre(Regiaux);--lleno el registro
      Insertar(Listapostres, Regiaux);--lo inserto en la lista de postres
      end loop;
   end Insertolistapostres;   

----------------------------------------------------------------------------------- a)

   function Coincidenombre(Regi:Tpostre; Str:Cade) return Boolean is
   begin
      return Regi.Nombre(1..Regi.Long)=Str(1..Regi.Long);
   end Coincidenombre;
   
   procedure Imprimolista(Lista:in Listaingredientes.Tipolista) is
   ptr:Listaingredientes.Tipolista:=lista;
   begin
      while not Vacia(Ptr) loop
         Put(Info(ptr).Ingrediente(1..Info(ptr).Long));new_line;
         ptr:=sig(ptr);
      end loop;
   end Imprimolista;
     

   procedure veringredientes(listapostres:in postrelista.tipolista)is --debo recorrer la lista, verificar que el nombre coincida, 
      Listapostresaux:Postrelista.Tipolista:=Listapostres;
      Postreingresado:Cade;
      Long:Positive;
      encontrado:boolean:=false;
   begin
      
      Put("ingrese el postre para ver sus ingredientes: ");
      Get_line(Postreingresado,long);skip_line;
      
      while not Vacia(Listapostresaux) and not encontrado loop
         
         if Coincidenombre(Info(Listapostresaux),Postreingresado) then
            Put_line("ingredientes: ");
            Imprimolista(Info(Listapostresaux).Listaingredientes);
            encontrado:=true;
         end if;
         
         Listapostresaux:=Sig(Listapostresaux);
            
      end loop;
      
      if not Encontrado then
         Put("el postre no fue encontrado");
      end if;
      
   end Veringredientes;
   
   -------------------------------------------------------------------------------------------- b)
     
   procedure Agregar(Postre:in out Tpostre) is
      Cant:Positive;
      regiaux:tregingrediente;
   begin
      Put_line("ingresa la cantidad de ingredientes que vas a agregar: ");
      Get(Cant);Skip_Line;
      for I in 1..Cant loop
         Put_line("ingrese el nombre del ingrediente: ");
         get_line(regiaux.ingrediente, regiaux.long);   
         Insertar(Postre.Listaingredientes,Regiaux);
      end loop;
   end Agregar;
   



   procedure Insertarnuevosingredientes(listapostres:in out postrelista.tipolista) is --debo ingresar un postre y agregarle ingredientes a su lista de ingredientes
      Postreingresado:Cade;
      long:positive;
      Listapostresaux:Postrelista.Tipolista:=Listapostres;
      Regicopiapostre:Tpostre;
      encontrado:boolean:=false;
   begin
    
      Put_line("ingrese el postre para agregar ingredientes: ");
      Get_Line(Postreingresado,Long);Skip_Line;
      
      while not Vacia(Listapostresaux) and not encontrado loop
         
         if Coincidenombre(Info(Listapostresaux),Postreingresado) then--debo copiar el registro, modificar su lista, suprimir lo que habia, y volverlo a insertar
            Regicopiapostre:=Info(Listapostresaux);
            Suprimir(Listapostres,Regicopiapostre);
            agregar(regicopiapostre);   
            Insertar(Listapostres,Regicopiapostre);
            encontrado:=true;--si ya encontre el postre para agregar el ingrediente me puedo salir del loop
         end if;   
         
         listapostresaux:=sig(listapostresaux);
      end loop;
      
   end Insertarnuevosingredientes;
  
   
   ---------------------------------------------------------------------------------------------
   function Coincidenombreingrediente(Regi:Tregingrediente; Str:Cade) return Boolean is
   begin
      return Regi.Ingrediente(1..Regi.Long)=Str(1..Regi.Long);
   end Coincidenombreingrediente;


   procedure quitar(Postre:in out Tpostre) is--si quiero eliminar un ingrediente de una lista, debo buscar el elemento, copiarlo y mandarlo a suprimir
      Regiaux:Tregingrediente;
      Listaux:Listaingredientes.Tipolista:=Postre.Listaingredientes;
      Encontrado:Boolean:=false;
      Long:Positive;
      ingredientebuscado:cade;
   begin
      
      Put_Line("inserte el nombre del ingrediente a eliminar: ");
      get_line(ingredientebuscado,long);  
      while not Vacia(Listaux) and not encontrado loop  
         if Coincidenombreingrediente(Info(Listaux),Ingredientebuscado) then
            Regiaux:=Info(Listaux);
            Suprimir(Postre.Listaingredientes,Regiaux);
            encontrado:=true;
         end if;
      listaux:=sig(listaux);   
      end loop;    
                   
   end quitar;
        



   procedure Eliminaringrediente(listapostres:in out postrelista.tipolista) is--debo ingresar un postre y eliminar ingredientes de su lista de ingredientes--punto c)
      Postreingresado:Cade;      
      Long:Positive;      
      Listapostresaux:Postrelista.Tipolista:=Listapostres;
      Regicopiapostre:Tpostre;
      encontrado:boolean:=false;
   
   begin
   
      Put_line("ingrese el postre para eliminar sus ingredientes: ");
      Get_Line(Postreingresado,Long);Skip_Line;
      
      while not Vacia(Listapostresaux) and not Encontrado loop
         
         if Coincidenombre(Info(Listapostresaux),Postreingresado) then                       
            Regicopiapostre:=Info(Listapostresaux);            
            Suprimir(Listapostres,Regicopiapostre);
            quitar(regicopiapostre);--debo quitar ingredientes del registro para luego volverlo a insertar
            Insertar(Listapostres,Regicopiapostre);
            Encontrado:=True;
         end if;
         
         Listapostresaux:=Sig(Listapostresaux);
         
      end loop;
      
   end Eliminaringrediente;
        


--------------------------------------------------------------------------------------

   procedure Agregarpostre (Listapostres:in out Postrelista.Tipolista) is--d)
   regiaux:tpostre;
   begin
      Ingresapostre(Regiaux);
      Insertar(Listapostres, Regiaux);
   end Agregarpostre;

-----------------------------------------------------------------------------------------

   procedure Dardebaja (Listapostres: in out Postrelista.Tipolista) is--e)
      Postreingresado:Cade;
      Long:Positive;
      Regicopiapostre:Tpostre;
      Encontrado:Boolean:=False;
      listapostresaux:postrelista.tipolista:=listapostres;
   begin
      Put_line("ingrese el nombre del postre para dar de baja: ");
      Get_Line(Postreingresado,Long);Skip_Line;
      
      while not Vacia(Listapostresaux) and not Encontrado loop
         
         if Coincidenombre(Info(Listapostresaux),Postreingresado) then
            Suprimir(Listapostres,info(listapostresaux));
            Put_Line("el postre ha sido borrado");
            Encontrado:=True;
         end if;
         listapostresaux:=sig(listapostresaux);
      end loop;
      listapostres:=listapostresaux;
   end Dardebaja;
   
---------------------------------------------------------------------------------------------         



   List:Postrelista.Tipolista;
       
begin
   Insertolistapostres(List);
   Veringredientes(List);
   --Insertarnuevosingredientes(List);
   --Veringredientes(List);
   --Eliminaringrediente(List);
   --Veringredientes(List);
   dardebaja(list);
   veringredientes(list);
end Tp6ej10vfinal;


