with Ada.Text_IO;
with Resource;
with Table;
with Random;

package body Pusher is

   use Ada.Text_IO,
       Resource,
       Table,
       Random;

   Missing_Resource : Positive;-- can't be Empty

   task body Pusher_T is
   begin
      Put_Line ("Pusher " & Name & " has been created! ");
      loop
         -- generates a random integer number in range [1..3]
         generateRandom (1,3, Missing_Resource);

         Table.Table_I.Put(
                           Resource.Resource_T(
                             Resource.Resource_T'Val (Missing_Resource)
                            )
          );
         --  delay some time to prepare next resources to put on the table
         delay 0.5;
      end loop;
   end Pusher_T;
end Pusher;
