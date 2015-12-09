with Ada.Text_IO;
with Table;

package body Smoker is

   task body Smoker_T is

      use Ada.Text_IO,
          Table;


   begin
      Put_Line ("Smoker " & Integer'Image(My_Id) & " created . He holds " & Resource.Resource_T'Image(My_Resource));
      loop
         Table.Table_I.Try(My_Resource);
         Put_Line ("~~~ Smoker " & Integer'Image(My_Id) & " smoked a cigarette ~~~");
      end loop;
   end Smoker_T;

end Smoker;
