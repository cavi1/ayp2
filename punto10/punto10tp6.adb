with Ada.Text_Io, Listaenlazada, Listaenlazadaordenada;
use Ada.Text_Io;
procedure Punto10tp6 is
   
   subtype String15 is String(1..30);
   subtype String20 is String(1..20);
   
   type R_Ingrediente is record
      IngName: String15;
      ILong: Natural;
   end record;
   
   package Lista_Ingredientes is new Listaenlazada(R_Ingrediente);
   use Lista_Ingredientes;
   
   type R_postre is record
      RName: String20;
      Rlong: Natural;
      Ingredientes: Lista_Ingredientes.Tlista;
   end record;
   
   function "<" (X,Y: R_postre) return Boolean is
   begin
      return X.Rname < Y.Rname;
   end "<";
   
   function ">" (X,Y: R_postre) return Boolean is
   begin
      return X.rname > Y.rname;
   end ">";
   
   package Lista_postres is new Listaenlazadaordenada (R_postre, "<", ">");
   use Lista_Postres;
   Listadepostres: Lista_Postres.Tlista;
   

   package Lista_nombres is new Listaenlazadaordenada (string20, "<", ">");
   use Lista_Nombres;
   
   Listadenombres: Lista_Nombres.Tlista;
--------------------------------------------------------------------------------------   

   procedure Cargar_Ingredientes (lista: out lista_ingredientes.tlista) is
      Regi: R_Ingrediente;
      Rta: Character;
   begin
      Limpiar(Lista);
      Rta:= 's';
      Put("  ingrese los ingredientes del postre ");
      New_Line;
      while Rta = 's' loop
         Get_Line(Regi.Ingname, Regi.Ilong);
         Skip_Line;
         Insertar(Lista, Regi);
         Put("  hay mas ingredientes? ");
         Get(Rta);
         Skip_Line;
      end loop;
   end Cargar_Ingredientes;     
            
   procedure Crear_Postres (listan: in out lista_nombres.tlista; Listap: in out Lista_Postres.Tlista) is
      Regi: R_Postre;
   begin
      Put(" Ingrese el nombre del postre que quiere añadir a la lista: ");
      Get_Line(Regi.Rname, Regi.Rlong);
      Skip_Line;
      Insertar(Listan, Regi.Rname);
      Cargar_Ingredientes(Regi.Ingredientes);
      Insertar (Listap, Regi);
   end Crear_Postres;
      
   procedure Imprimir(Lista: in out Lista_Ingredientes.Tlista) is
      Listaux: Lista_Ingredientes.Tlista:= Lista;
      Regi: R_ingrediente;

   begin
      while not Vacia(Listaux) loop
         Suprimirporfrente(Listaux,Regi);
         Put_Line (regi.ingname (1..regi.ilong));
         New_Line;
      end loop;
   end Imprimir;
   
   
   procedure buscar_imprimir (listan: in out lista_nombres.tlista; Listap: in out Lista_postres.Tlista) is
      Nombreaux1, nombreaux2: String20;
      Longaux1, longaux2: Natural;
      Listaux: Lista_Postres.Tlista:=Listap;
      Listaing: Lista_Ingredientes.Tlista;
   begin
      Put(" ingrese el nombre del postre que quiere imprimir ");
      New_Line;
      Get_Line(Nombreaux1, Longaux1);
      Nombreaux2:=Info(Listaux).rname;
      Longaux2:= Info(Listaux).rlong;
      while Nombreaux1(1..Longaux1) /= nombreaux2(1..longaux2) or vacia(listaux) loop
         Listaux:= Sig(Listaux);
         Nombreaux2:=Info(Listaux).Rname;
         Longaux2:= Info(Listaux).Rlong; 
      end loop;
      if Vacia(Listaux) then
         Put( " el postre no esta en la lista ");
      else
         Listaing:= Info(Listaux).Ingredientes;
         Put(" los ingredientes del postre son: ");
         Imprimir(Listaing);
      end if;
   end Buscar_Imprimir;
      
      

begin
   Crear_Postres (Listadenombres, Listadepostres);
   Buscar_Imprimir(Listadenombres, Listadepostres);
end Punto10tp6;

   
      
