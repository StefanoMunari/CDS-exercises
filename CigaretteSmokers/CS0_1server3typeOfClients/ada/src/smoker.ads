with Resource;

package Smoker is

   use Resource;

   task type Smoker_T ( My_Id : Integer ; My_Resource : Resource.Resource_T ) is
   end Smoker_T;

   type Smoker_Ref is access Smoker_T;

end Smoker;
