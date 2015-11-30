package Producer is
 
   task type Producer_T (Id : integer) is
   end Producer_T;
   type Producer_Ref is access Producer_T;

end Producer;
