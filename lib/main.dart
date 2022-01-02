import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackout_fl_bloc/cubit/examples_cubit.dart';
import 'package:trackout_fl_bloc/cubit/workout_cubit.dart';
import 'package:trackout_fl_bloc/repository/examples_repository.dart';
import 'package:trackout_fl_bloc/repository/workout_repository.dart';
import 'package:trackout_fl_bloc/views/add_ex_view.dart';
import 'package:trackout_fl_bloc/views/home_view.dart';

/*void main() {
  runApp(MaterialApp(
    home: MyApp(),
    routes: {'/add': (context) => const AddExercicePage()},
  ));
}*/

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<WorkoutCubit>(
          create: (context) => WorkoutCubit(WorkoutRepository()),
        ),
        BlocProvider<ExamplesCubit>(
          create: (context) => ExamplesCubit(ExamplesRepository())
        )
      ],
      child: MaterialApp(
        home: MyApp(),
        routes: {'/add': (context) => const AddExercicePage()},
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
