import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      title: "Simple Stateful Widget",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "";
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Widget Example"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0,),
        child: Column(
          children: <Widget>[
            Text("Text you typed: $text", style: Theme.of(context).textTheme.display1.merge(TextStyle(fontSize: 18.0)),),
            SizedBox(height: 10,),
            showProgress ? CircularProgressIndicator(backgroundColor: Colors.red,):Container(height: 0,),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Type anything here"
              ),
              onChanged: (value){
                setState(() {
                  text=value;
                });
              },
            ),
            RaisedButton(
              color: Colors.indigoAccent,
              child: Text("Toggle Progress", style: TextStyle(color: Colors.white),),
              onPressed: (){
                setState(() {
                  showProgress = !showProgress;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}