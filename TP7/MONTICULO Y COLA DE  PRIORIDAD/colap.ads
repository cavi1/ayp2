

generic
type TipoElemento is private;
with function ">" (Izq, Der: in TipoElemento) return Boolean;
package ColaP is
type TipoColaP (Max: Positive) is private;
OVERFLOW: exception;
UNDERFLOW: exception;
procedure Inicializar(CP: in out TipoColaP);
procedure Insertar(CP: in out TipoColaP; Elem: in TipoElemento);
procedure Suprimir(CP: in out TipoColaP; Elem: out TipoElemento);
function Llena(CP: in TipoColaP) return Boolean;
function Vacia(CP: in TipoColaP) return Boolean;
private
type VecCola is array (Positive range <>) of TipoElemento;
type TipoColaP (Max: Positive) is record
Final: Natural:= 0;
Elementos: VecCola (1..Max);
end record;
end ColaP;