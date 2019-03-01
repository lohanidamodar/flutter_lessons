import 'package:flutter/material.dart';

class AddMovie extends StatefulWidget {
  final Function onSave;

  const AddMovie({Key key, this.onSave}) : super(key: key);

  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  String title;
  String genre;
  int year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add movie"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Movie title"
              ),
              onChanged: (value){
                setState(() {
                  title=value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Movie genre"
              ),
              onChanged: (value){
                setState(() {
                  genre=value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Movie release year"
              ),
              onChanged: (value){
                setState(() {
                  year = int.parse(value);
                });
              },
            ),
            SizedBox(height: 10.0,),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(10.0),
                color: Theme.of(context).primaryColor,
                child: Text("Save", style: Theme.of(context).primaryTextTheme.title,),
                onPressed: (){
                  if(title == null || genre == null || year == null)
                    return;
                  widget.onSave({
                    "title":title,
                    "genre": genre,
                    "year": year
                  });
                  Navigator.pop(context);
                },
              ),
            )
          ],  
        ),
      ),
      
    );
  }
}