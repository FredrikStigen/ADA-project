with MicroBit.IOsForTasking;
with ada.Text_IO; use ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

procedure motortest is   
   function Forward(var : in out Integer) return integer is
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
end Forward;

   function Backward(var : in out Integer) return integer is
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
   end Backward;

   x : integer := 0;
begin
   loop
      if x <= 0 then
         x := Forward(x);
      elsif x >= 200 then
         x := Backward(x);
      end if;
   end loop;
end motortest;
