with Ada.Text_Io, Matpaqcom, ada.Integer_Text_IO;
use ada.Text_IO, ada.Integer_Text_IO;
   
procedure Clientetp1ej4 is
   
   Maxfils:Integer:=2;
   Maxcols:Integer:=2;
   
      subtype Filas is Integer range 1..maxfils;
      subtype Columnas is Integer range 1..maxcols;
      
      procedure Getint(X:out Integer) is
      begin
         Get(X);
         skip_line;
      end Getint;
      
      procedure putint(X:in Integer) is
      begin
         put(X);
      end putint;



      package matint is new matpaqcom(integer, filas, columnas, getint, putint, ">","-");
      use Matint;
      
      Mat1,Mat2:Matrix;
      filaretornada:Filas;
      columnaretornada, columnaelegida:Columnas;
      Encontrado, esmayor:Boolean;
      Mattrans:Transmatrix;
      elembuscado:integer;
      
      begin
      
         Put_line("escriba la matriz 1("&integer'image(maxfils*maxcols)&" elementos): ");
         leomat(Mat1);
         Put_line("escriba la matriz 2("&integer'image(maxfils*maxcols)&" elementos): ");
         Leomat(Mat2);
         
         Put_line("la matriz 1 es: ");
         Escribomat(Mat1);
         new_line;
         put_line("la matriz 2 es: ");
         Escribomat(Mat2);
         new_line;
         

         Esmayor:=Comparacion(Mat1,Mat2);
         if Esmayor then
            Put_line("la matriz 1 es mayor a la 2");
         else 
            Put_line("la matriz 2 es mayor a la 1 (o son iguales)");
         end if;
         
         
         Put_line("elija la columna a ordenar de la matriz 1: ");
         get(columnaelegida);skip_line;
         Ordenamiento(Mat1, maxfils, columnaelegida);
         Put_line("la matriz 1 ordenada por la columna "&integer'image(columnaelegida)&" es: ");
         Escribomat(Mat1);
         
         Put_Line("escriba el elemento a buscar de la matriz 1: ");
         get(elembuscado);skip_line;
         
         
         Busqueda(Mat1,Elembuscado,filaretornada,columnaretornada,Encontrado);
         
         if Encontrado then 
            put_line("el elemento buscado se encuentra dentro de la matriz, en la fila " & Integer'Image(filaretornada) &" y en la conlumna " & Integer'Image(columnaretornada));
         else
            put_line("el elemento no fue encontrado");
         end if;
         
         transponer(mat1,mattrans);
         Put_line("la matriz 1 transpuesta es: ");
         Escribomattrans(Mattrans);
         new_line;
         
         transponer(mat2,mattrans);
         Put_line("la matriz 2 transpuesta es: ");
         Escribomattrans(Mattrans);
         
      exception
         
         when Data_Error => begin
               Put("error de dato"); end;
         when Constraint_Error => begin
               Put("fuera del rango de la matriz"); end;
               
            
         
         
         
     end clientetp1ej4;
       
