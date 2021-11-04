with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with ada.Text_IO; use ada.Text_IO;

procedure SensorTest is
   sensor1 : Boolean;
   sensor2 : Boolean;
   sensor3 : Boolean;
begin
   loop
      sensor1 := Set(7);
      sensor2 := Set(8);
      sensor3 := Set(9);
      Put_Line("Sensor1: " & Boolean'image(sensor1));
      Put_Line("Sensor2: " & Boolean'image(sensor2));
      Put_Line("Sensor3: " & Boolean'image(sensor3));
      delay 1.0;
   end loop;
end SensorTest;
