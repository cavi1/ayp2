generic
type TipoElem is private;
with function "<" (X, Y: TipoElem) return Boolean;
with function ">" (X, Y: TipoElem) return Boolean;
with procedure Put (X: in TipoElem);
package Arbol is
type TipoArbol is private;
-- procedure Crear (Raiz: out TipoArbol); -- no es necesario
function Vacio (Raiz: TipoArbol) return Boolean;
procedure Insertar (Raiz: in out Tipoarbol; Elemento: in Tipoelem);
procedure Insertarrec (Raiz: in out Tipoarbol; Elemento: in Tipoelem);
procedure Suprimir (Arbol: in out Tipoarbol; Valsup: in Tipoelem);
function Esta(Raiz:in Tipoarbol;Buscado:in Tipoelem)return Boolean;
function Estarec (Raiz: in TipoArbol; Buscado: in TipoElem) return Boolean;
procedure Limpiar (Ptr: in out TipoArbol);
function Izq (Ptr: TipoArbol) return TipoArbol;
function Der (Ptr: TipoArbol) return TipoArbol;
function Info (Ptr: TipoArbol) return TipoElem;
ArbolVacio: exception;
private --No Visible Al Usuario
type TipoNodo;
type TipoArbol is access TipoNodo;
type TipoNodo is
record
Info: TipoElem;
Izq, Der: TipoArbol;
end record;
end arbol;
