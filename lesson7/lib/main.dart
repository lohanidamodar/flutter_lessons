import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert dialog"),
          content: Text("This is a simple alert dialog to show different options."),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
      barrierDismissible: true
    );
  }


  _showSnackbar(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("This is a snackbar"),
      action: SnackBarAction(
        label: "Oh!",
        onPressed: (){},
        textColor: Colors.pink,
      ),
    ));
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbars and Dialogs"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          RaisedButton(
            child: Text("Show alert dialog"),
            onPressed: () => _showDialog(context),
          ),
          SizedBox(height: 20.0,),
          Builder(
            builder: (BuildContext context) => RaisedButton(
              child: Text("Snackbar"),
              onPressed: () => _showSnackbar(context),
            ),
          ),
          SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}