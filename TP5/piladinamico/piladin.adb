with Ada.Unchecked_Deallocation;

package body Piladin is
   
procedure Free is new Ada.Unchecked_Deallocation(Tiponodo, Tipopila);
   
function Vacia (Pila: in Tipopila) return Boolean is
   
   begin

      return Pila = null;
      
end Vacia;
   
procedure Meter (Pila: in out Tpila; Elemento: in telemento) is
      
      Nuevonodo: Tipopila:= new Tiponodo'(Elemento, Pila);--creo el nodo (ES UNA DIRECCI�N DE MEMORIA, ES UN PUNTERO), que es de tipopila y tiponodo
begin                                                          --y contiene en el campo .info al elemento  ingresado, y en el campo .sig 
                                                          --a la direcion de la cabeza de la pila ingresada
Pila:= Nuevonodo;--como nuevonodo es una direcci�n de memoria, se la asigno a pila, entonces la direcci�n que cree como nuevonodo se convierte
                  --en la direcci�n de la cabeza de la pila, si no hubiera asignado pila al tiponodo en la declaraci�n de variables
end Meter;        --esta se hubiera sobreescrito
   
procedure Sacar (Pila:in out TPila; Elemento: out TElemento) is

   Temp: Tpila:= Pila;--crea otro apuntador a la direcci�n de memoria de la cabeza de la pila
   
begin
   
   if Vacia (Pila) then raise Pilavacia;
   
   else Elemento:= Pila.Info;
   
      Pila:= Pila.Sig;--como sig contiene el puntero con la direcci�n del siguiente elemento, se convierte en esa direccion
      
      Free (Temp);--ac� qued� el elemento que ya saqu�, lo optimo es liberarlo, por eso se hace el free
      
   end if;
   
end Sacar;

procedure Limpiar (Pila:in out Tipopila) is
   
   Temp: Tipopila:= Pila;
   
begin
   
   while not Vacia (Pila) loop
      
      Pila:= Pila.Sig;-- es como un sacar autom�tico, voy avanzando 
      
      Free (Temp);--y voy liberando
      
      Temp:= Pila;--en la �ltima iteraci�n va a quedar un temp pero no importa xq es local, desp se va a ir
      
   end loop;
   
end Limpiar;

