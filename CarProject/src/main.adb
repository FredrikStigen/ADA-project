with ada.Text_IO; use ada.Text_IO;
with ada.Real_Time; use ada.Real_Time;
with MicroBit.IOsForTasking;
with tasking;

procedure main with Priority => 0 is
begin
   loop
      --null;
      MicroBit.IOsForTasking.set(10, True);
   end loop;
end main;
