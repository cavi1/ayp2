with listanoord;

package Receta is
   
      type Treceta is private;
      
      subtype Cade_Nombre_Ingrediente is String(1..20);
      

      type Tingrediente is record
         Nombre_Ingrediente:Cade_Nombre_Ingrediente;
         Long_Nombre_Ingrediente:positive;
         Ingrediente_Cantidad:positive;      end record;

      package Lista_Ingredientes is new Listanoord(Tingrediente);
      use lista_ingredientes;

   
      subtype Cade_nombre_receta is String(1..20);
      subtype Cade_modo_preparacion is String(1..500);
      subtype rDia is Positive range 1..31;
      subtype rMes is Positive range 1..12;
      subtype ranio is positive range 1995..2999;

      procedure Creareceta(Receta:out Treceta);
      procedure Agregaingrediente(Receta:in out Treceta);
      procedure Eliminaingrediente(Receta:in out Treceta);
      procedure Desplegareceta(Receta:in Treceta);
      
      type Tregi_Fecha is record
         Dia:Rdia;
         Mes:Rmes;
         Anio:Ranio;
      end  record;       
         
      private
      type Treceta is record
         Nombre_receta:Cade_nombre_receta;
         Long_Nombre_receta:Positive;
         Lista_ingredientes:Tipolista;
         Modo_Preparacion:Cade_modo_preparacion;
         Long_Modo_Preparacion:Positive;         
         tiempo_preparacion: positive;
         Fecha_Uso:tregi_fecha;
      end record;
      
end Receta;
   
