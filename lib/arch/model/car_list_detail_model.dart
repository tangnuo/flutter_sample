import 'package:json_annotation/json_annotation.dart';

part 'car_list_detail_model.g.dart';

@JsonSerializable(nullable: true)
class CarListDetailModel {
  String? cphm; //号牌号码
  String? cllx; //车辆类型
  String? clzt; //车辆状态
  String? clbh;
  String? clmc;

  CarListDetailModel({this.cphm, this.cllx, this.clzt, this.clbh});

  //反序列化
  factory CarListDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CarListDetailModelFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$CarListDetailModelToJson(this);
}
