with ada.Text_IO; use Ada.Text_IO;


procedure taskingtest is
   task T;
   task T2;

   task body T is
   begin
      Put_Line ("In task T");
   end T;

   task body T2 is
   begin
      Put_Line ("In task T2");
   end T2;
begin
   Put_Line ("In main");
end taskingtest;
