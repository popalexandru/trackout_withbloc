import 'package:equatable/equatable.dart';
import 'package:trackout_fl_bloc/data/models/example.dart';
import 'package:trackout_fl_bloc/data/models/exercice.dart';
import 'package:trackout_fl_bloc/data/models/responses/workout_response.dart';

import 'home_workout_obj.dart';

extension WorkoutStateX on WorkoutState {
  bool get isLoading => this == WorkoutState.loading;
}

class ExamplesState extends Equatable {
  final WorkoutState workoutState;
  final List<Example>? examples;

  const ExamplesState({this.workoutState = WorkoutState.loading, this.examples});

  @override
  List<Object?> get props => [workoutState, examples];
}
