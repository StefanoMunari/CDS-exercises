with Table;

with Ada.Text_IO;

package body Smoker is

   task body Smoker_T is

      use Ada.Text_IO;

   begin
      Put_Line ("Smoker created");
   end Smoker_T;

end Smoker;
