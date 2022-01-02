import 'dart:convert';

import 'package:http/http.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:trackout_fl_bloc/data/models/example.dart';
import 'package:trackout_fl_bloc/data/models/workout.dart';
import 'package:trackout_fl_bloc/data/states/examples_state.dart';
import 'package:trackout_fl_bloc/data/states/home_workout_obj.dart';
import 'package:trackout_fl_bloc/repository/examples_repository.dart';
import 'package:trackout_fl_bloc/repository/workout_repository.dart';
import 'package:trackout_fl_bloc/utils/date_utils.dart';

class OngoingWorkoutCubit extends Cubit<Workout?> {

  OngoingWorkoutCubit() : super(null){
    emit(null);
  }

  Future<void> startWorkout(Workout workout) async {
    workout.timestampStarted = DateTime.now().millisecondsSinceEpoch;

    Uri url = Uri.parse('https://thawing-eyrie-58399.herokuapp.com/api/workout/start');

    var bod = jsonEncode(<String, dynamic>{
      'workoutId': workout.workoutId,
      'timestampStarted': DateTime.now().millisecondsSinceEpoch
    });

    var headers = {'Content-Type': 'application/json; charset=UTF-8'};

    Response response = await post(url, headers: headers, body: bod);

    emit(workout);
  }

  Future<void> stopWorkout() async {
    emit(null);
  }

}
