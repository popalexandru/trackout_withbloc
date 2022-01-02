import 'package:trackout_fl_bloc/data/models/workout.dart';

class MyUtils {
  MyUtils(){

  }


  bool isWorkoutOngoing(Workout workout){
    return workout.isWorkoutDone == false
        && workout.timestampStarted > 0
        && workout.timestampDone == -1;
  }

}