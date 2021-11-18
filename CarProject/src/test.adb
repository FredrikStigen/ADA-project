with ada.Text_IO; use ada.Text_IO;
with ada.Real_Time; use ada.Real_Time;
with MicroBit.IOsForTasking;
with taskingtest;

procedure test with Priority => 0 is
begin
   loop
      delay until clock + Milliseconds(500);
   end loop;
end test;
