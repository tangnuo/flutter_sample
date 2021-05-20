import 'package:json_annotation/json_annotation.dart';

part 'base_page_list.g.dart';

@JsonSerializable(nullable: true)
class BasePageList {
  String code;
  String message;
  int status;
  int timestamp;
  BasePageList result;

  //反序列化
  factory BasePageList.fromJson(Map<String, dynamic> json) => _$BasePageListFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$BasePageListToJson(this);

  BasePageList({this.code, this.message, this.status, this.timestamp, this.result});
}
