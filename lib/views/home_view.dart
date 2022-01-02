import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trackout_fl_bloc/components/loading_widget.dart';
import 'package:trackout_fl_bloc/cubit/ongoing_workout_cubit.dart';
import 'package:trackout_fl_bloc/cubit/workout_cubit.dart';
import 'package:trackout_fl_bloc/data/states/home_workout_obj.dart';
import 'package:trackout_fl_bloc/repository/workout_repository.dart';
import 'package:trackout_fl_bloc/views/workout_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

/*  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutCubit>(
        create: (context) => WorkoutCubit(WorkoutRepository()),
        child: HomeView());
  }*/
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<WorkoutCubit>(context),
        child: HomeView()
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen"),
        centerTitle: false,
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 6,
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        label: Row(
          children: [
            Icon(Icons.add) /*, Text('Add exercice')*/
          ],
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            startDay: DateTime.utc(2010, 10, 16),
            endDay: DateTime.utc(2030, 3, 14),
            calendarController: _calendarController,
            startingDayOfWeek: StartingDayOfWeek.monday,
            initialCalendarFormat: CalendarFormat.week,
            onDaySelected: (day, events, holidays) {
              context.read<WorkoutCubit>().getWorkout(day);
            },
          ),
          Flexible(
            child: BlocBuilder<WorkoutCubit, HomeWorkoutObj>(
              builder: (context, state) {
                switch (state.workoutState) {
                  case WorkoutState.loading:
                    return const LoadingWidget();
                  case WorkoutState.success:
                    if (state.workoutResponse != null) {
                      /* pass the workout object to workout viewer */
                      context.read<OngoingWorkoutCubit>().startWorkout(state.workoutResponse!.workout!);
                      return WorkoutView(
                          workoutResponse: state.workoutResponse!);
                    } else {
                      return Text('null');
                    }

                  case WorkoutState.failure:
                    return Text('Failed', style: TextStyle(color: Colors.red));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
