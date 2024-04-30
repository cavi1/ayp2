with Ada.Unchecked_Deallocation;

package body Piladin is
   
procedure Free is new Ada.Unchecked_Deallocation(Tiponodo, Tpila);
   
function Vacia (Pila: in Tpila) return Boolean is
   
   begin

      return Pila = null;
      
end Vacia;
   
procedure meter(Pila: in out Tpila; nuevoelem: in telemento) is
      
      Nuevonodo: Tpila:= new Tiponodo'(nuevoelem, Pila);--creo el nodo (ES UNA DIRECCI�N DE MEMORIA, ES UN PUNTERO), que es de tipopila y tiponodo
begin                                                          --y contiene en el campo .info al elemento  ingresado, y en el campo .sig 
                                                          --a la direcion de la cabeza de la pila ingresada
Pila:= Nuevonodo;--como nuevonodo es una direcci�n de memoria, se la asigno a pila, entonces la direcci�n que cree como nuevonodo se convierte
                  --en la direcci�n de la cabeza de la pila, si no hubiera asignado pila al tiponodo en la declaraci�n de variables
end meter;        --esta se hubiera sobreescrito
   
procedure Sacar (Pila:in out TPila; Elemsacado: out TElemento) is

   Temp: Tpila:= Pila;--crea otro apuntador a la direcci�n de memoria de la cabeza de la pila
   
begin
   
   if Vacia (Pila) then raise Pilavacia;
   
   else Elemsacado:= Pila.Info;
   
      Pila:= Pila.Sig;--como sig contiene el puntero con la direcci�n del siguiente elemento, se convierte en esa direccion
      
      Free (Temp);--ac� qued� el elemento que ya saqu�, lo optimo es liberarlo, por eso se hace el free
      
   end if;
   
end Sacar;

procedure Limpiar (Pila:in out Tpila) is
   
   Temp: Tpila:= Pila;
   
begin
   
   while not Vacia (Pila) loop
      
      Pila:= Pila.Sig;-- es como un sacar autom�tico, voy avanzando 
      
      Free (Temp);--y voy liberando
      
      Temp:= Pila;--en la �ltima iteraci�n va a quedar un temp pero no importa xq es local, desp se va a ir
      
   end loop;
   
end Limpiar;

end Piladin;


