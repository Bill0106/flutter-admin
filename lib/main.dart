import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/global.dart';
import 'common/screen_args.dart';
import 'stores/user_store.dart';
import 'stores/game_store.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/games_screen.dart';
import 'screens/game_screen.dart';

void main() => Global.init().then((e) => runApp(Admin()));

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserStore userStore = UserStore();

    Global.initService(userStore.session);

    return MultiProvider(
      providers: [
        Provider<UserStore>(builder: (_) => userStore),
        Provider<GameStore>(builder: (_) => GameStore())
      ],
      child: MaterialApp(
        title: 'Admin',
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: userStore.session == null ? '/login' : '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => HomeScreen(),
          '/login': (context) => LoginScreen(),
          '/games': (context) => GamesScreen(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final ScreenArgs args = settings.arguments;

          if (settings.name == '/game') {
            return MaterialPageRoute(
              builder: (context) => GameScreen(id: args.id),
            );
          }

          return null;
        },
      ),
    );
  }
}
