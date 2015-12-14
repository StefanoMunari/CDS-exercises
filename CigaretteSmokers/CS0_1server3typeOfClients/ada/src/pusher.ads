-- @module Pusher
-- @description anonymous task
--              generates the id of the only resource he DOES NOT put.
--              (the motivation is to pass only 1 parameter regardless of the
--              n parameters related to the number of resources, thus avoiding
--              the telescoping anti-pattern).
--              Puts the generated resource in the Table.Table_I.Put entry.
-- @version 0.3
-- @author Stefano Munari <stefanomunari.sm@gmail.com>
-- ==================HISTORY==================
-- 0.3 : comments       : Stefano Munari
-- 0.2 : pass only what it is not put as a parameter : Sebastiano Valle
-- 0.1 : implementation : Stefano Munari
package Pusher is

   task Pusher_T is
   end Pusher_T;

   private
      Name : constant String := "Joe";

end Pusher;
