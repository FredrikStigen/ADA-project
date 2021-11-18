package tasking is
   task ReadSensor with Priority => 2;
   task RightTurn with Priority => 1;
   task LeftTurn with Priority => 1;
   task DirectionCorrection with Priority => 1;
   --task NoLineDetected with Priority => 1;
end tasking;
