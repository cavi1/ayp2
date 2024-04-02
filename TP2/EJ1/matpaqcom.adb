with ada.Text_IO; use ada.Text_IO;--es solo para que la matriz se vea bien (despues lo saco)
package body Matpaqcom is 
   
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
               new_line;
            end loop;
         end Leomat;
     
   procedure leomattrans(matriz: in transmatrix)is
   begin
         for i in Tcol'First..Tcol'Last loop
            for J in Tfil'First..Tfil'Last loop
                  put(Matriz(i,j));
            end loop;
             new_line;  
          end loop;
         end Leomattrans;



      
      procedure Porcentajes(Mat1,Mat2: in Matrix;Porc1,Porc2: out Float)is
         
         Cont1,Cont2,contgen:Float:=0.0;
         
         begin
         
         for I in Tfil'First..tfil'Last loop
            for J in Tcol'First..Tcol'Last loop
               if Mat1(I,J)>Mat2(I,J) then
                  Cont1:=Cont1+1.0;
               else 
                  Cont2:=Cont2+1.0;
               end if;
                  contgen:=contgen+1.0;
            end loop;
         end loop;
            
         Porc1:=Cont1/contgen;
         Porc2:=Cont2/Contgen;
            
         end Porcentajes;
         
         function Comparacion(Mat1,Mat2:matrix)return boolean is
            Porc1,Porc2:Float;
            resu:boolean;
         begin
            Porcentajes(Mat1,Mat2,Porc1,Porc2);
            if Porc1>Porc2 then
               Resu:=True;
            else
               Resu:=False;
            end if;
            return resu;
         end Comparacion;
            
         procedure Ordenamiento(Mat: in out Matrix; Fil: in Tfil) is
         Aux: Telemento;
         begin
             for J in Tcol'First .. Tcol'Last loop
                 for I in Tfil'First .. Tfil'pred(fil) loop
                     for K in Tfil'First .. Tfil'last - I loop
                         if Mat(k, J) > Mat(tfil'succ(k), J) then
                             Aux := Mat(k, J);
                             Mat(k, J) := Mat(tfil'succ(k), J);
                             Mat(tfil'succ(k), J) := Aux;
                         end if;
                     end loop;
                 end loop;
             end loop;
         end Ordenamiento;
         
         procedure Busqueda(Mat: in Matrix; Elem: in Telemento;posifils:out tfil;posicols:out tcol; Found: out Boolean) is
         begin
         found:=false;--y las posis van a tener kk
            for I in tfil'first..tFil'last loop
               for J in tcol'first..tcol'last loop
                  if Mat(I,J)=Elem then
                     Posifils:=I;
                     posicols:=j;
                     Found:=True;
                  end if;
               end loop;
            end loop;
               
         end Busqueda;
         
         procedure Transponer (Mat1: in Matrix;mat2: out transmatrix) is
         
         begin
            for I in Tfil'First..Tfil'Last loop
               for J in Tcol'First..Tcol'Last loop
                  mat2(j,i):=mat1(i,j);
               end loop;
            end loop;
         end Transponer;
         
            
               
                  
 end Matpaqcom;
         
      

         
