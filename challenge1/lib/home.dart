import 'dart:math';

import 'package:decider/activities.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> activities;
  int decided;

  @override
  void initState() {
    super.initState();
    activities  = [
      "Learn flutter",
      "Go out with friends",
      "Use social media",
      "Play video games",
      "Watch Youtube"
    ];
  }

  void _add(String text) {
    setState(() {
      activities.add(text);
    });
  }

  void _delete(String value){
    activities.remove(value);
  }

  void _decide() {
    var rand = Random();
    int max = activities.length  - 1;
    setState(() {
      decided = rand.nextInt(max);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("What to do next?", style: TextStyle(
              fontSize: 20.0,
            ),),
            SizedBox(height: 10.0,),
            decided == null
              ? Text("You have not made any decisions. Press button below to decide.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),)
              : Text(activities[decided], style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ),) ,
            SizedBox(height: 20.0,),
            Container(
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: _decide,
                child: Text("Decide", style: TextStyle(
                  color: Colors.white
                ),),
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => Activities(activities: activities,add:_add, delete: _delete)
                  ));
                },
                child: Text("Activities"),
                color: Colors.amber,
              ),
            ),
            
          ],
        ),
      ), 
    );
  }
}
