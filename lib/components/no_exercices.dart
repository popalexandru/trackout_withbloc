import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoExerciceComponent extends StatelessWidget {
  const NoExerciceComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 8, 28, 8),
          child: Column(
            children: const [
              Text(
                'No exercices added',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Use the + button to add one')
            ],
          ),
        ),
      ),
    );
  }
}