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
      body: _buildBody(),
      drawer: Drawer(
        elevation: 5.0,
        child: _buildDrawer(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.note),
              SizedBox(width: 10.0,),
              Text("Welcome to Lesson 2",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          SizedBox(height: 20.0,),
          Text("Here we will learn to add sider drawer to our app"),
          SizedBox(height: 10.0,),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(text: "A "),
                TextSpan(text: "Drawer ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                TextSpan(text: "is a popular navigation techniques used on mobile applications. It is more suited for top level navigations. If you have more than four top level navigations, it is suggested to use "),
                TextSpan(text: "Drawer.", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ]
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20.0,),
          Text("Above I am showing how we can use RichText widget to show text with multiple styles."),
          SizedBox(height: 20.0,),
          Text("In this lesson I am also demonstrating how we can break down different tasks in a widget into multiple functions to make code more manageable."),
          SizedBox(height: 20.0,),
          Text("Using the button below, you can open the drawer navigation. It is here to demonstrate how to programmatically open drawer."),
          SizedBox(height: 10.0,),
          Builder(
            builder: (BuildContext context) => RaisedButton(
              color: Colors.green,
              child: Text("Open Drawer"),
              onPressed: () => Scaffold.of(context).openDrawer(),
            )
          ),
          
        ],
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