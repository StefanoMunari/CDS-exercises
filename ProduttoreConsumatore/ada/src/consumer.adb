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
         --  consumer takes (consumes) an item from the buffer
         Buffer_I.Take;
         Put_Line("working Consumer Id: " & Integer'Image(Id) );
         --  consumer waits for a random interval of time before consuming
         --  another item
         delay Duration(generateRandom(1,3));
      end loop;
   end Consumer_T;

end Consumer;
