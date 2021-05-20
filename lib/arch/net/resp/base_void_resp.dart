import 'package:json_annotation/json_annotation.dart';

part 'base_void_resp.g.dart';

@JsonSerializable(nullable: true)
class BaseVoidResp {
  String code;
  String message;
  int status;
  int timestamp;

  //反序列化
  factory BaseVoidResp.fromJson(Map<String, dynamic> json) => _$BaseVoidRespFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$BaseVoidRespToJson(this);

  BaseVoidResp({this.code, this.message, this.status, this.timestamp});
}
