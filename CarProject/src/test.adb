with ada.Text_IO; use ada.Text_IO;
with ada.Real_Time; use ada.Real_Time;
with MicroBit.IOsForTasking;
with taskingtest;

procedure test with Priority => 0 is
begin
   loop
      --MicroBit.IOsForTasking.Set(10, True);
      null;
   end loop;
end test;
