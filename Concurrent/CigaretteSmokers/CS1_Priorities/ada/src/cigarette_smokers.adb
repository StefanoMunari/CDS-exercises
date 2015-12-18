with Pusher;
with Smoker;

with Ada.Text_IO;

procedure Cigarette_Smokers is

   use Smoker,
       Pusher,
       Ada.Text_IO;

   Num : Integer;
   Limit : Integer := 3;
   A_Smoker : Smoker_Ref;
   A_Pusher : Pusher_Ref;

begin
   Put_Line ("*****************************");
   Put_Line ("***** CIGARETTE SMOKERS *****");
   Put_Line ("*****************************");
   A_Pusher := new Pusher.Pusher_T;
   Num := 0;
   while Num < Limit loop
      A_Smoker := new Smoker.Smoker_T(Num);
      Num := Num + 1;
   end loop;
end Cigarette_Smokers;
