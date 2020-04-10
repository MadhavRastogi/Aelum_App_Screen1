import 'package:assignment1/Sign_up.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         title: 'Login',
         home: SignUp(),
    );
  }
}