import 'package:flutter/material.dart';
import './signup.dart';
import './home.dart';

class LoginPage extends StatelessWidget {
  final String logo = "assets/logo.png";
  final String background = "assets/login_back.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background,),
            fit: BoxFit.cover
          )
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,),
              Image.asset(logo, height: 100,),
              SizedBox(height: 30.0,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email address",
                  prefixIcon: Icon(Icons.alternate_email),
                  fillColor: Colors.white54,
                  filled: true
                ),
              ),
              SizedBox(height: 20.0,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  prefixIcon: Icon(Icons.vpn_key),
                  fillColor: Colors.white54,
                  filled: true
                ),
              ),
              SizedBox(height: 20.0,),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (BuildContext context)=>HomePage()
                    ));
                  },
                  child: Text("Login", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  )),
                ),
              ),
              MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=>SignupPage()
                  ));
                },
                child: Text("Not a member yet? Create Account", style: TextStyle(
                  color: Colors.white
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}