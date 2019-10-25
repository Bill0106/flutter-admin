import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(Admin());

class Admin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin',
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => Home(),
      },
    );
  }
}
