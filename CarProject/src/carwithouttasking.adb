with MicroBit.IOsForTasking;
with ada.Text_IO; use ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;


procedure CarWithoutTasking is
   function RightTurn(var : in out Integer) return integer is
   begin
      while var <= 50 loop
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
      while var >= -50 loop
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

   function driveForward(var : in out integer) return integer is
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
      while var < 0 loop
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
   end driveForward;


   x : integer := 0;
   L : Boolean;
   C : Boolean;
   R : Boolean;
   readPot : MicroBit.IOsForTasking.Analog_Value;

begin
   loop
      readPot := MicroBit.IOsForTasking.Analog(4);
      MicroBit.IOsForTasking.Write(10, 750);
      L := MicroBit.IOsForTasking.Set(5);
      C := MicroBit.IOsForTasking.Set(6);
      R := MicroBit.IOsForTasking.Set(7);

      while L = True and C = False and R = False loop
         x := RightTurn(x);
         L := MicroBit.IOsForTasking.Set(5);
         C := MicroBit.IOsForTasking.Set(6);
         R := MicroBit.IOsForTasking.Set(7);
      end loop;

      while R = True and C = False and L = False loop
         x := LeftTurn(x);
         L := MicroBit.IOsForTasking.Set(5);
         C := MicroBit.IOsForTasking.Set(6);
         R := MicroBit.IOsForTasking.Set(7);
      end loop;

      while R = False and C = False and L = False loop
         x := driveForward(x);
         L := MicroBit.IOsForTasking.Set(5);
         C := MicroBit.IOsForTasking.Set(6);
         R := MicroBit.IOsForTasking.Set(7);
      end loop;
   end loop;
end CarWithoutTasking;
