import 'package:dio/dio.dart';

class NetErrorHelper {
  static String getNetErrorMessage(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      return "网络连接超时，请稍后再试";
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      return "网络连接超时，请稍后再试";
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      return "网络连接超时，请稍后再试";
    } else if (e.type == DioErrorType.RESPONSE) {
      return "网络连接异常 code:${e.response.statusCode}，请稍后再试";
    } else if (e.type == DioErrorType.CANCEL) {
      return "网络连接异常，请稍后再试";
    } else {
      return "网络连接异常，请稍后再试";
    }
  }
}
