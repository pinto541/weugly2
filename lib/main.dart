import 'package:flutter/material.dart';
import 'package:untitled/signup.dart';

import 'constants.dart';
import 'homescreen.dart';
import 'package:untitled/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'weugly',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Gordian',
       scaffoldBackgroundColor: Colors.blueGrey,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black),


        ),
      ),
  routes: {
  '/' : (context) => login(),
    '/signup': (context) => const signup(),
  },

    );
  }
}
