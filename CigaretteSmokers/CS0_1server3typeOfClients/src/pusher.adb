with Ada.Text_IO;
with Resource;
with Table;
with Random;

package body Pusher is

   use Ada.Text_IO,
       Resource,
       Table,
       Random;

   Nat_A : Natural;
   Nat_B : Natural;

   task body Pusher_T is
   begin
      loop
         generateRandom (1,3, Nat_A);
         loop
            generateRandom (1,3,Nat_B);
            exit when Nat_A /= Nat_B;
         end loop;

         Table.Table_I.Put(Resource.Resource_T( Resource.Resource_T'Val (Nat_A)),
                           Resource.Resource_T( Resource.Resource_T'Val (Nat_B))
                          );
         Put_Line ("Pusher " & Name & " woke up! ");
      end loop;
   end Pusher_T;
end Pusher;
