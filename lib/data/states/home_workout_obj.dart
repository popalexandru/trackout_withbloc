import 'package:equatable/equatable.dart';
import 'package:trackout_fl_bloc/data/models/responses/workout_response.dart';

enum WorkoutState {loading, success, failure}

extension WorkoutStateX on WorkoutState {
  bool get isLoading => this == WorkoutState.loading;
}

class HomeWorkoutObj extends Equatable {
  final WorkoutState workoutState;
  final WorkoutResponse? workoutResponse;

  const HomeWorkoutObj({this.workoutState = WorkoutState.loading, this.workoutResponse});

  @override
  List<Object?> get props => [workoutState, workoutResponse];
}
