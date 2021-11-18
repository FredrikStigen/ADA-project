with ada.Text_IO; use ada.Text_IO;
with ada.Real_Time; use ada.Real_Time;
with MicroBit.IOsForTasking;

package body taskingtest is
   LeftSensor : Boolean;
   CenterSensor : Boolean;
   RightSensor : Boolean;
   
   task body ReadSensor is		--Updates the line sensors
   begin
      loop
         LeftSensor := MicroBit.IOsForTasking.Set(4);
         CenterSensor := MicroBit.IOsForTasking.Set(6);
         RightSensor := MicroBit.IOsForTasking.Set(7);
         delay until clock + Milliseconds(100);

      end loop;
   end ReadSensor;
   
   task body test is
   begin
      loop
         Put_Line(Boolean'image(LeftSensor));
         Put_Line(Boolean'image(CenterSensor));
         Put_Line(Boolean'image(RightSensor));
         delay until clock + Milliseconds(1000);
      end loop;
   end test;
end taskingtest;
