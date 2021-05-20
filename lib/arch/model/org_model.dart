import 'package:flutter_sample/arch/json/base/json_convert_content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'org_model.g.dart';

@JsonSerializable(nullable: true)
class OrgModel with JsonConvert<OrgModel>{
  String bz;

  List<OrgModel> children;

  String dwlx;

  String id;

  String jdzh;

  String jgCzhm;

  String jgDzyx;

  String jgYzbm;

  String jgZzgy;

  String jgbh;

  String jgdz;

  int jgjb;

  String jgjc;

  String jgmc;

  String jgnbbh;

  String lsgx;

  String lxdh;

  String lxry;

  String xzqhbh;

  String xzqhmc;

  String xzqhnbbm;

  String zdbh;

  String zdnbbh;

  bool next;

  bool isSelect;



  factory OrgModel.fromJson(Map<String, dynamic> json) =>
      _$OrgModelFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$OrgModelToJson(this);

  OrgModel(
      {this.bz,
      this.children,
      this.dwlx,
      this.id,
      this.jdzh,
      this.jgCzhm,
      this.jgDzyx,
      this.jgYzbm,
      this.jgZzgy,
      this.jgbh,
      this.jgdz,
      this.jgjb,
      this.jgjc,
      this.jgmc,
      this.jgnbbh,
      this.lsgx,
      this.lxdh,
      this.lxry,
      this.xzqhbh,
      this.xzqhmc,
      this.xzqhnbbm,
      this.zdbh,
      this.zdnbbh,
      this.next,
      this.isSelect});

  @override
  bool operator ==(Object other) {
    if(other!=null&& other is OrgModel){
      return other.jgbh == this.jgbh;
    }
    return false;
  }

  @override
  String toString() {

    return "{jgbh:$jgbh,jgjc: $jgjc }";
  }
}
