import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: "Containers Demo",
  home: Home(),
));

class Home extends StatelessWidget {
  final TextStyle textStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.white
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Containers Demo"),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.blue,
            child: Center(child: Text("Container with blue background", style: textStyle,)),
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.pink.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            ),
            child: Center(child: Text("Container with linear gradient",style: textStyle,),),
          ),
          SizedBox(height: 10.0,),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.pink,
            child: Text("""
            As you can see below the container widget takes quite a few properties. But the most commonly used ones are the padding, color, decoration, width, height and of course the child.

              Container({
                Key key,
                this.alignment,
                this.padding,
                Color color,
                Decoration decoration,
                this.foregroundDecoration,
                double width,
                double height,
                BoxConstraints constraints,
                this.margin,
                this.transform,
                this.child,
              })

            """, style: textStyle,),
          )
        ],
      ),    );
  }
}