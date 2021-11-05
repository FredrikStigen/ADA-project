with ada.Text_IO; use ada.Text_IO;
with MicroBit.IOsForTasking;
procedure Main is
   test : MicroBit.IOsForTasking.Analog_Value;
begin
   loop
      test := MicroBit.IOsForTasking.Analog(4);
      put_line(integer'image(Integer(test)));
      delay 1.0;
   end loop;
end Main;
