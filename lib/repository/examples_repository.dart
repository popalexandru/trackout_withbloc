import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:trackout_fl_bloc/data/models/example.dart';
import 'package:trackout_fl_bloc/data/models/exercice.dart';
import 'package:trackout_fl_bloc/data/models/responses/workout_response.dart';

class ExamplesRepository {
  Future<List<Example>> getExamples() async {
    Uri url = Uri.parse(
        'https://thawing-eyrie-58399.herokuapp.com/api/example/get/all');
    Response response = await get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    });

    print(response.body);

    Iterable iterable = json.decode(response.body);

    return List<Example>.from(iterable.map((e) => Example.fromJson(e)));
  }
}
