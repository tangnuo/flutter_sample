import 'package:json_annotation/json_annotation.dart';

part 'base_map_resp.g.dart';

@JsonSerializable(nullable: true)
class BaseMapResp {
  Map result;
  String message;
  int status;
  int timestamp;

  //反序列化
  factory BaseMapResp.fromJson(Map<String, dynamic> json) => _$BaseMapRespFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$BaseMapRespToJson(this);

  BaseMapResp({this.result, this.message, this.status, this.timestamp});
}
