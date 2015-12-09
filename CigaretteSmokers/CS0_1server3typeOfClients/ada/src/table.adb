with Ada.Text_IO;

package body Table is
   use Ada.Text_IO;

   protected body Table_I is

      entry Try (A_Resource : Resource.Resource_T ) when
        Queued_Tasks = 0
        and ResourceA /= Empty -- the first task must check this conditions
        and ResourceB /= Empty
      is
      begin
         if A_Resource /= ResourceA and A_Resource /= ResourceB then
            Put_Line (" TRY => Gained resources :");
            Put_Line ("  " & Resource_T'Image(ResourceA) );
            Put_Line ("  " & Resource_T'Image(ResourceB) );
            ResourceA := Empty;
            ResourceB := Empty;
            Consumed := True;
        else
           requeue Take;
        end if;
      end Try;

      entry Put ( Resource_A, Resource_B : Resource.Resource_T ) when True is
      begin
         -- update the Table state:
           -- 1) update Resources
           -- 2) update Queued_Tasks
         ResourceA := Resource_A;
         ResourceB := Resource_B;
         Queued_Tasks := Take'Count;
         Put_Line ("== PUSHER PUTS RESOURCES ==");
         Put_Line ("..." & Resource_T'Image(ResourceA) & "...");
         Put_Line ("..." & Resource_T'Image(ResourceB) & "...");
         -- Pusher moved to waiting queue
         requeue Wait;
      end Put;

      -- PRIVATE
      entry Wait when Consumed is
      begin
         Consumed := False;
      end Wait;

      entry Take ( A_Resource : Resource.Resource_T ) when
        -- this condition guarantees to not re-check for tasks that have already
        --check the guard
        Queued_Tasks > 0
      -- ResourceA and ResourceB WON'T be empty because of Table::Put
      -- that updates Resources status before than Queued_Tasks status
      -- (the blocking condition on the guard of this entry)
      is
      begin
         if A_Resource /= ResourceA
           and A_Resource /= ResourceB
         then
            -- The Smoker task:
            -- 1) gain Resources;
            -- 2) update Consume;
            -- 3) update Resources;
            Put_Line (" GET => Gained resources :");
            Put_Line ("  " & Resource_T'Image(ResourceA) );
            Put_Line ("  " & Resource_T'Image(ResourceB) );
            ResourceA := Empty;
            ResourceB := Empty;
         -- Queued_Tasks set to 0 because it is related to the
         -- queued tasks counted ONLY WHEN THE RESOURCES ARE AVAIABLE.
         -- If we don't update to 0 another Queued Task may enter
         -- into the Get entry and consume empty resources
         -- before than Pusher Put 2 new resources on the Table!
            Queued_Tasks := 0;
            Consumed := True;
         else
            -- only in this case is necessary to decrement
            -- the queued tasks count
            Queued_Tasks := Queued_Tasks-1;
            requeue Take;
         end if;
      end Take;


   end Table_I;
end Table;
