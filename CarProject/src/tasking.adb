with ada.Text_IO; use ada.Text_IO;
with ada.Real_Time; use ada.Real_Time;

package body tasking is
 task body T is
   begin
      accept start  do
         Put_Line("in T");
      end start;
   end T;
end tasking;
