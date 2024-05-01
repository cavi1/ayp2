--Supongamos que tenemos una lista combinada de alumnos de la Facultad ordenada
--alfabéticamente. Esta lista está compuesta de alumnos de Licenciatura y de Postgrado. Cada
--alumno lleva un dato adicional que indica si es alumno de Licenciatura o de Postgrado.
--Nuestra tarea es producir una lista impresa ordenada alfabéticamente de estudiantes de
--Licenciatura, seguida de otra similar de alumnos de Postgrado. 

--dada una lista desordenada de estudiantes de grado y posgrado traspasar a dos listas ordenadas que ordenen alfabéticamente a los de grado por un lado y a los de
--posgrado por otro
--en el ejercicio pedía que la lista original esté ordenada pero bueno, en todo caso llenaría una estructura de lista ordenada y descarto la estructura de lista no ordenada, el procedimiento para seleccionar sería el mismo
with Listaord, Listanoord, Ada.Integer_Text_Io, ada.Text_IO; 
use ada.Integer_Text_IO, ada.Text_IO;

procedure Tp6ej4 is

cantalumnos:natural:=5;

subtype long is natural range 1..10;

      type Tregi is record
         
         Nombre:String(Long);         
         Estadoacademico:Character;
         
      end record;
      
      function "<" (X,Y: Tregi) return boolean is
      begin
         return X.nombre<Y.nombre;
      end "<";
       
      function ">" (X,Y: Tregi) return boolean is
      begin
         return X.nombre>Y.nombre;
      end ">";

                     
      package listaorden is new listaord(tregi, "<", ">");
      use Listaorden;
      
      package Listacomun is new Listanoord(Tregi);
      use Listacomun;
      
      procedure Llenalistacomun(Lista:in out Listacomun.Tipolista) is
         Regi:Tregi;
         Datoincorrecto:exception;
         long:natural;
      begin
         for I in 1..Cantalumnos loop
                        Put_line("ingrese el nombre del alumno: ");--precondicion: el alumno no tiene un nro o caracter extraño de la tabla ascii como nombre
            Get_Line(Regi.Nombre,Long);Skip_Line;
            Put_Line("ingrese L si es de licenciatura o P si es de posgrado: ");
            Get(Regi.Estadoacademico);Skip_Line;
            if Regi.Estadoacademico /= 'P' AND Regi.Estadoacademico /= 'L' then raise Datoincorrecto;
            end if;
            Insertar(Lista,Regi);
            
         end loop;
         
         exception
            when Datoincorrecto=>begin
                  Put("debe ingresar L o P");
               end;            
            
      end Llenalistacomun;
      
      procedure Ordenolistas(lista0: in listacomun.tipolista; Lista1,Lista2: in out Listaorden.Tipolista) is
         Ptr:Listacomun.Tipolista:=Lista0;
         Regi:Tregi;
        
      begin
         
         for i in 1..Cantalumnos loop
            
            if Info(Ptr).Estadoacademico='P' then
               Regi.Nombre:=Info(Ptr).Nombre;
               Regi.Estadoacademico:=Info(Ptr).Estadoacademico;
               Insertar(Lista1,Regi);
            else
               Regi.Nombre:=Info(Ptr).Nombre;
               Regi.Estadoacademico:=Info(Ptr).Estadoacademico;
               Insertar(Lista2,Regi);
            end if;
            
            Ptr:=Sig(Ptr);
            
         end loop;
            
      end Ordenolistas;
      
      procedure Imprimolistas(Lista:in Listaorden.Tipolista) is
      ptr:Listaorden.Tipolista:=lista;
      begin
       
      while not vacia(ptr) loop
            Put_line(Info(Ptr).Nombre(1..4));
            ptr:=sig(ptr);
         end loop;
         
      end imprimolistas;
         
    
   listinicial:listacomun.tipolista;
   Listalicen:listaorden.tipolista;
   listapos:listaorden.tipolista;
        
   begin
      Llenalistacomun(Listinicial);
      Ordenolistas(Listinicial, Listapos, Listalicen);
      put_line("licenciatura: ");
      Imprimolistas(Listalicen);
      put_line("posgrado: ");
      Imprimolistas(Listapos);
          
   exception
      when Data_Error=>begin
            Put("error en el tipo de dato");         end;
         
   end Tp6ej4;
   
         
