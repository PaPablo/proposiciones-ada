with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is

   -- QH: determina si un número es par o no
   -- PRE: numero = N
   -- POS: esPar = True y numero es par, False si no.
   -- Excepciones: -
   function esPar(numero: in Integer) return Boolean is
   begin
      return numero mod 2  = 0;
   end esPar;


   -- Declaración de tipos
   type tipoNodo;
   type tipoPuntero is access tipoNodo;
   type tipoNodo is record
      info: Integer;
      siguiente: tipoPuntero;
   end record;
   --
   -- |1| -> |2|
   --

   nodo_1, nodo_2, actual: tipoPuntero;
begin

   nodo_1 := new tipoNodo;
   nodo_2 := new tipoNodo;

   actual:= nodo_2;

   nodo_1.info := 1;
   nodo_1.siguiente := nodo_2;

   nodo_2.info := 2;

   -- N1     N2
   --  |      |
   --  v      v
   -- |1| -> |2| -> null
   --         ^
   --         |
   --      Actual

   -- Si hay siguiente
   -- y la info del siguiente es par
   -- imprimir "Mi siguiente es par :)"
   if actual.siguiente /= null and then esPar(actual.siguiente.info) then
      Put_Line("Mi siguiente es par :)");
   end if;

   -- Si no hay siguiente
   -- o la info es impar
   -- imprimir "Estoy al final, o mi siguiente es impar :("
   if actual.siguiente = null or else not(esPar(actual.siguiente.info)) then
      Put_Line("Estoy al final, o mi siguiente es impar :(");
   end if;

end Main;
