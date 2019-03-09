import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import './add.dart';
import './detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [];

  void initState() {
    super.initState();
    getItems();
  }

  getItems() async {
    final sp = await SharedPreferences.getInstance();
    var itemString = sp.getString('items');
    if (itemString == null) {
      print("No Item found");
      setState(() {
        items = [];
      });
      await saveItems(items);
    } else {
      setState(() {
        items = json.decode(itemString);
      });
    }
  }

  saveItems(items) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString('items', json.encode(items));
    print("Saved Shared preference");
    print(items);
  }

  addItem1(String title, String description, File image) {
    setState(() {
      items.add({
        "title": title,
        "description": description,
        "img": image.path,
      });
      saveItems(items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: Icon(Icons.home),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return Column(
            children: <Widget>[
              ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => DetailPage(item: item, onDelete: _delete,))),
                isThreeLine: true,
                title: Text(item["title"]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: ()=>_delete(item),
                ),
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    File(item["img"]),
                  ),
                  radius: 34,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item["description"]),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              
              ),
              Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddPage(addItem1))),
        tooltip: "Add Item",
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.green[200],
    );
  }

  void _delete(Map item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete item"),
          content: Text("Are you sure you want to delete Item?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: ()=>Navigator.pop(context),
            ),
            FlatButton(
              child: Text("Delete"),
              onPressed: (){
                removeItem(item);
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (_) => HomePage()
                ));
                
              }
            )
          ],
        );
      }
    );
  }

  void removeItem(Map item) {
    setState(() { 
      items.remove(item);
    });
    saveItems(items);
  }

}
