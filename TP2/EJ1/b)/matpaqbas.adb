with Ada.Text_Io;
use ada.Text_IO;

package body Matpaqbas is 
   
  procedure leomat(matriz: out matrix)is
         begin
            for I in Tfil'First..Tfil'Last loop
               for J in Tcol'First..Tcol'Last loop
                  Get(Matriz(i,j));
               end loop;
            end loop;
         end leomat;
         
   procedure escribomat(matriz: in matrix)is
         begin
            for I in Tfil'First..Tfil'Last loop
               for J in Tcol'First..Tcol'Last loop
                  put(Matriz(i,j));
               end loop;
                  new_line;
            end loop;
         end escribomat;
      end Matpaqbas;
              

         
        
