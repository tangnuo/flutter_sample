import 'package:json_annotation/json_annotation.dart';

part 'base_list_resp.g.dart';

@JsonSerializable(nullable: true)
class BaseListResp {
  String code;
  String message;
  int status;
  int timestamp;
  List<Map<String, dynamic>> result;

  //反序列化
  factory BaseListResp.fromJson(Map<String, dynamic> json) => _$BaseListRespFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$BaseListRespToJson(this);

  BaseListResp({this.code, this.result, this.message, this.status, this.timestamp});
}
