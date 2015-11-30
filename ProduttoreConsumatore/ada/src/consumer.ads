package Consumer is

   task type Consumer_T (Id : integer) is
   end Consumer_T;
   type Consumer_Ref is access Consumer_T;

end Consumer;

