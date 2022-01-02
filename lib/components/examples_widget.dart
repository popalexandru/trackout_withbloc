import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trackout_fl_bloc/cubit/workout_cubit.dart';
import 'package:trackout_fl_bloc/data/models/example.dart';

class Examples extends StatelessWidget {
  const Examples({Key? key, required this.examplesList}) : super(key: key);

  final List<Example> examplesList;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: examplesList.length,
            itemBuilder: (context, index) {
              Example ex = examplesList[index];
              return GestureDetector(
                  child: ExampleCard(ex),
                  onTap: () => {
                        context.read<WorkoutCubit>().addExercice(ex.id),
                        Navigator.pop(context)
                      });
            }));
  }
}

class ExampleCard extends StatelessWidget {
  final Example example;

  const ExampleCard(this.example, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.grey, blurRadius: 3, spreadRadius: 0.1)
            ]),
        /*
        margin: EdgeInsets.symmetric(5),*/
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [Text(example.name), Text(example.description)],
          ),
        ),
      ),
    );
  }
}
