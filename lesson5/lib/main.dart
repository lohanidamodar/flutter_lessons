import 'package:flutter/material.dart';
import 'package:listview/list_view_builder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List View",
      home: HomePage(),
      routes: {
        "builder" : (_)=>ListViewBuilder(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Listview"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("This is a simple listview. This can be used excatly like column, it automatically scrolls if content overflows."),
          ),
          ListTile(
            title: Text("ListView.builder"),
            onTap: () => Navigator.pushNamed(context, 'builder'),
          ),
          ListTile(
            title: Text("ListView.builder with data from API"),
            onTap: () => Navigator.pushNamed(context, 'builder'),
          ),
        ],
      ),
    );
  }
}