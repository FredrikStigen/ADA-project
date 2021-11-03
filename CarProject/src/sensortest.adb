with MicroBit.IOsForTasking;
with ada.Text_IO; use ada.Text_IO;

procedure SensorTest is
   x : Boolean;  
begin
   loop
      x := MicroBit.IOsForTasking.Set(0);
      Put_Line("Sensor" & Boolean'image(x));
      delay 1.0;
   end loop;
end SensorTest;
