package Table is
      --  TODO: Set proper priority to Table

   -- place where smokers receive goods from pushers
   protected Status is
      --  calling this entry, smokers tells what they have and Table have to
      --+ provide them what they need
      entry Get(Owned_Res : Integer);
      --  calling this entry, pushers tells what they *don't* put on the table
      entry Put(Missing_Res : Integer);
   end Status;

   procedure Get(Owned_S : Integer) renames Status.Get;
   procedure Put(Missing_Res : Integer) renames Status.Put;

end Table;
