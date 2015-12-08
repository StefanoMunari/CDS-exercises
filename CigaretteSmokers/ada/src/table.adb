package body Table is

   protected body Status is
      entry Get(Owned_Res : Integer) when True is
      begin
         --  TODO: Get algorithm to allow Smokers to make their cigarette only
         --+       if they can
         null;
      end Get;

      entry Put(Missing_Res : Integer) when True is
      begin
         --  TODO: Put algorithm that releases Pushers (so they can put other
         --+       resources on the table) only when a Smoker makes a cigarette
         null;
      end Put;
   end Status;

end Table;
