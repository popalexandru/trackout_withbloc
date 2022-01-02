import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackout_fl_bloc/components/no_exercices.dart';
import 'package:trackout_fl_bloc/components/show_exercices.dart';
import 'package:trackout_fl_bloc/components/water_widget.dart';
import 'package:trackout_fl_bloc/data/models/exercice.dart';
import 'package:trackout_fl_bloc/data/models/responses/workout_response.dart';
import 'package:trackout_fl_bloc/data/models/workout.dart';
import 'package:trackout_fl_bloc/utils/utils.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({Key? key, required this.workoutResponse})
      : super(key: key);

  final WorkoutResponse workoutResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExerciceWrapper(exercicesList: workoutResponse.workout!.exerciceList!),
        StartWorkout(workout: workoutResponse.workout!, exercicesList: workoutResponse.workout!.exerciceList!),
        ShowWater(waterQty: workoutResponse.workout!.waterQty)
      ],
    );
  }
}

class StartWorkout extends StatelessWidget {
  StartWorkout({Key? key, required this.workout, required this.exercicesList}) : super(key: key);
  final utils = MyUtils();
  final Workout workout;
  final List<Exercice> exercicesList;

  @override
  Widget build(BuildContext context) {
    return (!utils.isWorkoutOngoing(workout) && exercicesList.isNotEmpty)
        ? TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.web),
            label: const Text(
              'Start Workout',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.lightBlue,
              onSurface: Colors.grey,
            ),
          )
        : SizedBox(width: 1, height: 1);
  }
}

class ExerciceWrapper extends StatelessWidget {
  const ExerciceWrapper({Key? key, required this.exercicesList})
      : super(key: key);

  final List<Exercice> exercicesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: (exercicesList.isNotEmpty)
          ? ShowExercices(exercicesList: exercicesList)
          : const NoExerciceComponent(),
    );
  }
}
