package Smoker is
      --  TODO: Set proper priority to Smoker

   --  a smoker, which is given the identifier (positive number) of the resource
   --+ he has an infinity amount of
   task type Smoker_T
      (Resource : Integer);
   type Smoker_Ref is access Smoker_T;

end Smoker;
