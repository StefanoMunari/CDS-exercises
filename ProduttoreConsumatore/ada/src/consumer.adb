with Ada.Text_IO;
with Buffer;
with Random;

package body Consumer is

   task body Consumer_T is

      use Ada.Text_IO,
          Buffer,
          Random;

   begin
      loop
         Buffer_I.Take;
         Put_Line("working Consumer : " & Integer'Image(Id) );
         delay Duration(generateRandom);
      end loop;
   end Consumer_T;

end Consumer;
