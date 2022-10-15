import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/Products/product_page.dart';


import 'constants.dart';
import 'homescreen.dart';


void main() {
  runApp(const  ProviderScope(child: MyApp()));
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
      home: const HomeScreen(),

      routes: <String,WidgetBuilder>{

        '/products': (BuildContext context) => ProductsPage(),


      }
    );
  }
}
