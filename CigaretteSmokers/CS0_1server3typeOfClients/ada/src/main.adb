-- @module Main
-- @description entry point of the program: creates a server task and infinite
--              number of client tasks
-- @version 0.1
-- @author Stefano Munari <stefanomunari.sm@gmail.com>
-- ==================HISTORY==================
-- 0.1 : implementation : Stefano Munari

with Ada.Text_IO;

with Pusher;
with Smoker;
with Resource;
with Random;

-- TODO :
-- Encapsulate Resources
-- into a data structure
-- so the Table logic
-- became more generic
-- and less related to
-- the resources instancies

procedure Main is
   use Ada.Text_IO,
       Pusher,
       Smoker,
       Resource,
       Random;

   Id : Integer := 0;
   Result : Positive;
   A_Pusher : Pusher_Ref;
   A_Smoker : Smoker_Ref;

begin
   Put_Line ("*****************************");
   Put_Line ("***** CIGARETTE SMOKERS *****");
   Put_Line ("*****************************");
   A_Pusher := new Pusher.Pusher_T;
   loop
      --  every loop creates 3 Smokers, each with a different resource I
      for I in Integer range 1..3 loop
         A_Smoker := new Smoker.Smoker_T( Id,
                                          Resource.Resource_T(
                                            Resource.Resource_T'Val (I)
                                           )
                                         );
         Id := Id + 1;
      end loop;
      generateRandom(3, 12, Result);
      delay Duration(Result);
   end loop;
end Main;
