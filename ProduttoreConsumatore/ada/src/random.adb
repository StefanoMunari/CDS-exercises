with Ada.Numerics.discrete_Random;

package body Random is

   function generateRandom return Positive is

      type Rand_Range is range 2..20;
      package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
      seed : Rand_Int.Generator;
      Num : Rand_Range;

      begin
         Rand_Int.Reset(seed);
         Num := Rand_Int.Random(seed);
         return Positive'Value(Rand_Range'Image(Num));
   end generateRandom;

end Random;
