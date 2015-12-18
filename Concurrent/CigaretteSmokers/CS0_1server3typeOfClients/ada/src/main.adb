-- @module Main
-- @description entry point of the program: creates a server task and an
--              infinite number of client tasks
-- @version 0.3
-- @author Stefano Munari <stefanomunari.sm@gmail.com>
-- ==================HISTORY==================
-- 0.3 : add comments : Stefano Munari
-- 0.2 : add amounts module : Sebastiano Valle
-- 0.1 : implementation : Stefano Munari

with Ada.Text_IO;

with Amounts;
with Pusher;
with Smoker;
with Resource;
with Random;

procedure Main is
   use Ada.Text_IO,
       Pusher,
       Smoker,
       Resource,
       Random;

   Id : Natural := 0; -- the Id that will be assigned to each one of the Smokers
   Delay_Time : Positive;
   A_Smoker : Smoker_Ref;

begin
   Put_Line ("*****************************************");
   Put_Line ("***** THE CIGARETTE SMOKERS PROBLEM *****");
   Put_Line ("*****************************************");

   --  every iteration of the following loop creates n Smokers, each one with a
   -- different resource I
   loop
      for I in Integer range Resource.First .. Resource.Last loop
         A_Smoker := new Smoker.Smoker_T( Id, Resource.Resource_T
                                          (Resource.Resource_T'Val(I))
                                         );
         Id := Id + 1;
      end loop;
      generateRandom(2, 8, Delay_Time);
      delay Duration(Delay_Time);
   end loop;
end Main;
