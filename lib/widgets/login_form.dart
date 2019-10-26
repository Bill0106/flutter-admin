import 'package:flutter/material.dart';
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
              // if (usernameCtrl.text == '' || passwordCtrl.text == '') {
              //   return;
              // }

              showLoading(context);
              Future(() {
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.pop(context);
                });
              });
            },
          ),
        ),
      ],
    );
  }

  showLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return LoadingDialog();
      },
    );
  }
}
