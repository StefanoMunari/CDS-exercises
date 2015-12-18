-- @module Amounts
-- @description protected resource : reactive entity that store a state
--                corresponding to the number of each kind of resource on the
--                table.
-- @version 0.1
-- @author Sebastiano Valle <valle.sebastiano93@gmail.com>
-- ==================HISTORY==================
-- 0.1 : implementation : Sebastiano Valle
with Resource;
with Ada.Containers.Hashed_Maps;

package Amounts is

   use Ada.Containers,
       Resource;

   type ResourcesAmounts is array (Resource.First .. Resource.Last) of Natural;

   protected Amounts_I is

      function  Look  ( A_Resource : Resource.Resource_T ) return Boolean;
      procedure Fetch ( A_Resource : Resource.Resource_T );
      procedure Add   ( A_Resource : Resource.Resource_T );

   private
      Resources : ResourcesAmounts := (others => 0);
      Amt : Integer;

   end Amounts_I;
end Amounts;
