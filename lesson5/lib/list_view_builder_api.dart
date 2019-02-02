import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:listview/item_details.dart';

class ListViewBuilderApi extends StatelessWidget {

  Future<List> getUsers() async {
    http.Response res = await http.get('https://jsonplaceholder.typicode.com/users');
    return  json.decode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView.builder()"),
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          if(!snapshot.hasData) return CircularProgressIndicator();
          List users = snapshot.data;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              var user = users[index];
              return ListTile(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(
                  builder: (_) => ItemDetails(user:user)
                )),
                isThreeLine: true,
                title: Text(user["name"]),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(user["email"]),
                    SizedBox(height: 5,),
                    Text(user["phone"])
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}