
with Ada.Unchecked_Deallocation; -- procedimiento genérico para liberar memoria
   

package body Listaord is -- implementación del paquete Lista
   
   
procedure Free is new Ada.Unchecked_Deallocation(Tiponodo,Tipolista);

   
procedure Limpiar (Lista: in out Tipolista) is
            
Temp: Tipolista:= Lista;
         
begin
           
   while Lista /= null loop
                       
   Temp:= Lista;        
         
   Lista:= Lista.Sig;        
         
   Free (Temp);        
      
   end loop;
      
end Limpiar;
   
   
function Vacia (Lista: in Tipolista) return Boolean is
      
begin --la lista está vacía si el puntero externo es nulo
      
   return Lista = null;
      
end Vacia;
   
   
function Info (Lista: in Tipolista) return Tipoelem is 
      
begin
         
   if Lista /= null then return Lista.Info;
         
   else raise Listavacia;
         
   end if;
         
end Info;

      
function Esta (Lista: Tipolista; Elem: Tipoelem) return Boolean is
         
Ptr: Tipolista:= Lista;
              
begin -- Iterativo
         
   if Vacia (Lista) then return False;
         
   else while Ptr /= null loop
            
           if Ptr.Info = Elem then return True;
               
           end if;
               
           Ptr:= Ptr.Sig;
               
           end loop;
            
   end if;
         
   return False;
         
end Esta;
    


function Estarec (Lista: Tipolista; Elem: Tipoelem) return Boolean is
      
Ptr: Tipolista:= Lista;-- es necesario?
      
begin -- recursivo
      
   if Vacia(Lista) then return False;--caso base 1
      
   else if Ptr /= null and then Ptr.Info = Elem then return True;--caso base 2 
  
        else return Esta (Lista.Sig, Elem);--caso recursivo llama a esta del siguiente elemento
         
        end if;
         
   end if;
      
end Estarec;


function Sig (Lista: in Tipolista) return Tipolista is
      
begin
      
   if Vacia(Lista) then raise Listavacia;
      
   else return Lista.Sig;
      
   end if;
      
end Sig;


procedure Insertar (Lista: in out Tipolista; Elemento: in Tipoelem) is
   
   Nuevonodo: Tipolista:=new Tiponodo'(Elemento, null);
   
   Ptr, Ant: Tipolista;
   
   Lugarencontrado: Boolean;
   
begin
   
   if Vacia(Lista) then Lista:= Nuevonodo;
   
   else -- inserta en una lista con valores y busca en que lugar se inserta para enlazar los nodos
      
      if Elemento < Lista.Info then Nuevonodo.Sig:= Lista;--si es el menor lo inserta en el comienzo 
      
         Lista:= Nuevonodo; -- hago apuntar lista al nuevo primer elemento
            
      else Ptr:= Lista;--sino es el menor voy a empezar a buscar
         
         Lugarencontrado:= False;
         
         while not Lugarencontrado and Ptr /=null loop
            
            if Elemento > Ptr.Info then--si el elemento es mayor sigo avanzando 
               
               Ant:= Ptr;
               
               Ptr:= Ptr.Sig;
               
            else Lugarencontrado:= True; -- se inserta a continuación (antes que el nodo actual)
               
            end if;
            
         end loop;
         
         Nuevonodo.Sig:= Ptr;--en este punto ptr tiene un elemento mas grande que nodo, por lo tanto ese debo viuncular el siguiente de ese nodo con ptr
         
         If ant=null then Lista:=NuevoNodo;--esto es para admitir un caso en el que se ingresa un elemento repretido y coincide con el primero
         
         else ant.sig:=NuevoNodo;--acá vinculo el anterior a ptr con el nuevonodo para que se conecte de los dos lados
         
         end if;
         
      end if;
      
   end if;
   
   end Insertar;
   

   procedure Suprimir (Lista: in out Tipolista; Elemento: in Tipoelem) is
      
      Actual: Tipolista:= Lista;
      
      Ant: Tipolista:= null;
      
   begin -- la lista no está vacia, elemento existe y es unico
      
      while Actual /=null and then Actual.Info < Elemento loop
         
         Ant:= Actual;
         
         Actual:= Actual.Sig;
         
      end loop;
      
      if Ant= null then Lista:= Lista.Sig; -- se elimina el primer elemento
         
      else Ant.Sig:= Actual.Sig; -- desengancho el anterior de actual y lo engancho con el siguiente de actual
         
      end if;
      
         Free (Actual);--libero actual2
         
   end Suprimir;
   

procedure Crear (Lista: out Tipolista) is
begin
   Lista:=null;
end Crear;




   
end listaord;
      


   
