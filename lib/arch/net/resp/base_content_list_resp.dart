import 'package:json_annotation/json_annotation.dart';

part 'base_content_list_resp.g.dart';

@JsonSerializable(nullable: true)
class BaseContentListResp {
  List<Map<String, dynamic>> content;

  //反序列化
  factory BaseContentListResp.fromJson(Map<String, dynamic> json) => _$BaseContentListRespFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$BaseContentListRespToJson(this);

  BaseContentListResp({this.content});
}
