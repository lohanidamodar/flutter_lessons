import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../resources/db_provider.dart';
import '../../models/item_model.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String title;
  String description;
  File _image;
  _showOptionsDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
                height: 190,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.blueGrey,
                      child: ListTile(
                        title: Text("Get Picture"),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.photo),
                      title: Text("Select from Gallery"),
                      onTap: () {
                        _getImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                    ),
                    Divider(),
                    ListTile(
                        leading: Icon(Icons.camera_alt),
                        title: Text("Take a picture"),
                        onTap: () {
                          _getImage(ImageSource.camera);
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
              backgroundColor: Colors.green[200]);
        });
  }

  Future _getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add item"),
       backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(height: 30.0,),
          _buildTitleField(),
          SizedBox(
            height: 20,
          ),
          _buildDescriptionField(),
          SizedBox(
            height: 20,
          ),

          _buildImgSelectButton(),
          SizedBox(
            height: 10,
          ),
          _buildImageField(),
          SizedBox(
            height: 20,
          ),
          _buildSaveButton(context)
        ],
      ),
    );
  }

  TextField _buildTitleField() {
    return TextField(
          onChanged: (value) {
            setState(() {
              title = value;
            });
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "title",
              prefixIcon: Icon(Icons.title)),
        );
  }

  TextField _buildDescriptionField() {
    return TextField(
          onChanged: (value) {
            setState(() {
              description = value;
            });
          },
          maxLines: 4,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Description",
          ),
        );
  }

  SizedBox _buildImgSelectButton() {
    return SizedBox(
          height: 50,
          width: double.infinity,
          child: RaisedButton.icon(
            icon: Icon(Icons.camera),
            label: Text("Add Image"),
            color: Colors.blue,
            onPressed: () => _showOptionsDialog(),
          ),
        );
  }

  SizedBox _buildImageField() {
    return SizedBox(
          child: _image == null
              ? Container()
              : Image.file(
                  _image,
                  height: 200,
                ),
        );
  }

  SizedBox _buildSaveButton(BuildContext context) {
    return SizedBox(
          height: 50,
          width: 20.0,
          child: RaisedButton.icon(
            icon: Icon(Icons.save),
            label: Text("Save"),
            color: Colors.blue,
            onPressed: () async {
              if (title == null || description == null || _image == null) {
                return;
              }
              ItemModel item =ItemModel(title: title,description: description,image: _image.path);
              await DbProvider().addItem(item);
              Navigator.pop(context);
            },
          ),
        );
  }
}
