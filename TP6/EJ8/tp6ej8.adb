--Dada una pila de colas de listas de enteros, escribir el programa que permita imprimir la lista
--que está en el frente de la cola del tope de la pila. 
 

with Listanoord, Piladin, Coladin, Ada.Integer_Text_Io, Ada.Text_IO;
use Ada.Integer_Text_IO, ada.Text_IO;

procedure Tp6ej8 is
     
   package listaint is new Listanoord(Integer);
   use Listaint;
   
   package Colalistint is new Coladin(Tipolista);
   use Colalistint;
   
   package Pilacolalistint is new Piladin(Tcola);
   use Pilacolalistint;
   

   procedure Llenaestruc(Pila: in out Tpila) is
      Lista1,lista2,lista3,lista4:Tipolista;
      cola1,cola2:tcola;
   begin
      insertar(lista1,1);
      Insertar(Lista1,2);
      Insertar(Cola1,Lista1);
      insertar(lista2,3);
      Insertar(Lista2,4);
      Insertar(Cola1,Lista2);
      meter(pila,cola1);--1 cola con 2 listas de dos elementos se inserta en la pila  
   
      Insertar(Lista3,5);
      Insertar(Lista3,6);
      Insertar(Cola2,Lista3);
      Insertar(Lista4,7);
      Insertar(Lista4,8);
      Insertar(Cola2,Lista4);
      meter(pila,cola2);--otra cola con otras 2 listas de 2 elementos se insrta en la pila, y queda en la cabeza


      --la lista que está en el tope de la cola del frente de la pila es la que contiene al 5-6 para este caso             
   end Llenaestruc;
         



   procedure Impresion(Pila:in out Tpila) is
      Colaux:Tcola;
      ptr,listaux:tipolista;
   begin
      Sacar(Pila, Colaux);--saco la cola de la cabeza de la pila
      Suprimir(Colaux, listaux);--saco la lista del frente de la cola
      ptr:=listaux;--copio para no modificar el puntero original
      while not Vacia(Ptr)loop
         Put(Info(Ptr));
         
         Ptr:=Sig(Ptr);
         
      end loop;
      
      Insertar(Colaux, Listaux);--va a cambiar la estructura ya que lo que era frente ahora es final 
      Suprimir(Colaux, Listaux);
      insertar(colaux,listaux);--con estas dos lineas acomodé la estructura como estaba originalmente  
      meter(Pila,Colaux);
   end Impresion;
   

pilaa:tpila;
         
                        

begin
   
   Llenaestruc(pilaa);
   Impresion(Pilaa);
   --impresion(pilaa);   end Tp6ej8;
   

