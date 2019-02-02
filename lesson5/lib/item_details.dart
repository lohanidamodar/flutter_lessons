import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final Map user;

  const ItemDetails({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user["name"]),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(user["name"], style: Theme.of(context).textTheme.display1,),
            Text(user['email']),
            SizedBox(height: 20.0,),
            Text( "Username: ${user['username']}"),
            SizedBox(height: 10.0,),
            Text( "Phone: ${user['phone']}"),
            SizedBox(height: 10.0,),
            Text( "Website: ${user['website']}"),
          ],
        ),
      ),
    );
  }
}