import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:percent_indicator/percent_indicator.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('DataStore');
  List<Map<dynamic, dynamic>> lists = [];

  int stdPresent = 90;
  int stdClass = 0;
  int good, low, medium = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                'DashBoard',
                style: TextStyle(fontSize: 30),
              )),
          elevation: 0,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                    child: Text(
                      "No of Students in class",
                      style: TextStyle(fontSize: 24),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 5, 0),
                    child: Text(
                      "No of Students Present",
                      style: TextStyle(fontSize: 24),
                    ),
                  ))
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Center(
                    child: Text(
                      "57",
                      style: TextStyle(fontSize: 22),
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: Text(
                      stdPresent.toString(),
                      style: TextStyle(fontSize: 22),
                    ),
                  ))
                ],
              )),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Center(
                    child: Text('OverAll Attention Level',
                        style: TextStyle(
                          fontSize: 26,
                        )),
                  ),
                  //color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 3,
                child: new CircularPercentIndicator(
                  radius: 180.0,
                  lineWidth: 18.0,
                  animation: true,
                  percent: stdPresent / 100,
                  center: new Text(
                    stdPresent.toString(),
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.purple,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "Students Listening Good",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          "Students Listening Moderate",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "Students Listening Low",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    )),
                  ],
                ),
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Center(
                    child: Text(
                      "00",
                      style: TextStyle(fontSize: 22, color: Colors.green),
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: Text(
                      "00",
                      style: TextStyle(fontSize: 22, color: Colors.yellow),
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: Text(
                      "00",
                      style: TextStyle(fontSize: 22, color: Colors.red),
                    ),
                  ))
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
