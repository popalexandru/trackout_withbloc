import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class ShowWater extends StatelessWidget {
  const ShowWater({Key? key, required this.waterQty}) : super(key: key);

  final int waterQty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Water',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                )),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: LiquidCircularProgressIndicator(
                  value: waterQty / 2500,
                  valueColor: AlwaysStoppedAnimation(
                      Colors.lightBlueAccent),
                  backgroundColor: Colors.white,
                  borderColor: Colors.lightBlueAccent,
                  borderWidth: 3.0,
                  direction: Axis.vertical,
                  center: Text(
                      "$waterQty / 2500 ml"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding:
                        EdgeInsets.all(4.0),
                        child: Card(
                          child: TextButton(
                              onPressed: () {
                                /*homeService
                                    .addWater(300);*/
                              },
                              child: Text('300 ml')),
                        )),
                    Padding(
                        padding:
                        EdgeInsets.all(4.0),
                        child: Card(
                          child: TextButton(
                              onPressed: () {
                                /*homeService
                                    .addWater(600);*/
                              },
                              child: Text('600 ml')),
                        )),
                    Padding(
                        padding:
                        EdgeInsets.all(4.0),
                        child: Card(
                            child: TextButton(
                                onPressed: () {
                                  /*homeService
                                      .addWater(900);*/
                                },
                                child:
                                Text('900 ml')))),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
