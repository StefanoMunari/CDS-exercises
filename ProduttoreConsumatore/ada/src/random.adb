with Ada.Numerics.discrete_Random;
with Ada.Text_IO;
 
package body Random is

   function generateRandom (LowerBound, UpperBound : in Positive) return Positive is

      use Ada.Text_IO;

      Bound_Error : exception;

      function validBounds (LowerBound, UpperBound : in Positive)
                             return Boolean is
      begin
         if (LowerBound <= UpperBound) then
            return True;
         else
            return False;
         end if;
      end validBounds;

      subtype Rand_Range is Positive range LowerBound..UpperBound;
      package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
      seed : Rand_Int.Generator;
      Num : Rand_Range;

   begin
      if validBounds(LowerBound,UpperBound) then
         Rand_Int.Reset(seed);
         Num := Rand_Int.Random(seed);
         return Positive'Value(Rand_Range'Image(Num));
      else
         raise Bound_Error;
      end if;
      exception
         when Bound_Error =>
             Put_Line(Standard_Error,"ERROR: range's limits are not valid!!!");
   end generateRandom;

end Random;
