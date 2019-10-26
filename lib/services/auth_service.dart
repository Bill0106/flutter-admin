import 'package:flutter_admin/common/global.dart';
import 'package:flutter_admin/common/constants.dart';
import 'package:flutter_admin/models/user.dart';

class AuthService {
  static String get session {
    return Global.prefs.getString(Constants.sessionKey);
  }

  Future login({String username, String password}) async {
    var response = await Global.dio.post('/login', data: {
      'username': username,
      'password': password,
    });

    User user = User.fromJson(response.data);
    Global.prefs.setString(Constants.sessionKey, user.session);
    Global.initService(user.session);
  }

  void logout() {
    Global.prefs.remove(Constants.sessionKey);
  }
}
