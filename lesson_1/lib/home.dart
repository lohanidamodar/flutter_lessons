import 'package:flutter/material.dart';
import './login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson 1"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Widgets used", style: Theme.of(context).textTheme.display1,),
              ListTile(title: Text("Container")),
              ListTile(title: Text("BoxDecoration")),
              ListTile(title: Text("SingleChildScrollView")),
              ListTile(title: Text("Column")),
              ListTile(title: Text("TextField")),
              ListTile(title: Text("InputDecoration")),
              ListTile(title: Text("AppBar")),
              ListTile(title: Text("Image")),
              ListTile(title: Text("ListTile")),
              MaterialButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context)=>LoginPage()
                  ));
                },
                child: Text("Log Out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}