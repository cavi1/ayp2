with Ada.Text_Io;
use Ada.Text_Io;

package body vecUniPaqBas is 
   procedure Leer(V:out tarreglo) is 
   begin
      for I in V'range loop
         Get(V(I));
      end loop;
          
   end Leer;
   procedure Escribir(v:in tarreglo) is 
   begin
      for I in V'range loop
         Put(V(I));
      end loop;
   end Escribir;
end vecUniPaqBas;

