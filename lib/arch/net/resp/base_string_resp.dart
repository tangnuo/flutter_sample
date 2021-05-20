import 'package:json_annotation/json_annotation.dart';

part 'base_string_resp.g.dart';

@JsonSerializable(nullable: true)
class BaseStringResp {
  String code;
  String result;
  String message;
  int status;
  int timestamp;

  //反序列化
  factory BaseStringResp.fromJson(Map<String, dynamic> json) => _$BaseStringRespFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$BaseStringRespToJson(this);

  BaseStringResp({this.code, this.result, this.message, this.status, this.timestamp});
}
