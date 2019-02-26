import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;

  _showOptionsDialog () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 180,
            child: Column(
              children: <Widget>[
                Container(color: Colors.grey.shade200,
                  child: ListTile(title: Text("Image picker option"),),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text("Pick from Gallery"),
                  onTap: (){
                     _getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Take a picture"),
                  onTap: (){
                    _getImage(ImageSource.camera);
                    Navigator.pop(context);
                  } 
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Future _getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source:source);
    if(image != null) {
      setState(() {
        _image = image;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 200
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: _image == null
                          ? new SizedBox()
                          : new Image.file(_image),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                padding: EdgeInsets.all(10.0),
                onPressed: _showOptionsDialog,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add_a_photo),
                    SizedBox(width: 10.0,),
                    Text("Add Image", style: TextStyle(fontSize: 18.0),),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}