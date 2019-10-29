import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_admin/common/global.dart';
import 'package:flutter_admin/common/constants.dart';
import 'package:flutter_admin/models/user.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  @observable
  bool isPosting = false;

  @computed
  String get session => Global.prefs.get(Constants.sessionKey);

  @action
  Future<void> login({String username, String password}) async {
    isPosting = true;
    try {
      var response = await Global.dio.post('/login', data: {
        'username': username,
        'password': password,
      });

      User user = User.fromJson(response.data);
      Global.prefs.setString(Constants.sessionKey, user.session);
      Global.initService(user.session);
    } on DioError catch (e) {
      throw (e.response == null ? e.response.statusMessage : 'Login Error');
    } finally {
      isPosting = false;
    }
  }

  @action
  void logout() {
    Global.prefs.remove(Constants.sessionKey);
  }
}
