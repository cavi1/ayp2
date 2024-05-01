with Ada.Unchecked_Deallocation;

package body Arbol is
   
procedure Free is new
   Ada.Unchecked_Deallocation(Tiponodo, Tipoarbol);
   
function Vacio (Raiz: TipoArbol) return Boolean is
begin
return Raiz = null;
end Vacio;

procedure Limpiar (Ptr: in out TipoArbol) is--recursivo, va avanzando por las ramas del arbol hasta que llega a un nodo hoja y lo libera
begin
   if not Vacio (Ptr) then
      
      Limpiar (Ptr.Izq);
      
      Limpiar (Ptr.Der);
      
      Free (Ptr);
      
   end if;
   
end Limpiar;

procedure Insertar (Raiz: in out Tipoarbol; Elemento: in Tipoelem) is
   
   Nuevonodo: Tipoarbol:= new Tiponodo'(Elemento, null, null);--crea un nodo raíz sin hijos
   
   Ptr: Tipoarbol:= Raiz;--ptr apunta a la raíz de parámetro, si es el primer elemento, ptr va a ser null
   
   Anterior: Tipoarbol:= null;
   
begin
   
   -- el nodo creado contiene el elemento y se inserta en el lugar Apropiado Del Abb
      
   while Ptr /= null loop -- busca hasta que ptr caiga del árbol
      
      Anterior:= Ptr;
      
      if Ptr.Info > Elemento then Ptr:= Ptr.Izq;--si el elemento insertado es menor se va para la izquierda
      
      else Ptr:= Ptr.Der;--si es mayor se va para la derecha
      
      end if;
      
   end loop;
   
   -- se encontró lugar de inserción. Conectar punteros para enlazar Nuevonodo Al Árbol
      
   if Anterior = null then Raiz:= Nuevonodo;--si anterior queda en null es porque no hay nodos en el arbol
   
   else if Anterior.Info > Elemento
      
            then Anterior.Izq:= Nuevonodo;
            
      else Anterior.Der:= Nuevonodo ;
      
      end if;
      
   end if;
   
end Insertar;




procedure Insertarrec (Raiz: in out Tipoarbol; Elemento: in Tipoelem) is
   
begin
   
   if Raiz = null then Raiz:= new Tiponodo'(Elemento,null, null);--cuando raiz es null se realiza la insercion 
   
   elsif Elemento < Raiz.Info then Insertar (Raiz.Izq,Elemento);--busca por el derecho
   
   else Insertar (Raiz.Der, Elemento);--busca por el izquierdo
   
   end if;
   
end Insertarrec;


procedure Buscarmax (Arbol: in out Tipoarbol; Maxptr: out Tipoarbol)
   
      is ---procedimiento recursivo
         
begin
   
   if Arbol.Der = null then Maxptr:= Arbol;
   
      Arbol:= Arbol.Izq;
      
   else Buscarmax (Arbol.Der, Maxptr);
   
   end if;
   
end Buscarmax;



procedure Suprimirnodo (Arbol : in out Tipoarbol) is
   
   Temp: Tipoarbol;
   
   Suc: Tipoarbol;
   
begin
   
   if Arbol.Izq = null and Arbol.Der = null then Free(Arbol); --es hoja
      
   elsif Arbol.Izq = null then Temp:= Arbol; --tiene un hijo derecho
      
      Arbol:= Arbol.Der;--conecto el nodo raíz con el hijo derecho
      
      Free (Temp);--borro el que esta entre medio
      
   elsif Arbol.Der = null then Temp := Arbol; --tiene un hijo izquierdo
      
      Arbol:= Arbol.Izq;--conecto el nodo raíz con el hijo izquierdo
      
      Free (Temp);--borro al que está en el medio
      
   else Buscarmax (Arbol.Izq,Suc); --tiene dos hijos, debo buscar el sucesor
      
      Arbol.Info := Suc.Info;
      
      Free (Suc);
      
   end if;
   
end Suprimirnodo;


procedure Suprimir (Arbol: in out Tipoarbol; Valsup: in Tipoelem) is
   
begin --recursivo invoca a suprimirnodo
   
   if Arbol = null then raise Arbolvacio;
   
   elsif Valsup = Arbol.Info then Suprimirnodo(Arbol); --libera el nodo
      
   elsif Valsup < Arbol.Info then Suprimir(Arbol.Izq, Valsup);
   
   else Suprimir(Arbol.Der, Valsup);
   
   end if;
   
end Suprimir;


   function Esta (Raiz: in Tipoarbol; Buscado: in Tipoelem) Return boolean is --versión NO recursiva
      
      Ptr: Tipoarbol:= Raiz;
      
      Valorenarbol: Boolean:= False;
      
   begin
      
      while Ptr /= null and not Valorenarbol loop
         
         if Ptr.Info = Buscado then Valorenarbol:= True;
         
         else if Ptr.Info > Buscado then Ptr:= Ptr.Izq;
         
            else Ptr:= Ptr.Der;
            end if;
            
         end if;
         
      end loop;
      
      return Valorenarbol;
      
   end Esta;
      
function Estarec (Raiz: in TipoArbol; Buscado: in TipoElem) return Boolean is --versión recursiva
begin
   
   if Vacio(Raiz) then return False;
   
   else if Raiz.Info = Buscado then return True;
   
      else if Raiz.Info > Buscado then return Esta(Raiz.Izq, Buscado);
      
         else return Esta(Raiz.Der, Buscado);
         
         end if;
         
      end if;
      
   end if;
   
end Estarec;

function Izq (Ptr: Tipoarbol) return Tipoarbol is
   
begin
   
   if Vacio(Ptr) then raise Arbolvacio;
   
   else return Ptr.Izq;
   
   end if;
   
end Izq;

function Der (Ptr: Tipoarbol) return Tipoarbol is
   
begin
   
   if Vacio(Ptr) then raise Arbolvacio;
   
   else return Ptr.Der;
   
   end if;
   
end Der;

function Info (Ptr: Tipoarbol) return Tipoelem is
   
   begin
      
      if Vacio(Ptr) then raise Arbolvacio;
      
      else return Ptr.Info;
      
      end if;
      
   end Info;
   

end Arbol;

   

