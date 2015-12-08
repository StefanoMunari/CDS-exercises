package Table is

   -- place where smokers receive goods from pushers
   protected Status is
      entry Get;
      entry Put;
   end Status;

   procedure Get renames Status.Get;
   procedure Put renames Status.Put;

end Table;
