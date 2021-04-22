import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:authentification/Screens/Settings.dart';
import 'package:authentification/Screens/Students.dart';

import 'package:authentification/Screens/Dashborad.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> viewContainer = [
    Dashboard(),
    Students(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      body: viewContainer[currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: currentIndex,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.bar_chart),
              title: Text("Dashboard"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.list_alt_rounded),
              title: Text("Students"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.settings),
              title: Text("Settings"),
            )
          ]),
    );
  }
}
