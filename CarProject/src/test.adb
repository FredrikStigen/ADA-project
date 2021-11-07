with MicroBit.IOsForTasking;
with ada.Text_IO; use ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with ada.Task_Identification;

procedure test is
   x : integer := 100;
   L : Boolean;
   C : Boolean;
   R : Boolean;
   Task ReadSensors;
   Task Drive;

   function RightTurn(var : in out Integer) return integer is
   begin
      while var < 200 loop
         MicroBit.IOsForTasking.Set(0, True);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, True);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, True);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, True);
         delay until Clock + Milliseconds (2);
         var := var + 1;
      end loop;
      return var;
   end RightTurn;

   function LeftTurn(var : in out Integer) return integer is
   begin
      while var > 0 loop
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, True);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, True);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, True);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, True);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         var := var - 1;
      end loop;
      return var;
   end LeftTurn;

   Task body ReadSensors is
   begin
      loop
         L := MicroBit.IOsForTasking.Set(5);
         C := MicroBit.IOsForTasking.Set(6);
         R := MicroBit.IOsForTasking.Set(7);
      end loop;
   end ReadSensors;

   Task body Drive is
   begin
      loop
         MicroBit.IOsForTasking.Set(10, True);
      end loop;
   end Drive;

begin
   loop
      if L = False and C = False and R = True then
         --if x = 100 then
         x := LefttTurn(x);
         --end if;
      elsif L = True and C = False and R = False then
         x := RightTurn(x);
      end if;
   end loop;
end test;
