import 'package:dio/dio.dart';

class NetErrorHelper {
  static String getNetErrorMessage(DioError e) {
    if (e.type == DioErrorType.connectTimeout) {
      return "网络连接超时，请稍后再试";
    } else if (e.type == DioErrorType.sendTimeout) {
      return "网络连接超时，请稍后再试";
    } else if (e.type == DioErrorType.receiveTimeout) {
      return "网络连接超时，请稍后再试";
    } else if (e.type == DioErrorType.response) {
      return "网络连接异常 code:${e.response!.statusCode}，请稍后再试";
    } else if (e.type == DioErrorType.cancel) {
      return "网络连接异常，请稍后再试";
    } else {
      return "网络连接异常，请稍后再试";
    }
  }
}
