with Ada.Text_IO;
with Table;

package body Smoker is

   task body Smoker_T is

      use Ada.Text_IO,
          Table;

      Smoking_Time : constant Duration := 10.0;

   begin
      -- prints the Smoker's Id and the resource that he holds
      Put_Line ("Smoker " & Natural'Image(My_Id) &
                  " created. He holds " & Resource.Resource_T'Image(My_Resource)
               );
      loop -- infinite loop
         -- the Smoker tries to gain the resources
         Table.Table_I.Try(My_Resource);
         -- the Smoker has gained the resources and now can smoke the cigarette
         Put_Line ("~~~ Smoker " & Natural'Image(My_Id)
                   & " smoked a cigarette ~~~");
         --  delay some time to smoke cigarette
        delay Smoking_Time;
      end loop;
   end Smoker_T;

end Smoker;
