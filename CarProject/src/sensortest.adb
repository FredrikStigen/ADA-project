with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with ada.Text_IO; use ada.Text_IO;

procedure SensorTest is
   L : Boolean;
   C : Boolean;
   R : Boolean;
begin
   loop
      L := Set(5);
      C := Set(6);
      R := Set(7);
      Put_Line("Left sensor: " & Boolean'image(L));
      Put_Line("Center sensor: " & Boolean'image(C));
      Put_Line("Right sensor: " & Boolean'image(R));
      delay 1.0;
   end loop;
end SensorTest;
