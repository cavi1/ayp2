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

      procedure Creareceta(Receta:out Treceta);--en realidad con esta se hace el archivo pero bueno igual va a servir cuando haya q armar el archivo seria basicamente copiar todo lo que conlleva esta funcion
      procedure Agregaingrediente(Receta:in out Treceta);--habria que agregar esto y consistir que el ingrediente no este repetido por ejemplo con una excepcion
      procedure Eliminaingrediente(Receta:in out Treceta);--habria que consistir que la lista de ingredientes no este vacía por ejemplo con una excepcion
      procedure Desplegareceta(Receta:in Treceta);
      function Info_Nombre_Receta(Receta: Treceta) return cade_Nombre_Receta;
         
         
         
         
         
         --en esta funcion uno puede elegir que ver de la receta o bien, ver todo
      -- se podri�a tambien agregar una funcion info que devuelva el nombre de la receta por si se quisiera hacer una busqueda por cierto tipo de receta
      -- se podria agregar una funcion que devuelva info en base a si la receta es salada o dulce o si es un postre o si es sin tacc, vegano etc (tambien para algun filtrado)
      --depende de las funciones que se elijan en el recetario
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
         --se podría agregar campos extra como por ejemplo si es un plato salado o dulce o si es un postre o si es sin tacc, vegano etc
      end record;
      
end Receta;
   
