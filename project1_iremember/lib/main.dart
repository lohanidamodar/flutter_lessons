import 'package:flutter/material.dart';
import 'package:project1_iremember/ui/pages/login.dart';
import 'package:project1_iremember/ui/pages/signup.dart';
import './ui/pages/home.dart';

void main() => runApp(App4());

class App4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IRemember',
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: LoginPage(),
      routes: {
        "signup": (_) => SignupPage(),
        "home": (_) => HomePage(),
      },
    );
  }
}
