import 'package:flutter/material.dart';
import 'package:flutter_admin/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 160.0, bottom: 32.0),
              child: Text('Website Admin', style: TextStyle(fontSize: 24.0)),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
