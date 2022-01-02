import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:trackout_fl_bloc/data/models/example.dart';
import 'package:trackout_fl_bloc/data/states/examples_state.dart';
import 'package:trackout_fl_bloc/data/states/home_workout_obj.dart';
import 'package:trackout_fl_bloc/repository/examples_repository.dart';
import 'package:trackout_fl_bloc/repository/workout_repository.dart';
import 'package:trackout_fl_bloc/utils/date_utils.dart';

class ExamplesCubit extends Cubit<ExamplesState> {
  final ExamplesRepository examplesRepository;

  ExamplesCubit(this.examplesRepository) : super(ExamplesState()) {
    getExamples();
  }

  Future<void> getExamples() async {
    _Loading();

    try {
      List<Example> exampleList = await examplesRepository.getExamples();

      emit(ExamplesState(
          workoutState: WorkoutState.success, examples: exampleList));
    } on Exception {
      const ExamplesState(workoutState: WorkoutState.failure, examples: []);
    }
  }

  void _Loading() {
    emit(const ExamplesState(workoutState: WorkoutState.loading, examples: []));
  }
}
