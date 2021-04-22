import 'package:authentification/Screens/Login.dart';
import 'package:authentification/Screens/SignUp.dart';
import 'package:authentification/Screens/Start.dart';
import 'package:flutter/material.dart';
import 'package:authentification/Screens/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:authentification/Screens/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        "HomePage": (BuildContext context) => HomePage(),
        "Login": (BuildContext context) => Login(),
        "SignUp": (BuildContext context) => SignUp(),
        "start": (BuildContext context) => Start(),
      },
    );
  }
}
