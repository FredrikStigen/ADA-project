with MicroBit.IOsForTasking;
with ada.Text_IO; use ada.Text_IO;

procedure SensorTest is
   L : boolean;
   C : Boolean;
   R : Boolean;
begin
   loop
      L := MicroBit.IOsForTasking.Set(4);
      C := MicroBit.IOsForTasking.Set(6);
      R := MicroBit.IOsForTasking.set(7);
      delay 0.5;
      Put_Line("L : " & Boolean'image(L));
      Put_Line("C : " & Boolean'image(C));
      Put_Line("R : " & Boolean'image(R));
      delay 0.5;
   end loop;
end SensorTest;
