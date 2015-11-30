package Consumer is

   --  consumer is not an anonymous task: it can be instantiated more than once
   --  because the system allows the presence of multiple consumers that access
   --  the buffer concurrently
   task type Consumer_T (Id : integer) is
   end Consumer_T;
   type Consumer_Ref is access Consumer_T;

end Consumer;

