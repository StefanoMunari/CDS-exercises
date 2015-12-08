with Pusher;
with Smoker;

with Ada.Text_IO;

procedure Cigarette_Smokers is

   use Smoker,
       Pusher,
       Ada.Text_IO;

   A_Smoker : Smoker_Ref;
   A_Pusher : Pusher_Ref;

begin
   Put_Line ("*****************************");
   Put_Line ("***** CIGARETTE SMOKERS *****");
   Put_Line ("*****************************");
   A_Pusher := new Pusher.Pusher_T;
   A_Smoker := new Smoker.Smoker_T;
   A_Smoker := new Smoker.Smoker_T;
   A_Smoker := new Smoker.Smoker_T;
end Cigarette_Smokers;
