import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:trackout_fl_bloc/data/states/home_workout_obj.dart';
import 'package:trackout_fl_bloc/repository/workout_repository.dart';
import 'package:trackout_fl_bloc/utils/date_utils.dart';

class WorkoutCubit extends Cubit<HomeWorkoutObj> {
  final WorkoutRepository workoutRepository;
  DateUtility dateUtility = DateUtility();

  WorkoutCubit(this.workoutRepository) : super(HomeWorkoutObj()) {
    getWorkout(DateTime.now());
  }

  Future<void> getWorkout(DateTime inputDate) async {
    String dbFormattedDate = dateUtility.formatDate(inputDate);
    _Loading();

    try {
      final workout = await workoutRepository.getWorkoutByDate(dbFormattedDate);

      emit(HomeWorkoutObj(
          workoutState: WorkoutState.success, workoutResponse: workout));
    } on Exception {
      emit(HomeWorkoutObj(workoutState: WorkoutState.failure));
    }
  }

  Future<void> addExercice(String exampleId) async {
    _Loading();

    try {
      bool exerciceAdded = await workoutRepository.addExercice(
          exampleId, state.workoutResponse!.workout!.workoutId);

      if (exerciceAdded) {
        state.workoutResponse!.workout!.exerciceList = await workoutRepository
            .getExercicesForWorkout(state.workoutResponse!.workout!.workoutId);

        emit(HomeWorkoutObj(
            workoutState: WorkoutState.success,
            workoutResponse: state.workoutResponse!));
      }
    } on Exception {
      emit(HomeWorkoutObj(workoutState: WorkoutState.failure));
    }
  }

  Future<void> deleteExercice(String exampleId) async {
    if(state.workoutResponse!.workout!.exerciceList!.length == 1){
      _Loading();
    }
    /*_Loading();*/

    try {
      bool exerciceDeleted = await workoutRepository.deleteExercice(
          exampleId, state.workoutResponse!.workout!.workoutId);

      if (exerciceDeleted) {
        state.workoutResponse!.workout!.exerciceList = await workoutRepository
            .getExercicesForWorkout(state.workoutResponse!.workout!.workoutId);

        emit(HomeWorkoutObj(
            workoutState: WorkoutState.success,
            workoutResponse: state.workoutResponse!));
      }
    } on Exception {
      emit(HomeWorkoutObj(workoutState: WorkoutState.failure));
    }
  }

  void _Loading() {
    emit(HomeWorkoutObj(
        workoutState: WorkoutState.loading,
        workoutResponse: state.workoutResponse));
  }
}
