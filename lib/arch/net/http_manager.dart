import 'package:dio/dio.dart';
import 'package:flutter_sample/arch/log/logger.dart';
import 'package:flutter_sample/arch/net/http_apis.dart';
import 'package:flutter_sample/arch/util/preference_util.dart';
import 'package:flutter_sample/arch/util/toast_util.dart';

import 'http_logger.dart';

class HttpManager {
  factory HttpManager() => _getInstance();

  static HttpManager get instance => _getInstance();
  static HttpManager? _instance;

  HttpManager._internal();

  late Dio dio;

  static HttpManager _getInstance() {
    if (_instance == null) {
      _instance = HttpManager._internal();
      _instance!._init();
    }
    return _instance!;
  }

  void _init() {
    BaseOptions options = BaseOptions(
        baseUrl: HttpApi.BASE_URL,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000,
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType);
    dio = Dio(options);
    dio.interceptors.add(DynamicTimeoutInterceptor());
    dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      if (!options.path.contains(HttpApi.LOGIN_IN)) {
        String? jwtToken = await PreferenceUtil.getJWTToken();
        if (jwtToken == null || jwtToken.isEmpty) {
          ToastUtil.showToast("invalid token");
          // MainRouter.logout();
          return handler.reject(DioError(requestOptions: options));
        }
        options.headers['jwt-token'] = jwtToken;
      }
      return handler.next(options);
    }, onResponse: (
      Response response,
      ResponseInterceptorHandler handler,
    ) {
      if (response.requestOptions.path.contains(HttpApi.GET_USER_INFO) &&
          response.data['result'] != null) {
        // UserInfoModel user = UserInfoModel.fromJson(
        //     BaseHttpResponse.fromJson(response.data).result
        //         as Map<String, dynamic>);
        // PreferenceUtil.setUserInfo(jsonEncode(user.toJson()));
      }
      if (response.data is Map &&
          (response.data['status'] == 10014 ||
              response.data['status'] == 10013 ||
              response.data['status'] == 10015)) {
        ToastUtil.showToast("${response.data["message"]}");
        // MainRouter.logout();
      }
      return handler.next(response);
    }, onError: (e, h) {
      MyLogger.instance.error("InterceptorsWrapper Error", e);
      return h.next(e);
    }));
    dio.interceptors.add(MyLogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        logPrint: (obj) {
          MyLogger.instance.info(obj as String);
        }));
  }
}

class DynamicTimeoutInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var dynamicTimeout = options.headers["dynamic-timeout"] as int?;
    if (dynamicTimeout != null) {
      options.connectTimeout = dynamicTimeout;
      options.sendTimeout = dynamicTimeout;
    }
    super.onRequest(options, handler);
  }
}
