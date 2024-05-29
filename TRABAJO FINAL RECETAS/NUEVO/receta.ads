with listanoord;

package Receta is--desarrollado por Cavieres Francisco
   
      type Treceta is private;
      
      subtype Cade_Nombre_Ingrediente is String(1..20);
      

      type Tingrediente is record--cada ingrediente en particular es un registro que contiene el nombre del ingrediente y la cantidad en gramos
         Nombre_Ingrediente:Cade_Nombre_Ingrediente;
         Long_Nombre_Ingrediente:positive;
         Ingrediente_Cantidad:positive;      end record;

      package Lista_Ingredientes is new Listanoord(Tingrediente);--instanciacion de la lista de ingredientes
      use lista_ingredientes;

   
      subtype Cade_nombre_receta is String(1..20); --declaracion de largos de cadenas usados en el tipo receta
      subtype Cade_modo_preparacion is String(1..500);
      subtype rDia is Positive range 1..31;--declaracion de rangos para fechas
      subtype rMes is Positive range 1..12;
      subtype ranio is positive range 1995..2999;

      procedure Creareceta(Receta:out Treceta);--procedimiento para crear la receta desde cero, va a ser necesario en el agregar receta del recetario
      procedure Agregaingrediente(Receta:in out Treceta);--agrego ingredientes a una receta seleccionada en el recetario, todavia no esta hecha la consistencia de si hay ingredientes repetidos 
      procedure Eliminaingrediente(Receta:in out Treceta);--faltari­a consistir la lista vaci­a(fixed)
      procedure Desplegareceta(Receta:in Treceta);--dispone en pantalla toda la informacion de una receta en particular
      function Info_Nombre_Receta(Receta: Treceta) return string;--funcion que devuelve nombre de una receta, es necesaria para buscar en el recetario
      function info_long_nombre_receta(receta: treceta) return positive;
      --segun se considere agregar mas filtros de busqueda habria que hacer funciones de acceso a otros campos    
      --vimos que en la consigna aclara que no debe haber recetas con el nombre repetido pero eso deberia consistirse en el recetario al ingresar una receta   
      type Tregi_Fecha is record --registro que contiene fechas que forman parte de cada receta
         Dia:Rdia;
         Mes:Rmes;
         Anio:Ranio;
      end  record;       
         
      private
      type Treceta is record --tipo privado creado para el tad
         Nombre_receta:Cade_nombre_receta;
         Long_Nombre_receta:Positive;
         Lista_ingredientes:Tipolista;
         Modo_Preparacion:Cade_modo_preparacion;
         Long_Modo_Preparacion:Positive;         
         tiempo_preparacion: positive;--tiempo de preparacion en minutos
         Fecha_Uso:tregi_fecha;
         --se podri­a agregar campos extra como por ejemplo si es un plato salado o dulce o si es un postre o si es sin tacc, vegano etc
      end record;
      
end Receta;
   
