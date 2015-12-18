-- @module Table
-- @description protected resource : handles the logic of the program.
--              Put => for each call the server puts the missing resource on
--                     the Table
--              Try => client task tries to gain the resources:
--                     if it match with his needs he consumed them,
--                     otherwise the Table requeues him on the private entry(Get)
--              Get => the queued tasks on this entry have higher priority
--                     than the tasks queued on the Try entry. On each Put
--                     of the server a client (queued in this entry) tries
--                     to gain the resources if it match with his needs.
--                     Otherwise the client is requeued on this entry.
-- @version 0.3
-- @author Stefano Munari <stefanomunari.sm@gmail.com>
-- ==================HISTORY==================
-- 0.3 : specification changes - Wait entry removed : Sebastiano Valle
-- 0.2 : comments : Stefano Munari
-- 0.1 : implementation : Stefano Munari
with Resource;

package Table is

   use Resource;

   protected Table_I is

      entry Try ( A_Resource : Resource.Resource_T );
      entry Put ( A_Resource : Resource.Resource_T );

   private

      Queued_Tasks : Natural := 0;
      Consumed : Boolean := True;
      Empty_Table : Boolean := True;
      Enough_Resources : Boolean := False;

      entry Take ( A_Resource :  Resource.Resource_T );

   end Table_I;
end Table;
