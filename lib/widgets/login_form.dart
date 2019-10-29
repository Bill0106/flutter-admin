import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_admin/stores/user_store.dart';
import 'package:flutter_admin/widgets/loading_dialog.dart';

class LoginForm extends StatelessWidget {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: usernameCtrl,
          decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, bottom: 32.0),
          child: TextField(
            controller: passwordCtrl,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 18.0),
            ),
            onPressed: () {
              handleLogin(context);
            },
          ),
        ),
      ],
    );
  }

  Future<void> handleLogin(BuildContext context) async {
    if (usernameCtrl.text == '' || passwordCtrl.text == '') {
      return;
    }

    final store = Provider.of<UserStore>(context);

    showDialog(context: context, builder: (context) => LoadingDialog());
    try {
      await store.login(
        username: usernameCtrl.text,
        password: passwordCtrl.text,
      );
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      Navigator.pop(context);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.highlight_off,
                  color: Colors.red,
                ),
              ),
              Text(
                e.toString(),
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
        ),
      );
    }
  }
}
