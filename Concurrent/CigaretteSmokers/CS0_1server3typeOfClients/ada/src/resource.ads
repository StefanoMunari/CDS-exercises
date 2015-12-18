-- @module Resource
-- @description enumeration type
--              This package includes all the types of resources that are needed
--              to make and consume a cigarette.
-- @version 0.2
-- @author Stefano Munari <stefanomunari.sm@gmail.com>
-- ==================HISTORY==================
-- 0.2 : create First and Last constants : Sebastiano Valle
-- 0.1 : implementation : Stefano Munari

package Resource is
   -- 0 => Empty
   -- 1 => Matches
   -- 2 => Cigarette_Paper
   -- 3 => Tobacco
   type Resource_T is ( Empty, Matches, Cigarette_Paper, Tobacco );
   for Resource_T use
     (Empty => 0, Matches => 1, Cigarette_Paper => 2, Tobacco => 3);

   --  TODO: Unbound hardcoded enum names from First and Last declaration
   --  ^Possible solution: create an array cycling over all the enum values
   --+ and assign:
   --+ * to First the value 1 (ensuring that "Empty" is always bound to '0'
   --+   value)
   --+ * to Last the value (a.size - 1)
   First : constant Integer := Resource_T'Pos (Matches);
   Last  : constant Integer := Resource_T'Pos (Tobacco);
end Resource;
