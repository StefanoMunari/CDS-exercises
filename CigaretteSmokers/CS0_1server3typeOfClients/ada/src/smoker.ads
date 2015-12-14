-- @module Smoker
-- @description client task
--              Smoker_T => constructor;
--                       The Smoker tries
--                       to gain the resources that he needs
--                       to smoke a cigarette doing a
--                       request on Table.Table_I.Try entry
-- @see Table.ads
-- @version 0.2
-- @author Stefano Munari <stefanomunari.sm@gmail.com>
-- ==================HISTORY==================
-- 0.2 : comments       : Stefano Munari
-- 0.1 : implementation : Stefano Munari
with Resource;

package Smoker is

   use Resource;

   task type Smoker_T ( My_Id : Natural ; My_Resource : Resource.Resource_T )
   is
   end Smoker_T;

   type Smoker_Ref is access Smoker_T;

end Smoker;
