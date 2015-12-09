package Pusher is

   task type Pusher_T is
   end Pusher_T;

   type Pusher_Ref is access Pusher_T;

   private
      Name : String := "Joe";

end Pusher;
