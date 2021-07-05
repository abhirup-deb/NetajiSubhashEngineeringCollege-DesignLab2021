import 'package:design_lab/screens/Sign_in.dart';
import 'package:flutter/material.dart';
import 'package:design_lab/screens/Blog.dart';
import 'package:design_lab/screens/Dashboard.dart';
import 'package:design_lab/screens/call.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: Sign_in.id,
      routes: {
        Sign_in.id: (context) => Sign_in(),
        Blog.id: (context) => Blog(name: ''),
        Dashboard.id: (context) => Dashboard(name: '', title: '', body: ''),
        CallPage.id: (context) => CallPage()
      },
    );
  }
}
