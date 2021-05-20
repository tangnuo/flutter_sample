import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_sample/arch/log/logger.dart';
import 'package:flutter_sample/arch/net/http_apis.dart';
import 'package:flutter_sample/arch/shared_preferences/user.dart';

import 'package:flutter_sample/arch/util/preference_util.dart';

import 'base_http_response.dart';
import 'http_logger.dart';

class HttpManager {
  factory HttpManager() => _getInstance();

  static HttpManager get instance => _getInstance();
  static HttpManager _instance;

  HttpManager._internal();

  Dio dio;

  static HttpManager _getInstance() {
    if (_instance == null) {
      _instance = HttpManager._internal();
      _instance._init();
    }
    return _instance;
  }

  void _init() {
    BaseOptions options = BaseOptions(
        baseUrl: HttpApi.BASE_URL,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000,
        responseType: ResponseType.json,
        headers: {"Content-Type": "application/json"});

    dio = Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      if (!options.path.contains(HttpApi.LOGIN_IN)) {
        options.headers['jwt-token'] = await PreferenceUtil.getJWTToken();
      }
      return options;
    }, onResponse: (response) {
      if (response.request.path.contains(HttpApi.GET_USER_INFO)) {
        User user =
            User.fromJson(BaseHttpResponse.fromJson(response.data).result);
        PreferenceUtil.setDictModel(jsonEncode(user).toString());
      }
    }));

    dio.interceptors.add(MyLogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        logPrint: (obj) {
          MyLogger.instance.info(obj);
        }));

    dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
  }
}
