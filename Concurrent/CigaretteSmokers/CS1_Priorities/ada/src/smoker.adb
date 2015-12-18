with Table;

with Ada.Text_IO;

package body Smoker is

   Smoking_Time : constant Duration := 1.0;

   task body Smoker_T is

      use Ada.Text_IO;

   begin
      Put_Line ("Smoker " & Integer'Image(Resource) & " created");
      loop
         Table.Get(Resource);
         delay Smoking_Time;
         Put_Line ("Smoker " & Integer'Image(Resource) & " smoked");
      end loop;
   end Smoker_T;

end Smoker;
