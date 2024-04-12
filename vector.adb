package body Vector is 
   procedure Leer (V: out Tvector) is
   begin
      for I in Tvector'range loop
         Get(V(I));
      end loop;
   end Leer;
   procedure Imprimir (V:in Tvector) is
   begin
      for I in Tvector'range loop
         Put (V(I));
      end loop;
   end Imprimir;
end Vector;

