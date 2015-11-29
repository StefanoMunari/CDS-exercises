with Producer;
with Consumer;
with Buffers;

procedure Main is
   use Producer
       , Consumer;
   A_Producer : Producer_Ref;
   A_Consumer : Consumer_Ref;
begin
   A_Producer := new Producer.Producer_T;
   delay 0.1;
   A_Consumer := new Consumer.Consumer_T;
   delay 0.1;
   A_Producer := new Producer.Producer_T;
   delay 0.1;
   A_Consumer := new Consumer.Consumer_T;
end Main;
