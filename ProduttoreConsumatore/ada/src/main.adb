-- v0.1 : implementazione : Sebastiano Valle
-- v0.2 : correzione importazione packages : Stefano Munari
-- v0.3 : modificati nomi Buffer : Stefano Munari
-- v0.4 : inserito generatore Random : Stefano Munari
-- v0.5 : refactoring Main, producer consumer con Random e Id : Stefano Munari
-- v0.6 : generalizzata Random : Stefano Munari
-- v0.7 : aggiunta documentazione : Sebastiano Valle
with Ada.Text_IO;
with Producer;
with Consumer;
with Random;

procedure Main is
   use Producer, Consumer, Random, Ada.Text_IO;

   A_Producer : Producer_Ref;
   A_Consumer : Consumer_Ref;
   Limit : Positive := generateRandom (2 , 20); -- default value is >=2
   Index : Integer := 0;
   Id : Integer := 0;
   Interval : constant Duration := 3.5; -- 3.5s interval

begin
   Put_Line ("*****************************");
   Put_Line ("**** PRODUCER & CONSUMER ****");
   Put_Line ("*****************************");

   while Index < Limit loop
     A_Producer := new Producer.Producer_T(Id);
      delay Interval;
      Id := Id +1;
     A_Consumer := new Consumer.Consumer_T(Id);
      delay Interval;
      Id := Id +1;
     Index := Index+1;
   end loop;
end Main;
