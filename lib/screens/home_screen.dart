import 'package:flutter/material.dart';
import 'package:flutter_admin/widgets/nav_drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      drawer: NavDrawer(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: new EdgeInsets.fromLTRB(16, 200, 16, 16),
          child: Text(
            'Welcome to Admin Dashboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
