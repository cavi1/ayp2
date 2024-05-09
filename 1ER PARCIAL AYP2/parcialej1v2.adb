--se almacaena una lista de pozos y cada pozo almacena una coordenada geográfica, produccción, código de identificación y categoría

--estructura: lista de registros

--a) instanciar los paquetes

--b) obtener la lista ordenada por codigo de indentificación

--c) conseravr la lista original

with Listaord, Ada.Text_Io, ada.Integer_Text_IO;
use ada.Text_IO, ada.Integer_Text_IO;

procedure Parcialej1 is
-------------------------------a)   
   
   subtype Cadecoord is String(1..11);--suponiendo que siempre tienen el mismo formato con 11 caracteres
   subtype cadecodigo is string(1..5);--idem   
   subtype rangoprod is natural range 0..999;
   
   type Tpozo is record
      Coordenada:Cadecoord;
      Codigo:Cadecodigo;
      Categoria:Float;
      Produccion:rangoprod;
   end record;
   
   function "<"(X,Y:in Tpozo) return Boolean is
   begin
      return X.Codigo>Y.Codigo;
   end "<";
   
   function ">"(X,Y:in Tpozo) return Boolean is
   begin
      return X.Codigo>Y.Codigo;
   end ">";

   package Listapozos is new Listaord(Tpozo, "<", ">");
   
   use Listapozos;
   
-----------------------------------b)
   

   function Vumbral(Listapozos:in tipolista)return Float is
      Ptr:Tipolista:=Listapozos;
      accum,totalpozos:natural:=0;
   begin
      while not Vacia(Ptr) loop
         Accum:=Accum+Info(Ptr).Produccion;
         totalpozos:=totalpozos+1;
         Ptr:=Sig(Ptr);
         end loop;
        
      return Float(Accum)/Float(Totalpozos);
      
   end Vumbral;
   

   procedure Superan(Listapozos:in Tipolista) is
   Ptr:Tipolista:=Listapozos;
   begin
      while not Vacia(Ptr) loop
         put_line("pozos que superan el valor umbral de produccion: ");
         if Float(Info(Ptr).Produccion) >= Vumbral(Listapozos) then
            Put_Line("código: ");
            Put_Line(Info(Ptr).Codigo);
            Put_Line("produccion: ");
            Put(Info(Ptr).Produccion);new_line;
         end if;
      end loop;
   end Superan;
   
 -----------------------------------c) la estructura no se modifica porque al moverme por la lista siempre utilizo punteros auxiliares
  
begin
   null;
end Parcialej1;

