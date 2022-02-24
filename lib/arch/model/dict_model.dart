import 'package:flutter_sample/generated/json/base/json_convert_content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dict_model.g.dart';

@JsonSerializable()
class DictModel with JsonConvert<DictModel> {
  String? codeItemName;
  String? codeTypeNo;
  int? id;
  String? no;
  int? sort;
  String? codeItemValue;

  //反序列化
  factory DictModel.fromJson(Map<String, dynamic> json) =>
      _$DictModelFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$DictModelToJson(this);

  DictModel({this.codeItemName, this.codeTypeNo, this.id, this.no, this.sort});

  @override
  String toString() {
    return "$codeItemName";
  }

  @override
  bool operator ==(Object other) {
    if (other is DictModel) {
      return other.no == this.no;
    }
    return false;
  }
}
