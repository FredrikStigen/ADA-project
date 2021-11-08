with ada.Text_IO; use ada.Text_IO;

package body tasking is
 task body T is
   begin
      Put_Line ("In task T");
   end T;

   task body T2 is
   begin
      Put_Line ("In task T2");
   end T2;
end tasking;
