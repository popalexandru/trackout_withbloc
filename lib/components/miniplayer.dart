import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/src/provider.dart';
import 'package:trackout_fl_bloc/cubit/ongoing_workout_cubit.dart';
import 'package:trackout_fl_bloc/data/models/workout.dart';
import 'package:trackout_fl_bloc/utils/date_utils.dart';

class PlayerSheet extends StatelessWidget {
  final Workout? workoutOngoingState;
  final MiniplayerController controller;
  final dateUtils = DateUtility();

  PlayerSheet(this.workoutOngoingState, this.controller,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Miniplayer(
      elevation: 4,
      controller: controller,
      minHeight: 70,
      maxHeight: 370,
      builder: (height, percentage) => Container(
        decoration: BoxDecoration(color: Colors.indigo),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Workout ongoing'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(13, 6, 6, 6),
                    child: Text(
                      workoutOngoingState != null
                          ? workoutOngoingState!.exerciceList![0].name
                          : "Null",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                context.read<OngoingWorkoutCubit>().stopWorkout();
              },
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}