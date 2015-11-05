package body Ring is

   protected body Station is

   entry Alight (Destination : Station_Address)
     -- coda secondaria di fermata
        -- per i passeggeri che sono saliti ed hanno indicato un determinato
        -- indirizzo
     -- di arrivo
     when Trainstopped is
   begin
      On_Train := On_Train - 1; -- fa scendere un passeggero
   end Alight;

   entry Arrive (Destination : Station_Address)
   --  coda primaria di salita sul treno
     when TrainBoarding and then On_Train < Capacity is
      begin
	    On_Train := On_Train +1; --  aggiunge un passeggero
         requeue Station (Destination).Alight;
   end Arrive;

   procedure Stopping (P : Passengers) is
   begin
      On_Train := P;
      --  definisce quanti passeggeri ci sono attualmente al
      --  momento della fermata
      Trainstopped := True;
      --  il treno � nello stato "fermata"
   end Stopping;

   procedure Boarding is
   begin
      Trainstopped := False;
      Trainboarding := True;
      --  il treno � nello stato "imbarco"
   end Boarding;

   procedure CloseDoors (P : out Passengers) is
   begin
      P := On_Train;
      --  aggiorna la variabile passeggeri
      --  con il numero di passeggeri a bordo al momento
      --  della partenza
      Trainboarding := False;
      --  il treno NON � pi� nello stato "imbarco"
      --  essendo anche Trainstopped = False
      --  il treno si pu� considerare nello stato implicito
      --  "in transito"
   end CloseDoors;
end Station;

   task body Train is
      Volume : Passengers := 0;
      Travel_Times : array(Station_Address) of Duration := 2.0;
begin
      loop
         for S in Station_Address loop
            Station (S).Stopping(Volume);
            Station (S).Boarding;
            Station (S).CloseDoors(Volume);
            delay Travel_Times (S);
         end loop;
      end loop;
end Train;

   task body Clients is
      Home, Away : Station_Address;
   begin
      loop
         Station (Home).Arrive (Away);
         Home := Away;
      end loop;
   end Clients;
end Ring;
