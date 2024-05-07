with Listanoord, Ada.Text_Io, Ada.Integer_Text_Io;
use ada.Text_IO, ada.Integer_Text_IO;

procedure Tp6ej5 is 
   
   --generar una lista de lista de lista de caracteres
   
   package Lista_Int is new Listanoord(Character);
   use Lista_Int;
   
   package Lista_Ext is new Listanoord(tipolista);
   use Lista_Ext;
   
   procedure Llenalistachar(Listachar: out lista_int.Tipolista) is
      Char:Character;
      Cant:Positive;   
   begin
      Crear(Listachar);
      limpiar(listachar);
      Put_line("ingrese la cantidad de elementos de la lista interna de caracteres: ");
      Get(Cant);Skip_Line;
      for I in 1..Cant loop
         Put_line("ingrese el caracter "&Integer'Image(I));
         Get(Char);Skip_Line;
         Insertar(Listachar,Char);
      end loop;
   end Llenalistachar;
   
   procedure Llenalistaexterna(Listaext: out lista_ext.Tipolista) is
      Listacharaux:Lista_Int.Tipolista;
      Cant:Positive;
   begin
      Crear(Listaext);
      limpiar(listaext);
      Put_Line("ingrese la cantidad de elementos de la lista externa: ");
      get(cant);skip_line;   
      for I in 1..Cant loop
         Llenalistachar(Listacharaux);
         Insertar(Listaext,Listacharaux);
      end loop;
   end Llenalistaexterna;
   
   procedure Imprimolista(Listaext: in lista_ext.Tipolista) is
      Ptrext:Lista_Ext.Tipolista:=Listaext;
      ptrint:lista_int.tipolista;
   begin
      while not Vacia(Ptrext) loop
         ptrint:=info(ptrext);
         while not Vacia(Ptrint) loop          
            Put(Info(Ptrint));New_Line;
            ptrint:=sig(ptrint);
         end loop;
         Ptrext:=Sig(Ptrext);
      end loop;
   end Imprimolista;
   
   function Coincidencia (Lista1,Lista2:in Lista_Int.Tipolista) return Boolean is
      
      
    return true;     
   end Coincidencia;
   
   procedure Igualesconsecutivos (Listaext: in Lista_Ext.Tipolista; Listab:out Lista_Ext.Tipolista)is
      Ant:Lista_Ext.Tipolista:=Listaext;
      ptr:Lista_Ext.Tipolista:=sig(listaext);
   begin
      Crear(Listab);
      limpiar(listaB);
      while not Vacia(Ptr) loop
         if Coincidencia(Info(Ant),Info(Ptr)) then
            put_line("///////");
            Insertar(Listab,info(Ptr));
         end if;
         ptr:=sig(ptr);
      end loop;
   end Igualesconsecutivos;
    
      
                      
        
         
         

         

             




   List:Lista_Ext.Tipolista;
   listB:Lista_Ext.Tipolista;
   
begin
   Llenalistaexterna(List);
   Imprimolista(List);
   Igualesconsecutivos(List,Listb);
   imprimolista(listb);
   end tp6ej5;         
         

