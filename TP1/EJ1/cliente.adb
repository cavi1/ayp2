with Ada.Integer_Text_Io, vecunipaqbas;
use Ada.Integer_Text_Io;
procedure Cliente is --voy a adaptar mi paquete a un arreglo unidimensional de enteros 
   subtype Tindex is Integer range 1..5;
   procedure Putint(X:in Integer) is
   begin
      Put(X);
   end Putint;
   procedure Getint(X:out Integer) is
   begin
      Get(X);
   end Getint;
   
   package Vecentero is new Vecunipaqbas(Integer, Tindex, Putint, Getint);
   
begin
   null;
end Cliente;

           
      
      
         
         
      
      
