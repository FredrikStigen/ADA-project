with MicroBit.IOsForTasking;
with MicroBit.IOsForTaskingTimer1;
with ada.Text_IO; use ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
procedure motortest is   
   Time_Now : ada.Real_Time.Time;
   pwmDelay : Integer := 2;
   
begin
   MicroBit.IOsForTasking.Set_Analog_Period_Us(2000);
   MicroBit.IOsForTaskingTimer1.Set_Analog_Period_Us(2000);
   loop
     Time_Now := Clock;
      MicroBit.IOsForTasking.Write(0,0);
      MicroBit.IOsForTasking.Write(1,0);
      MicroBit.IOsForTasking.Write(2,0);
      MicroBit.IOsForTaskingTimer1.Write(3,512);
    delay until Time_Now + Milliseconds (pwmDelay);
    
      
   -- delay until Time_Now + 4* Milliseconds (pwmDelay);
 
   end loop;
end motortest;
