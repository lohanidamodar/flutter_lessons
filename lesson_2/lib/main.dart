import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: "Lesson 2",
    theme: ThemeData(
      primarySwatch: Colors.green
    ),
    home: HomePage(),
  )
);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson 2"),
      ),
      body: Container(
        child: Center(
          child: Text("Home page"),
        ),
      ),
      
      drawer: Drawer(
        elevation: 5.0,
        child: _buildDrawer(),
      ),
    );
  }

  Widget _buildDrawer() {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.green
          ),
          child: Text("Welcome to Lesson 2"),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.restaurant_menu),
          title: Text("Menu"),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text("Favorites"),
          onTap: (){},
        ),
        Divider(),
        ListTile(
          onTap: (){},
          leading: Icon(Icons.person),
          title: Text("Profile"),
        ),
      ],
    );
  }
}