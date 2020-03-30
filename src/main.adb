with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is

   function esPar(numero: in Integer) return Boolean is
   begin
      return numero mod 2  = 0;
   end esPar;

   -- Declaración de tipos
   type tipoRegistro;
   type tipoPunteroRegistro is access tipoRegistro;
   type tipoRegistro is record
      info: Integer;
      siguiente: tipoPunteroRegistro;
   end record;

   nodo_1, nodo_2, actual: tipoPunteroRegistro;
begin

   nodo_1 := new tipoRegistro;
   nodo_2 := new tipoRegistro;

   actual:= nodo_1;

   nodo_1.info := 1;
   nodo_1.siguiente := null;

   nodo_2.info := 3;

   actual := nodo_1;

   -- Si hay siguiente
   -- y la info del siguiente es par
   -- imprimir "Mi siguiente es par :)"
   if actual.siguiente /= null and esPar(actual.siguiente.info) then
      Put_Line("Mi siguiente es par :)");
   end if;

   -- Si no hay siguiente
   -- o la info es impar
   -- imprimir "Estoy al final, o mi siguiente es impar"
   if actual.siguiente = null or not(esPar(actual.siguiente.info)) then
      Put_Line("Estoy al final, o mi siguiente es impar");
   end if;

end Main;
