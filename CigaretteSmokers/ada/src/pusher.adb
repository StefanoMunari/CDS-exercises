with Table;

with Ada.Text_IO;

package body Pusher is

   task body Pusher_T is

      use Ada.Text_IO;

   begin
      --  TODO: Add random generator of resources
      --  TODO: Loop resource provision without delay
      Table.Put(0);
      Put_Line ("Pusher created");
   end Pusher_T;

end Pusher;
