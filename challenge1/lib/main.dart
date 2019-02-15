import 'package:decider/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(Decider());

class Decider extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decider',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Decider (Decide What to do)'),
    );
  }
}
