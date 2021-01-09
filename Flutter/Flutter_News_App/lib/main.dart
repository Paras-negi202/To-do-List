import 'package:flutter/material.dart';
import 'view/home.dart';
import 'package:provider/provider.dart';
import 'index_change.dart';
void main() {
  runApp(Provider(
      create: (context)=>Index(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

