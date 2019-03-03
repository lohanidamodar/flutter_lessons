import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lesson11/add.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];

  void initState() { 
    super.initState();
    getMovies();
  }

  getMovies() async {
    final sp = await SharedPreferences.getInstance();
    var moviesString = sp.getString('movies');
    if(moviesString == null) {
      print("movies does not exist");
      setState(() {
        movies = [
          {"title":"Dark Phoenix", "year":2019, "genre":"Action"},
          {"title":"Avengers: Beginning of the end", "year":2019, "genre":"Action, Sci-Fi"},
          {"title":"Pan", "year":2018, "genre":"Action Adventure"},
        ];
      });
      await saveMovies(movies);
    }else {
      setState(() {
        movies = json.decode(moviesString);
      });
    }
  }

  saveMovies(movies) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString('movies', json.encode(movies));
    print('saved to shared preferences');
    print(movies);
  }

  add(movie) {
    setState(() {
      movies.add(movie);
    });
    saveMovies(movies);
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