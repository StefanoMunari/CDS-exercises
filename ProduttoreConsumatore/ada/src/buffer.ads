package Buffer is

   --  size of the buffer, i.e. the number of items it can store
   Buffer_Size : constant Natural := 4;
   --  define a type to be sure that items number does not exceed buffer size
   subtype Max_In_Buffer is Natural range 0 .. Buffer_Size;

   --  the buffer is an anonymous protected resource, since this version of the
   --  program does not take in account the possibility to have a distributed
   --  system of several buffers
   protected Buffer_I is
      --  buffer provides an entry to allow producers to put an item in
      entry Put;
      --  buffer provides an entry to allow consumers to take an item from
      entry Take;
   private
      Number_Of_Items : Max_In_Buffer := 0;
   end Buffer_I;

end Buffer;
