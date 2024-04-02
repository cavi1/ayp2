with Ada.Text_Io, Matpaqcom, ada.Integer_Text_IO;
use ada.Text_IO, ada.Integer_Text_IO;
   
   procedure ClienteTp1ej4 is
      subtype Filas is Integer range 1..3;
      subtype Columnas is Integer range 1..4;
      
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
      Quefila:Filas;
      Quecolumna:Columnas;
      Encontrado:Boolean;
      mattrans:transmatrix;
      --Esmayor:Boolean;
      begin
      
         Put("escriba mat1: ");new_line;
         Escribomat(Mat1);
         --Put("escriba mat2: ");new_line;
         --escribomat(mat2);
         Put("la matriz 1 es: ");
         new_line;
         Leomat(Mat1);
         
         
         --put("la matriz 2 es: ");
         --Leomat(Mat2);
         --skip_line;

         --Esmayor:=Comparacion(Mat1,Mat2);
         --if Esmayor then
            --Put("la matriz 1 es mayor a la 2");
         --else 
            --Put("la matriz 2 es mayor a la 1 (o son iguales)");
         --end if;
         
         
         Ordenamiento(Mat1, 3, 2);
         Put("la mat1 ordenada por la columna 2 es: ");
         new_line;
         Leomat(Mat1);
         --Busqueda(Mat1,4,Quefila,Quecolumna,Encontrado);
         --if Encontrado then 
            --put("el elemento buscado se encuentra dentro de la matriz, en la fila " & Integer'Image(quefila) &" y en la conlumna " & Integer'Image(quecolumna));
         --else
          --put("el elemento no fue encontrado");
         --end if;
         --transponer(mat1,mattrans);
         --Put("la matriz 1 transpuesta es: ");
         --New_Line;
         --leomattrans(mattrans);
         
         
     end clientetp1ej4;
       
