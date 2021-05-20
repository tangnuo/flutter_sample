import 'dart:convert';

import 'package:flutter_sample/arch/model/dict_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {
  static const TokenKey = 'jwt_token';

  static const Dict_Model = 'Dict_Model';

  static const UserNamekey = 'user_name';

  static const Passwordkey = 'password';

  static const RememberPasswordkey = 'remember_password';

  static const AutoLoginKey = 'auto_login';

  static const FirstLoginFlag = 'first_login_flag';

  static Future<void> setJWTToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(TokenKey, token);
  }

  static Future<String> getJWTToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString(TokenKey);
    return token;
  }

  static Future<void> setDictModel(String dictModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Dict_Model, dictModel);
  }

  static Future<DictModel> getDictModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    DictModel model = DictModel.fromJson(jsonDecode(preferences.getString(Dict_Model)));
    return model;
  }

  static Future<void> setUserName(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(UserNamekey, username);
  }

  static Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String username = preferences.getString(UserNamekey);
    return username;
  }

  static Future<void> setPassword(String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Passwordkey, password);
  }

  static Future<String> getPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String password = preferences.getString(Passwordkey);
    return password;
  }

  static Future<void> setRememberPassword(bool rememberPassword) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(RememberPasswordkey, rememberPassword);
  }

  static Future<bool> getRememberPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool rememberPassword = preferences.getBool(RememberPasswordkey);
    return rememberPassword;
  }

  static Future<void> setAutoLogin(bool autoLogin) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(AutoLoginKey, autoLogin);

  }

  static Future<bool> getAutoLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool autoLogin = preferences.getBool(AutoLoginKey);
    return autoLogin;
  }

  static Future<void> setFirstLoginFlag(bool firstLoginFlag) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(FirstLoginFlag, firstLoginFlag);
  }

  static Future<bool> getFirstLoginFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool firstLoginFlag = preferences.getBool(FirstLoginFlag);
    return firstLoginFlag ?? true;
  }

  // static Future<void> setFileSourceUrl(String url) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString("FileSourceUrl", url);
  // }
  //
  // static Future<String> getFileSourceUrl() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String password = preferences.getString("FileSourceUrl");
  //   return password;
  // }
  //
  // static Future<void> setFileTargetUrl(String url) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString("FileTargetUrl", url);
  // }
  //
  // static Future<String> getFileTargetUrl() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String password = preferences.getString("FileTargetUrl");
  //   return password;
  // }
}
