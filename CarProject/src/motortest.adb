with MicroBit.IOsForTasking;
with ada.Text_IO; use ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
procedure motortest is   

begin
  
   loop
     
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
 
   end loop;
end motortest;
