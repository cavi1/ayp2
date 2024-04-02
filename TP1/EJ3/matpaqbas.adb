package body Matpaqbas is 
   
  procedure Escribomat(matriz: out matrix)is
         begin
            for I in Tfil'First..Tfil'Last loop
               for J in Tcol'First..Tcol'Last loop
                  Get(Matriz(i,j));
               end loop;
            end loop;
         end Escribomat;
         
   procedure leomat(matriz: in matrix)is
         begin
            for I in Tfil'First..Tfil'Last loop
               for J in Tcol'First..Tcol'Last loop
                  put(Matriz(i,j));
               end loop;
            end loop;
         end Leomat;
      end Matpaqbas;
              

         
        
