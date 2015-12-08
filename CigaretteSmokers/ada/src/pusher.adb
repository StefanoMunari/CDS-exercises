with Table;

with Ada.Text_IO;

package body Pusher is

   task body Pusher_T is

      use Ada.Text_IO;

   begin
      Put_Line ("Pusher created");
   end Pusher_T;

end Pusher;
