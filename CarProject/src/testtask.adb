with ada.Text_IO; use ada.Text_IO;
with ada.Real_Time; use ada.Real_Time;
with MicroBit.IOsForTasking;
with taskingtest;

procedure testtask is
begin
   loop
      Put_Line("Every 10000ms");
      delay until clock + Milliseconds(10000);
   end loop;
end testtask;
