package Producer is

   --  producer is not an anonymous task but a task type: it can be instantiated
   --  more than once because the system allows the presence of multiple
   --  producers that generates items and put them concurrently in the buffer
   task type Producer_T (Id : integer) is
   end Producer_T;
   type Producer_Ref is access Producer_T;

end Producer;
