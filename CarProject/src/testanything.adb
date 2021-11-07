with MicroBit.IOsForTasking;
with ada.Text_IO; use ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

procedure testanything is
   function RightTurn(var : in out Integer) return integer is
   begin
      while var <= 200 loop
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
      while var >= 0 loop
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
      if var = 200 then
         while var > 100 loop
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
      elsif var = 0 then
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
         end if;
      return var;
   end driveForward;


   x : integer := 0;
   L : Boolean;
   C : Boolean;
   R : Boolean;
   test : MicroBit.IOsForTasking.Analog_Value;

begin
   loop
      test := MicroBit.IOsForTasking.Analog(4);
      MicroBit.IOsForTasking.Write(10, test);
      L := MicroBit.IOsForTasking.Set(5);
      C := MicroBit.IOsForTasking.Set(6);
      R := MicroBit.IOsForTasking.Set(7);
      while L = True and C = False and R = False loop
         if x <= 0 then
            x := RightTurn(x);
         end if;
         L := MicroBit.IOsForTasking.Set(5);
         C := MicroBit.IOsForTasking.Set(6);
         R := MicroBit.IOsForTasking.Set(7);
      end loop;
      while R = True and C = False and L = False loop
         if x >= 200 then
            x:= LeftTurn(x);
         end if;
         L := MicroBit.IOsForTasking.Set(5);
         C := MicroBit.IOsForTasking.Set(6);
         R := MicroBit.IOsForTasking.Set(7);

      end loop;
      --  while R = False and C = False and L = False loop
      --     if x = 0 or x = 200 then
      --        x := driveForward(x);
      --     end if;
      --     L := MicroBit.IOsForTasking.Set(5);
      --     C := MicroBit.IOsForTasking.Set(6);
      --     R := MicroBit.IOsForTasking.Set(7);
      --  end loop;



      --  if x <= 0 then
      --     x := Forward(x);
      --  elsif >x = 200 then
      --     x := Backward(x);
      --  end if;
      --Put_Line(integer'Image(x));
      --delay 1.0;

   end loop;
end testanything;
