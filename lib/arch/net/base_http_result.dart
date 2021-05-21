import 'package:flutter_sample/generated/json/base/json_convert_content.dart';
import 'package:flutter_sample/generated/json/base_http_result_helper.dart';

class BaseHttpResult<T> with JsonConvert<BaseHttpResult> {
  String code;
  List<dynamic> fields;
  String message;
  var result;
  int status;
  int timestamp;

  T get resultT => JsonConvert.fromJsonAsT<T>(result)??result;

  @override
  BaseHttpResult fromJson(Map<String, dynamic> json) {
    return baseHttpResultFromJson(this, json);
  }

  @override
  Map<String, dynamic> toJson() {
    return baseHttpResultToJson(this);
  }
}

class BaseHttpResultResult with JsonConvert<BaseHttpResultResult> {
  String path;
}

