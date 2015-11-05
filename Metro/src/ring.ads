package Ring is
--  Station
   Capacity : constant Positive := 10;
   type Station_Address is range 1 .. 10;
   type Passengers is range 0 .. 30;

   protected type Station is
      entry Arrive (Destination : Station_Address);
      entry Alight (Destination : Station_Address);
      procedure Stopping (P : Passengers);
      procedure Boarding;
      procedure CloseDoors (P : out Passengers);
   private
      On_Train : Passengers;
      Trainboarding : Boolean := False;
      Trainstopped : Boolean := False;
   end Station;

   Stations : array (Station_Address) of Station;

--  Clients
   task type Clients;
   Travellers : array (Passengers) of Clients;

--  Train
   task Train;

end Ring;
