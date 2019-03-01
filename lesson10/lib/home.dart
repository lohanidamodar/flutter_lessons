import 'package:flutter/material.dart';
import 'package:lesson10/add.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [
    {"title":"Dark Phoenix", "year":2019, "genre":"Action"},
    {"title":"Avengers: Beginning of the end", "year":2019, "genre":"Action, Sci-Fi"},
    {"title":"Pan", "year":2018, "genre":"Action Adventure"},
  ];

  add(movie) {
    setState(() {
      movies.add(movie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (_) => AddMovie(onSave: add)
        )),
      ),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        var movie = movies[index];
        return ListTile(
          title: Text(movie['title']),
          subtitle: Text(movie['genre']),
          trailing: Text("${movie['year']}"),
        );
      },
    );
  }
}