with Ada.Text_IO;

package body Consumer is

   task body Consumer_T is

      use Ada.Text_IO,
          Buffers;

      C_Interval : constant Duration := 1.0;

   begin
      loop
         Buffer.Take;
         Put_Line("Take");
         delay C_Interval;
      end loop;
   end Consumer_T;

end Consumer;
