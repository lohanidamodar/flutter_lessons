import 'package:flutter/material.dart';

class Activities extends StatelessWidget {
  final List<String> activities;
  final Function delete;
  final Function add;

  const Activities({Key key, this.activities, this.delete, this.add}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Activities"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (_,int i){
                  return ListTile(
                    title: Text(activities[i]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        Navigator.pop(context);
                        delete(activities[i]);
                      },
                    ),
                  );
                },
              ),
            ),
            ListTile(
              title: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "new activity"
                  ),
                ),
              trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pop(context);
                    add(_controller.text);
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}