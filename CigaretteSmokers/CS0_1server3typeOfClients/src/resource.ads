package Resource is
   -- 0 => Tobacco
   -- 1 => Matches
   -- 2 => Cigarette_Paper
   type Resource_T is ( Empty, Matches, Cigarette_Paper, Tobacco );
   for Resource_T use
   (Empty => 0, Matches => 1, Cigarette_Paper => 2, Tobacco => 3);
end Resource;
