import 'package:dio/dio.dart';

enum BaseEventStatus { nothing, loading, success, failure, initLoading, initFailure }

/*
class BaseHttpRepo {
  factory BaseHttpRepo() => _getInstance();

  static BaseHttpRepo get instance => _getInstance();
  static BaseHttpRepo _instance;
  Dio dio;
  BaseOptions options;

  BaseHttpRepo._internal() {
    dio = Dio()
      ..options = BaseOptions(
          baseUrl: HttpApi.BASE_URL,
          connectTimeout: 10000,
          receiveTimeout: 1000 * 60 * 60 * 24,
          responseType: ResponseType.json,
          headers: {"Content-Type": "application/json"})
      //网络状态拦截
      ..interceptors.add(AuthInterceptor())
      ..interceptors.add(HttpLog())
      ..interceptors.add(ErrorInterceptor());
  }

  static BaseHttpRepo _getInstance() {
    if (_instance == null) {
      _instance = new BaseHttpRepo._internal();
    }
    return _instance;
  }
}*/

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    return super.onRequest(options);
  }
}

class HttpLog extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    print("\n ---------Start Http Request---------");
    print("Request_BaseUrl:${options.baseUrl}");
    print("Request_Path:${options.path}");
    print("Request_Method:${options.method}");
    print("Request_Headers:${options.headers}");
    print("Request_Data:${options.data}");
    print("Request_QueryParameters:${options.queryParameters}");
    print("---------End Http Request---------");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print("---------Start Http Response---------");
    print("Response_BaseUrl:${response.request.baseUrl}");
    print("Response_Path:${response.request.path}");
    print("Response_StatusCode:${response.statusCode}");
    print("Response_StatusMessage:${response.statusMessage}");
    print("Response_Headers:${response.headers.toString()}");
    print("Response_Body:${response.data.toString()}");
    print("---------End Http Response---------");
    return super.onResponse(response);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  onError(DioError error) async {
    print(error);
    //判读异常状态  401未登录过期或者未登录状态的异常
    if (error.response != null && error.response.statusCode == 401) {}
    super.onError(error);
  }

  Future<String> getToken() async {
    //获取当前的refreshToken，一般后台会在登录后附带一个刷新Token用的reToken
  }
}
