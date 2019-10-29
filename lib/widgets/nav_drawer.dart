import 'package:flutter/material.dart';
import 'package:flutter_admin/stores/user_store.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  final menus = [
    {'title': 'Home', 'icon': Icons.home, 'path': '/'},
    {'title': 'Games', 'icon': Icons.gamepad, 'path': '/games'},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  buildHeader(context),
                  ...buildMenu(context),
                ],
              ),
            ),
            buildLogout(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: DrawerHeader(
        child: Text(
          'Admin',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  List<ListTile> buildMenu(BuildContext context) {
    var menuWidgets = menus.map(
      (item) => ListTile(
        title: Text(item['title']),
        leading: Icon(item['icon']),
        onTap: () {
          Navigator.popAndPushNamed(context, item['path']);
        },
      ),
    );

    return menuWidgets.toList();
  }

  Widget buildLogout(BuildContext context) {
    final UserStore store = Provider.of<UserStore>(context);

    return Container(
      padding: EdgeInsets.only(bottom: 32),
      child: Align(
        child: FlatButton.icon(
          icon: Icon(Icons.exit_to_app),
          label: Text('Logout'),
          onPressed: () {
            store.logout();
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/login',
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
    );
  }
}
