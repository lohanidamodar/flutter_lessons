import 'package:flutter/material.dart';
import 'dart:io';
import '../../models/item_model.dart';

class DetailPage extends StatelessWidget {
  final ItemModel item;
  final Function onDelete;
  const DetailPage({Key key, this.item, this.onDelete}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(item.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete),
          onPressed: ()=>onDelete(item),)
        ],
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DecoratedBox(
              child: Container(height: 400,width:400,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(item.image),)
                )
              ),
            ),
            Text(item.title, style: Theme.of(context).textTheme.display1,),
            SizedBox(height: 20.0,),
            Text(item.description),
            SizedBox(height: 20.0,),
            
          ],
        ),
      ),
    ); 
  }
  
}