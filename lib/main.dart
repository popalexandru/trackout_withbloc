import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:trackout_fl_bloc/components/miniplayer.dart';
import 'package:trackout_fl_bloc/cubit/examples_cubit.dart';
import 'package:trackout_fl_bloc/cubit/ongoing_workout_cubit.dart';
import 'package:trackout_fl_bloc/cubit/workout_cubit.dart';
import 'package:trackout_fl_bloc/repository/examples_repository.dart';
import 'package:trackout_fl_bloc/repository/workout_repository.dart';
import 'package:trackout_fl_bloc/views/add_ex_view.dart';
import 'package:trackout_fl_bloc/views/home_view.dart';

import 'data/models/workout.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
final MiniplayerController controller = MiniplayerController();

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<WorkoutCubit>(
          create: (context) => WorkoutCubit(WorkoutRepository()),
        ),
        BlocProvider<ExamplesCubit>(
            create: (context) => ExamplesCubit(ExamplesRepository())),
        BlocProvider<OngoingWorkoutCubit>(
            create: (context) => OngoingWorkoutCubit())
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
    return Stack(children: [
      Navigator(
        key: _navigatorKey,
        onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => HomePage(),
        ),
      ),
      BlocBuilder<OngoingWorkoutCubit, Workout?>(builder: (context, state) {
        if(state == null){
          return SizedBox(height: 1, width: 1);
        }

        return PlayerSheet(state, controller);
      })
    ]);
  }
}
