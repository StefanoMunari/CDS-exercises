with System;
with Ada.Text_IO;

package body Buffer is

   use Ada.Text_IO;

   protected body Buffer_I is

      entry Put when Number_Of_Items < Buffer_Size is
      begin
         --  the number of items increases without the possibility to exceed
         --  buffer size, since this entry is available only when the buffer is
         --  not full
         Number_Of_Items := Number_Of_Items + 1;
         Put_Line("Put an object => current buffer status: "
                  & Positive'Image(Number_Of_Items));
      end Put;

      entry Take when Number_Of_Items > 0 is
      begin
         --  the number of items decreases without the possibility to raise an
         --  exception, since this entry is available only when the buffer is
         --  not empty
         Number_Of_Items := Number_Of_Items - 1;
         Put_Line("Take an object =>  current buffer status: "
                  & Positive'Image(Number_Of_Items));
      end Take;

   end Buffer_I;

end Buffer;
