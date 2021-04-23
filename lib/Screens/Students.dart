import 'package:authentification/Constant/Constant.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Students extends StatefulWidget {
  @override
  _StudentsState createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('DataStore');
  List<Map<dynamic, dynamic>> lists = [];
  navigateBack() async {
    Navigator.pushReplacementNamed(context, "Dashboard");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                  'Student List',
                  style: TextStyle(fontSize: 30),
                )),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  color: Colors.deepPurple,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.deepPurple,
              ),
              tooltip: 'Back',
              onPressed: navigateBack,
            ),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Students Present Online',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Attention',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Meditation',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                FutureBuilder(
                    future: reference.once().then((value) => reference.once()),
                    builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        lists.clear();
                        Map<dynamic, dynamic> values = snapshot.data.value;
                        values.forEach((key, values) {
                          lists.add(values);
                        });
                        count = lists.length;
                        data = lists;
                        return new ListView.builder(
                            shrinkWrap: true,
                            itemCount: lists.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(lists[index]["name"]),
                                        Text(lists[index]["attention_Level"]),
                                        Text(lists[index]["meditation_Level"]),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                      return CircularProgressIndicator();
                    }),
              ],
            ),
          )),
    );
  }
}
