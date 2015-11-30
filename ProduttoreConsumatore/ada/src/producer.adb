with Ada.Text_IO;
with Buffer;
with Random;

package body Producer is

   task body Producer_T is

      use Ada.Text_IO,
          Buffer,
          Random;
   begin
      loop
         Buffer_I.Put;
         Put_Line("working Producer Id:" & Integer'Image(Id));
         delay Duration(generateRandom(1,4));
      end loop;
   end Producer_T;

end Producer;
