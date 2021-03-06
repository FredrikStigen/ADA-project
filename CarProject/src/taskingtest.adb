with ada.Text_IO; use ada.Text_IO;
with ada.Real_Time; use ada.Real_Time;
with MicroBit.IOsForTasking;

package body taskingtest is
   LeftSensor : Boolean;		--
   CenterSensor : Boolean;		-- Variables for each IR sensor
   RightSensor : Boolean;		--

   x : integer := 0;				-- Tick counter for step motor position


   -- This task will run alot, making sure that the sensors are
   -- kept update as often as possible to be able to keep
   -- The car on the track
   task body ReadSensor is
   begin
      loop
         LeftSensor := MicroBit.IOsForTasking.Set(4);
         CenterSensor := MicroBit.IOsForTasking.Set(6);
         RightSensor := MicroBit.IOsForTasking.Set(7);

         MicroBit.IOsForTasking.set(10, True); -- Starts the engine
         delay until clock + Milliseconds(200);
      end loop;
   end ReadSensor;
   
   
 
   -- When the Left IR sensor activates (Sensor is on a light surface)
   -- the conditions in the task is met and the car will then turn
   -- to the right to get back on track
   task body TurnRight is
   begin
      loop
         if LeftSensor = True and CenterSensor = False and RightSensor = False then
            if x < 100 then
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
            end if;
         end if;
         delay until clock + Microseconds(1750);
      end loop;
   end TurnRight;

   -- When the Right IR sensors activates (Sensor is on a light surface)
   -- the conditions in the task is met and the car will then turn
   -- to the left to get back on track
   task body TurnLeft is
   begin
      loop
         if LeftSensor = False and CenterSensor = False and RightSensor = True then
            if x > -100 then
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
            end if;
         end if;
         delay until clock + Microseconds(1750);
      end loop;
   end TurnLEft;

   -- When the car is currently turning either to the left or to the right
   -- and the cars sensors are all on top of a dark surface
   -- the wheel will go back to its default position to be able
   -- to drive forward
   task body DirectCorrection is	-- Returns the step motor to its
   begin								-- default position when it is back on track
      loop
         if LeftSensor = False and CenterSensor = False
           and RightSensor = False then
            if x < 0 and x < 100 then
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
            end if;
            if x > 0 and x > -100 then
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
            end if;
         end if;
         delay until clock + Microseconds(1750);
      end loop;
   end DirectCorrection;
end taskingtest;
