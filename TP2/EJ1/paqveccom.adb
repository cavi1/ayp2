package body Paqveccom is
   
   procedure Leer(Vec:out Tvec)is
   begin
      for I in Tindice'range loop
         get(Vec(I));
      end loop;
   end Leer;
   
   procedure escribir(Vec:in Tvec)is
   begin
      for I in Tindice'range loop
         put(Vec(I));
      end loop;
   end escribir;

   function Norma(V:in Tvec)return Telemento is
      Acc:Telemento:=Accum;
   begin
      for I in Tindice'range loop
         Acc:=Acc+V(I)*v(i);
      end loop;
      return Sqrt(Acc);
   end Norma;
   
   function Comparacion(Vec1,Vec2: Tvec) return Boolean is
   begin
      return Norma(Vec1)>Norma(Vec2);-- true si vec1 es mayor a vec 2, false si vec2 es menor o igual a vec1
   end Comparacion;
   
   procedure Ordenamiento (Vec:in out Tvec) is
      aux:telemento;
      begin
         for I in Tindice'range loop
            for J in Tindice'First..Tindice'Last-I loop
               if Vec(j)>Vec(Tindice'Succ(j)) then
                  Aux:=Vec(j);
                  Vec(j):=Vec(Tindice'Succ(j));
                  Vec(Tindice'Succ(j)):=Aux;
               end if;
             end loop;
          end loop;
   end Ordenamiento;
            
      procedure Busqueda(Vec: in Tvec; Elem: in Telemento; pos:out tindice; found:out boolean)is
         begin
            found:=false;--y pos tiene kk
            for I in Tindice'range loop
               if Vec(I)=Elem then
                  Pos:=I;
                  Found:=True;
               end if;
            end loop;
         end Busqueda;
         

   
         
      
   end Paqveccom;
   
         
            
            
                        
                  
         
   
