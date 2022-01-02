import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trackout_fl_bloc/cubit/workout_cubit.dart';
import 'package:trackout_fl_bloc/data/models/exercice.dart';

import 'exercice_card_view.dart';

class ShowExercices extends StatelessWidget {
  const ShowExercices({Key? key, required this.exercicesList}) : super(key: key);
  final List<Exercice> exercicesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Exercices',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight:
                    FontWeight.bold,
                    fontSize: 23,
                  )),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount:
            exercicesList.length,
            itemBuilder: (context, index) {
              Exercice exercice = exercicesList[index];
              return Dismissible(
                  key: UniqueKey(),
                  background: Padding(
                    padding:
                    const EdgeInsets.all(
                        8.0),
                    child: Container(
                        decoration:
                        const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                          BorderRadius.all(
                              Radius.circular(
                                  20)),
                        )),
                  ),
                  onDismissed: (direction) {
                    // delete exercice
                    context.read<WorkoutCubit>().deleteExercice(exercice.exerciceId);
                  },
                  child:
                  ExerciceCard(exercice));
            },
          )
        ],
      ),
    );
  }
}
