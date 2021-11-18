with ada.Text_IO; use ada.Text_IO;
with ada.Real_Time; use ada.Real_Time;
with MicroBit.IOsForTasking;

package body tasking is
   LeftSensor : boolean;		--
   CenterSensor : Boolean;		--Sensor for linetracking
   RightSensor : boolean;		--

   x : integer := 0; --Stepmotor tickposition

   task body ReadSensor is		--Updates the line sensors
   begin
      loop
         --  LeftSensor := MicroBit.IOsForTasking.Set(5);
         --  CenterSensor := MicroBit.IOsForTasking.Set(6);
         --  RightSensor := MicroBit.IOsForTasking.Set(7);

         LeftSensor := False;
         CenterSensor := False;
         RightSensor := False;
         MicroBit.IOsForTasking(10, True);

         Put_Line("L : " & Boolean'image(LeftSensor));
         Put_Line("C : " & Boolean'image(CenterSensor));
         Put_Line("R : " & Boolean'image(RightSensor));
         delay until clock + Milliseconds(100);
      end loop;
   end ReadSensor;

   task body RightTurn is
   begin
      while x < 50 and LeftSensor = True and CenterSensor = False
        and RightSensor = False loop
         MicroBit.IOsForTasking.Set(0, True);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Microseconds(1750);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, True);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Microseconds(1750);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, True);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Microseconds(1750);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, True);
         delay until Clock + Microseconds(1750);
         x := x + 1;
      end loop;
      delay until clock + Milliseconds(450);
   end RightTurn;

   task body LeftTurn is
   begin
      while x > -50 and LeftSensor = False and CenterSensor = False
        and RightSensor = True loop
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, True);
         delay until Clock + Microseconds(1750);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, True);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Microseconds(1750);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, True);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Microseconds(1750);
         MicroBit.IOsForTasking.Set(0, True);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Microseconds(1750);
         x := x - 1;
         Put_Line(integer'image(x));
      end loop;
      delay until clock + Milliseconds(450);
   end LeftTurn;

   task body DirectionCorrection is
   begin
      if LeftSensor = False and CenterSensor = False
        and RightSensor = False then
         while x < 0 and x < 50 loop
            MicroBit.IOsForTasking.Set(0, True);
            MicroBit.IOsForTasking.Set(1, False);
            MicroBit.IOsForTasking.Set(2, False);
            MicroBit.IOsForTasking.Set(3, False);
            delay until Clock + Microseconds(1750);
            MicroBit.IOsForTasking.Set(0, False);
            MicroBit.IOsForTasking.Set(1, True);
            MicroBit.IOsForTasking.Set(2, False);
            MicroBit.IOsForTasking.Set(3, False);
            delay until Clock + Microseconds(1750);
            MicroBit.IOsForTasking.Set(0, False);
            MicroBit.IOsForTasking.Set(1, False);
            MicroBit.IOsForTasking.Set(2, True);
            MicroBit.IOsForTasking.Set(3, False);
            delay until Clock + Microseconds(1750);
            MicroBit.IOsForTasking.Set(0, False);
            MicroBit.IOsForTasking.Set(1, False);
            MicroBit.IOsForTasking.Set(2, False);
            MicroBit.IOsForTasking.Set(3, True);
            delay until Clock + Microseconds(1750);
            x := x + 1;
         end loop;
         while x > 0 and x > -50 loop
            MicroBit.IOsForTasking.Set(0, False);
            MicroBit.IOsForTasking.Set(1, False);
            MicroBit.IOsForTasking.Set(2, False);
            MicroBit.IOsForTasking.Set(3, True);
            delay until Clock + Microseconds(1750);
            MicroBit.IOsForTasking.Set(0, False);
            MicroBit.IOsForTasking.Set(1, False);
            MicroBit.IOsForTasking.Set(2, True);
            MicroBit.IOsForTasking.Set(3, False);
            delay until Clock + Microseconds(1750);
            MicroBit.IOsForTasking.Set(0, False);
            MicroBit.IOsForTasking.Set(1, True);
            MicroBit.IOsForTasking.Set(2, False);
            MicroBit.IOsForTasking.Set(3, False);
            delay until Clock + Microseconds(1750);
            MicroBit.IOsForTasking.Set(0, True);
            MicroBit.IOsForTasking.Set(1, False);
            MicroBit.IOsForTasking.Set(2, False);
            MicroBit.IOsForTasking.Set(3, False);
            delay until Clock + Microseconds(1750);
            x := x - 1;
         end loop;
      end if;
      delay until clock + Milliseconds(450);
   end DirectionCorrection;

   --  task body NoLineDetected is
   --  begin
   --     if LeftSensor = True and CenterSensor = True
   --       and RightSensor = True then
   --        MicroBit.IOsForTasking.Set(10, False);
   --        Put_Line("Stopping...");
   --        delay until clock + Milliseconds(200);
   --     end if;
   --  end NoLineDetected;

end tasking;
