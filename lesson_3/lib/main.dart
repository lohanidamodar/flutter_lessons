import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ButtonsPage(),
    );
  }
}


class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons Demo"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          FlatButton(
            color: Colors.red,
            child: Text("Flat Button"),
            onPressed: (){
              print("flat button pressed");
            },
          ),
          RaisedButton(
            child: Text("Raised Button"),
            color: Colors.green,
            onPressed: (){
              print("Raised button pressed");
            },
          ),
          MaterialButton(
            child: Text("Material Button"),
            color: Colors.deepOrange,
            onPressed: (){print("material button presse");},
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add_a_photo),
            onPressed: (){print("Raised button with icon pressed");},
            label: Text('Raised Button Icon'),
          ),
          FlatButton.icon(
            label: Text("Flat button icon"),
            icon: Icon(Icons.play_circle_filled),
            onPressed: (){
              print("Flat button with icon pressed");
            },
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Text("Rounded Raised Button"),
            color: Colors.pink,
            onPressed: (){
              print("Rounded raised button pressed");
            },
          ),
          RaisedButton(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Text("Beveled Raised Button"),
            color: Colors.blue,
            onPressed: (){
              print("Beveled raised button pressed");
            },
          ),
          IconButton(
            color: Colors.deepPurple,
            iconSize: 40.0,
            icon: Icon(Icons.plus_one),
            onPressed: (){
              print("Icon button pressed");
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.dashboard),
            backgroundColor: Colors.indigoAccent,
            onPressed: (){
              print("floating action button 2 pressed");
            },
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: (){
          print("Floating action button pressed");
        },
      ),
    );
  }
}