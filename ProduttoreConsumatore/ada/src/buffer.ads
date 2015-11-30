package Buffer is
 
   Buffer_Size : constant Natural := 4;
   subtype Max_In_Buffer is Natural range 0 .. Buffer_Size;

   protected Buffer_I is
      entry Put;
      entry Take;
   private
      Number_Of_Items : Max_In_Buffer := 0;
   end Buffer_I;

end Buffer;
