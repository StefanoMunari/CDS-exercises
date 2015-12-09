-- @module Table
-- @description protected resource : handles the logic of the program.
--              Put => for each call the server puts two different resources on
--                     the Table
--              Wait => after each call the server task is requeued
--                      on this private entry, waiting to be notified as a
--                      consequence of a client action
--              Try => client task try to gain the resources
--                     if them match with his needs he consumed them,
--                     otherwise the Table requeues him on the private Get entry
--              Get => the queued tasks on this entry have higher priority
--                     than the tasks queued on the Try entry. On each Put
--                     of the server a client (queued in this entry) tries
--                     to gain the resources if them match with his needs.
--                     Otherwise the client is requeued on this entry.
-- @version 0.1
-- @author Stefano Munari <stefanomunari.sm@gmail.com>
-- ==================HISTORY==================
-- 0.1 : implementation : Stefano Munari
with Resource;

package Table is

   use Resource;

   protected Table_I is

      entry Try ( A_Resource :  Resource.Resource_T );
      entry Put ( Resource_A, Resource_B : Resource.Resource_T );

   private

      Queued_Tasks : Natural := 0;
      Consumed : Boolean := False;
      ResourceA : Resource.Resource_T := Empty;
      ResourceB : Resource.Resource_T := Empty;

      entry Take ( A_Resource :  Resource.Resource_T );
      entry Wait;

   end Table_I;
end Table;
