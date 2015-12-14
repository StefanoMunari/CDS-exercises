with Resource;

with Ada.Text_IO;

package body Amounts is

   use Ada.Text_IO,
       Resource;

   protected body Amounts_I is

      --  returns True iff there is at least a unit of all the resources that
      --+ are different from A_Resource
      function Look  ( A_Resource : Resource.Resource_T ) return Boolean is
         ResIndex    : Integer;
         Available : Boolean := True;
      begin
         ResIndex := Resource_T'Pos (A_Resource);
         for I in Integer range Resource.First .. Resource.Last loop
            -- checks if all Resources which are different
            -- from A_Resource (passed as parameter)
            -- are available
            if I /= ResIndex and Resources(I) = 0 then
               Available := False;
            end if;
         end loop;
         return Available;
      end Look;

      --  a smoker that has A_Resource needs to take a unit of each other
      --+ type of resource from the table
      procedure Fetch ( A_Resource : Resource.Resource_T ) is
         ResIndex    : Integer;
      begin
         ResIndex := Resource_T'Pos (A_Resource);
         for I in Integer range Resource.First .. Resource.Last loop
            if I /= ResIndex then
               Resources(I) := Resources(I) - 1;
            end if;
         end loop;
      end Fetch;

      --  a pusher puts all the resources but A_Resource
      procedure Add ( A_Resource : Resource.Resource_T ) is
         ResIndex    : Integer;
      begin
         ResIndex := Resource_T'Pos (A_Resource);
         for I in Integer range Resource.First .. Resource.Last loop
            if I /= ResIndex then
               -- now the Ith kind of resource is available on the table
               Resources(I) := Resources(I) + 1;
            end if;
            -- print "Resource : Resource Occurrences"
            -- where Resource Occurrences are available to be consumed
            Put_Line(Resource_T'Image (Resource_T'Val (I)) & ": "&
                     Natural'Image (Resources (I)) );
         end loop;
      end Add;

   end Amounts_I;
end Amounts;
