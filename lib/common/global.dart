import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class Global {
  static SharedPreferences prefs;
  static Dio dio;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static initService(String session) {
    final BaseOptions options = BaseOptions(
      baseUrl: 'http://localhost:9999',
      headers: {'x-token': session},
    );

    dio = new Dio(options);
  }
}
