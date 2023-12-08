import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:driplit/screen1.dart';
import 'package:driplit/screen2.dart';
import 'package:driplit/screen3.dart';
import 'package:driplit/screen4.dart';
import 'package:driplit/screen5.dart';
import 'package:driplit/screen6.dart';
// import 'package:driplit/screen7.dart';
// import 'package:driplit/screen8.dart';
// import 'package:driplit/screen9.dart';
// import 'package:driplit/screen10.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driplit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Screen1(),
      routes: {
        '/screen2': (context) => Screen2(),
        '/screen4': (context) => Screen4(),
        '/screen4': (context) => Screen5(),
        '/screen6': (context) => Screen6(),
        // '/screen4': (context) => Screen7(),
        // '/screen4': (context) => Screen8(),
        // '/screen4': (context) => Screen9(),
        // '/screen4': (context) => Screen10(),
      },
    );
  }
}
