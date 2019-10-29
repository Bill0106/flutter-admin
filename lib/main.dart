import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/global.dart';
import 'stores/user_store.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() => Global.init().then((e) => runApp(Admin()));

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserStore userStore = UserStore();

    Global.initService(userStore.session);

    return MultiProvider(
      providers: [
        Provider<UserStore>(
          builder: (_) => userStore,
        )
      ],
      child: MaterialApp(
        title: 'Admin',
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: userStore.session == null ? '/login' : '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => HomeScreen(),
          '/login': (context) => LoginScreen(),
        },
      ),
    );
  }
}
