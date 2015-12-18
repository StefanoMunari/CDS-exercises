with Ada.Text_IO;
with Amounts;


package body Table is

   use Ada.Text_IO,
       Amounts;

   protected body Table_I is

      --  a smoker arrives to look which resources are on the table, taking
      --+ them iff he can smoke with them
      entry Try (A_Resource : Resource.Resource_T ) when
        --  wait for all queued smokers to check if they can smoke a cigarette
        Queued_Tasks = 0
      --  check only if there are at least n-1 types of resources on the
      --+ table, where n is the number of types of resources that a smoker needs
      --+ to consume a cigarette
        and not Empty_Table
      is
      begin
         --  check if there is at least one unit of the resources that the
         --+ smoker needs
         Enough_Resources := Amounts.Amounts_I.Look (A_Resource);
         if Enough_Resources then
            --  there are enough resources to smoke a cigarette, so take the
            --+ needed resources from the table
            Amounts.Amounts_I.Fetch (A_Resource);
            Put_Line (" TRY => Fetched having resource " &
                        Resource_T'Image(A_Resource) & "");
            Put_Line("");
            --  change the following assignments if system scales to multiple
            --+ pushers
            Empty_Table := True;
            Consumed := True;
         else
            --  wait in a higher priority queue for a pusher to put new
            --+ resources on the table
           requeue Take;
        end if;
      end Try;

      --  a pusher can put resources only when a cigarette is consumed
      entry Put ( A_Resource : Resource.Resource_T ) when Consumed is
      begin
         --  once the pusher can put again resources, he also has to wake up
         --+ any queued task
         Consumed := False;
         Put_Line ("PUSHER PUTS ALL BUT " & Resource_T'Image(A_Resource) );
         Amounts.Amounts_I.Add(A_Resource);
         Queued_Tasks := Take'Count;
         Empty_Table := False;
      end Put;

      --  high priority queue where tasks that already checked resources
      --+ availability stay
      entry Take ( A_Resource : Resource.Resource_T ) when
        -- Queued_Tasks guarantees to not re-check for tasks that have already
        -- checked the guard
        Queued_Tasks > 0
      is
      begin
         Enough_Resources := Amounts.Amounts_I.Look (A_Resource);
         if Enough_Resources then
            --  there are enough resources to smoke a cigarette, so take the
            --+ needed resources from the table. There is no need to reset
            --+ queued tasks count to keep fairness
            Amounts.Amounts_I.Fetch (A_Resource);
            Put_Line (" TAKE => Fetched having resource " &
                        Resource_T'Image(A_Resource) );
            Put_Line("");
            --  change the following assignments if system scales to multiple
            --+ pushers
            Empty_Table := True;
            Consumed := True;
         else
            --  decrement to be checked queued tasks count and requeue this
            --+ smoker
            Queued_Tasks := Queued_Tasks-1;
            requeue Take;
         end if;
      end Take;


   end Table_I;
end Table;
