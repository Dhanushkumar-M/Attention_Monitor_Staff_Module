import 'package:authentification/Constant/Constant.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

final reference = FirebaseDatabase.instance.reference().child('DataStore');

class _DashboardState extends State<Dashboard> {
  int att = 0, medi = 0;

  @override
  void initState() {
    super.initState();
  }

  double overall() {
    int att = 0, medi = 0;
    for (int i = 0; i < data.length; i++) {
      if (int.parse(data[i]["attention_Level"]) > 0) {
        att += int.parse(data[i]["attention_Level"]);
      }
    }
    for (int i = 0; i < data.length; i++) {
      if (int.parse(data[i]["meditation_Level"]) > 0) {
        medi += int.parse(data[i]["meditation_Level"]);
      }
    }
    double mean = (att + medi) / 4;

    return mean;
  }

  int Good() {
    int counter = 0;
    for (int i = 0; i < data.length; i++) {
      if (int.parse(data[i]["attention_Level"]) +
              int.parse(data[i]["meditation_Level"]) >
          120) {
        counter += 1;
      }
    }
    return counter;
  }

  int Medium() {
    int counter = 0;
    for (int i = 0; i < data.length; i++) {
      if ((int.parse(data[i]["attention_Level"]) +
                  int.parse(data[i]["meditation_Level"])) >
              80 &&
          (int.parse(data[i]["attention_Level"]) +
                  int.parse(data[i]["meditation_Level"])) <
              120) {
        counter += 1;
      }
    }
    return counter;
  }

  int Low() {
    int counter = 0;
    for (int i = 0; i < data.length; i++) {
      if (int.parse(data[i]["attention_Level"]) +
              int.parse(data[i]["meditation_Level"]) <
          80) {
        counter += 1;
      }
    }
    return counter;
  }

  int stdPresent = count;
  int stdClass = 54;

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
                      stdClass.toString(),
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
                    child: Text('OverAll Focus Level',
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
                  percent: overall() / 100,
                  center: new Text(
                    overall().toString() + " %",
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
                      Good().toString(),
                      style: TextStyle(fontSize: 22, color: Colors.green),
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: Text(
                      Medium().toString(),
                      style: TextStyle(fontSize: 22, color: Colors.yellow),
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: Text(
                      Low().toString(),
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
