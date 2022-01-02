import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:trackout_fl_bloc/data/models/exercice.dart';
import 'package:trackout_fl_bloc/data/models/responses/workout_response.dart';

class WorkoutRepository {
  Future<WorkoutResponse> getWorkoutByDate(String dateString) async {
    Uri url = Uri.parse(
        'https://thawing-eyrie-58399.herokuapp.com/api/workout/get?dateParam=$dateString');

    Response response = await get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    });

    return WorkoutResponse.fromJson(json.decode(response.body));
  }

  Future<bool> deleteExercice(String exampleId, String workoutId) async {
    Uri url = Uri.parse(
        'https://thawing-eyrie-58399.herokuapp.com/api/exercice/delete');

    var headers = {'Content-Type': 'application/json; charset=UTF-8'};

    var bod = jsonEncode(
        <String, String>{'exampleId': exampleId, 'workoutId': workoutId});

    Response response = await post(url, headers: headers, body: bod);

    return response.statusCode == HttpStatus.ok;
  }

  Future<bool> addExercice(String exampleId, String workoutId) async {
    Uri url =
    Uri.parse('https://thawing-eyrie-58399.herokuapp.com/api/exercice/add');

    var headers = {'Content-Type': 'application/json; charset=UTF-8'};

    var bod = jsonEncode(
        <String, String>{'exampleId': exampleId, 'workoutId': workoutId});

    Response response = await post(url, headers: headers, body: bod);

    return response.statusCode == HttpStatus.ok;
  }

  Future<List<Exercice>> getExercicesForWorkout(String workoutId) async {
    Uri url = Uri.parse(
        'https://thawing-eyrie-58399.herokuapp.com/api/workout/exercices?workoutId=${workoutId}');
    Response response = await get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    });

    Iterable iterable = json.decode(response.body);

    return List<Exercice>.from(iterable.map((e) => Exercice.fromJson(e)));
  }

  }
