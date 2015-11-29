with System;
with Ada.Text_IO;
with Random_Numbers;

package body Producer is

   task body Producer_T is

      use Ada.Text_IO,
          Buffers;

      P_Interval : constant Duration := 0.5;

   begin
      loop
         Buffer.Put;
         Put_Line("Put");
         delay P_Interval;
      end loop;
   end Producer_T;

end Producer;
