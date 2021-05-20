import 'package:shared_preferences/shared_preferences.dart';

class StringUtil {
  static bool isEmpty(String content) {
    return content == null || content.length == 0;
  }

  String getJwtToken() {
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  }
}
