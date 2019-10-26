import 'package:flutter/material.dart';
import 'common/global.dart';
import 'package:flutter_admin/services/auth_service.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() => Global.init().then((e) => runApp(Admin()));

class Admin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final session = AuthService.session;

    return MaterialApp(
      title: 'Admin',
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: session == null ? '/login' : '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
