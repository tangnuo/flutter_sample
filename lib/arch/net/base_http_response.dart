import 'package:json_annotation/json_annotation.dart';

part 'base_http_response.g.dart';

@JsonSerializable()
class BaseHttpResponse {
  String? code;
  Map? result;
  String? message;
  int? status;
  int? timestamp;

  //反序列化
  factory BaseHttpResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseHttpResponseFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$BaseHttpResponseToJson(this);

  BaseHttpResponse(
      {this.code, this.result, this.message, this.status, this.timestamp});
}
