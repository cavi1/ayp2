--lista ordenada de registros de pozos ordenados por codigo de identificacion
with Listaord, Ada.Integer_Text_Io, ada.Text_IO, ada.Float_Text_IO;
use ada.Integer_Text_IO, ada.Text_IO, ada.Float_Text_IO;
procedure Parcialej1 is
   
   subtype Cade11 is String(1..11);
   subtype cade5 is string(1..5);
   type Tpozo is record
      Coordenada:Cade11;
      Codigo:Cade5;
      produccion:natural;
      Categoria:float;
   end record;
   
   function "<" (X,Y:Tpozo) return Boolean is
   begin
      return X.Codigo<Y.Codigo;
   end "<";
   
     function ">" (X,Y:Tpozo) return Boolean is
   begin
      return X.Codigo>Y.Codigo;
   end ">";


   package Listapozos is new Listaord(Tpozo, "<", ">");
   use Listapozos;
   
   procedure Cargar_Lista(Lista:out Tipolista) is--para no tener que estar ingresando a cada rato, cargo 3 pero se pueden cargar mas y va a funcionar
   regi:tpozo;
   begin
      Crear(Lista);
      limpiar(lista);
      Regi.Coordenada:="-1234,-5678";
      Regi.Codigo:="LP100";
      Regi.Produccion:=500;
      regi.categoria:=float(regi.produccion)/100.0;
      Insertar(Lista,Regi);
      Regi.Coordenada:="-4321,-9876";
      Regi.Codigo:="AB200";
      Regi.Produccion:=350;
      regi.categoria:=float(regi.produccion)/100.0; 
      Insertar(Lista,Regi);
      Regi.Coordenada:="-9321,-3244";
      Regi.Codigo:="WX700";
      Regi.Produccion:=200;
      regi.categoria:=float(regi.produccion)/100.0; 
      Insertar(Lista,Regi);
      Regi.Coordenada:="-9990,-3324";
      Regi.Codigo:="UU700";
      Regi.Produccion:=700;
      Regi.Categoria:=Float(Regi.Produccion)/100.0;
      Insertar(Lista,Regi);
      Regi.Coordenada:="-1010,-1114";
      Regi.Codigo:="IT800";
      Regi.Produccion:=500;
      Regi.Categoria:=Float(Regi.Produccion)/100.0;
      Insertar(Lista,Regi);
   end Cargar_Lista;
   
   function Cuentapozos(Lista:in Tipolista) return Natural is      Ptr:Tipolista:=lista;
      cont:natural:=0;
   begin
      while not Vacia(Ptr) loop
         Cont:=Cont+1;
         ptr:=sig(ptr);
      end loop;
      return cont; 
   end Cuentapozos;
   
   function valorumbral (Lista:in Tipolista) return float is
      Ptr:Tipolista:=Lista;
      Cantpozos:Natural:=Cuentapozos(Lista);
      Accum:Natural:=0;
      promedio:float;
   begin
      
      while not Vacia(Ptr) loop
         Accum:=Accum+Info(ptr).Produccion;
         Ptr:=Sig(Ptr);
      end loop; 
         
      promedio:=Float(Accum)/Float(Cantpozos);
      
      return promedio;

   end Valorumbral;
   
   procedure Superan(Lista:in Tipolista) is
      Ptr:Tipolista:=Lista;
      vumbral:float:=valorumbral(lista);   
   begin
      put_line("los pozos cuya produccion supera el valor umbral son: ");
      while not Vacia(ptr) loop
         if  Vumbral <= Float(Info(Ptr).Produccion) then
            put("codigo: ");
            Put(Info(Ptr).Codigo);New_Line;
            put("coordenada: ");
            Put(Info(Ptr).Coordenada);New_Line;
            put("produccion: ");
            Put(Info(Ptr).Produccion);New_Line;
            put("categoria: ");
            Put(Info(Ptr).Categoria,3,2,0);New_Line;
         end if;
         ptr:=sig(ptr);
      end loop;
   end Superan;
   
    
begin 
   Cargar_Lista(List);
   --put(cuentapozos(list));new_line;
   superan(list);  
end parcialej1;
