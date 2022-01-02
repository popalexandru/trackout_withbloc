import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trackout_fl_bloc/components/examples_widget.dart';
import 'package:trackout_fl_bloc/components/loading_widget.dart';
import 'package:trackout_fl_bloc/cubit/examples_cubit.dart';
import 'package:trackout_fl_bloc/cubit/workout_cubit.dart';
import 'package:trackout_fl_bloc/data/states/examples_state.dart';
import 'package:trackout_fl_bloc/data/states/home_workout_obj.dart';
import 'package:trackout_fl_bloc/repository/workout_repository.dart';
import 'package:trackout_fl_bloc/views/workout_view.dart';

class AddExercicePage extends StatelessWidget {
  const AddExercicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<ExamplesCubit>(context),
        child: AddExerciceView());
  }
}

class AddExerciceView extends StatefulWidget {
  AddExerciceView({Key? key}) : super(key: key);

  @override
  State<AddExerciceView> createState() => _AddExerciceViewState();
}

class _AddExerciceViewState extends State<AddExerciceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add exercice"),
          centerTitle: false,
          backgroundColor: Colors.indigo,
        ),
        body: BlocBuilder<ExamplesCubit, ExamplesState>(
          builder: (context, state) {
            switch (state.workoutState) {
              case WorkoutState.loading:
                return const LoadingWidget();
              case WorkoutState.success:
                if (state.examples != null) {
                  return Examples(examplesList: state.examples!);
                } else {
                  return Text('null');
                }

              case WorkoutState.failure:
                return Text('Failed', style: TextStyle(color: Colors.red));
            }
          },
        ));
  }
}
