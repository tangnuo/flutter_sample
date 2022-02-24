import 'package:flutter_sample/arch/model/org_model.dart';

orgModelFromJson(OrgModel data, Map<String, dynamic> json) {
  if (json['bz'] != null) {
    data.bz = json['bz'].toString();
  }
  if (json['children'] != null) {
    data.children =
        (json['children'] as List).map((v) => OrgModel().fromJson(v)).toList();
  }
  if (json['dwlx'] != null) {
    data.dwlx = json['dwlx'].toString();
  }

  if (json['jdzh'] != null) {
    data.jdzh = json['jdzh'].toString();
  }
  if (json['jgCzhm'] != null) {
    data.jgCzhm = json['jgCzhm'].toString();
  }
  if (json['jgDzyx'] != null) {
    data.jgDzyx = json['jgDzyx'].toString();
  }
  if (json['jgYzbm'] != null) {
    data.jgYzbm = json['jgYzbm'].toString();
  }
  if (json['jgZzgy'] != null) {
    data.jgZzgy = json['jgZzgy'].toString();
  }
  if (json['jgbh'] != null) {
    data.jgbh = json['jgbh'].toString();
  }
  if (json['jgdz'] != null) {
    data.jgdz = json['jgdz'].toString();
  }
  if (json['jgjb'] != null) {
    data.jgjb = json['jgjb'] is String
        ? int.tryParse(json['jgjb'])
        : json['jgjb'].toInt();
  }
  if (json['jgjc'] != null) {
    data.jgjc = json['jgjc'].toString();
  }
  if (json['jgmc'] != null) {
    data.jgmc = json['jgmc'].toString();
  }
  if (json['jgnbbh'] != null) {
    data.jgnbbh = json['jgnbbh'].toString();
  }
  if (json['lsgx'] != null) {
    data.lsgx = json['lsgx'].toString();
  }
  if (json['lxdh'] != null) {
    data.lxdh = json['lxdh'].toString();
  }
  if (json['lxry'] != null) {
    data.lxry = json['lxry'].toString();
  }
  if (json['xzqhbh'] != null) {
    data.xzqhbh = json['xzqhbh'].toString();
  }
  if (json['xzqhmc'] != null) {
    data.xzqhmc = json['xzqhmc'].toString();
  }
  if (json['xzqhnbbm'] != null) {
    data.xzqhnbbm = json['xzqhnbbm'].toString();
  }
  if (json['zdbh'] != null) {
    data.zdbh = json['zdbh'].toString();
  }
  if (json['zdnbbh'] != null) {
    data.zdnbbh = json['zdnbbh'].toString();
  }
  if (json['next'] != null) {
    data.next = json['next'];
  }
  if (json['isSelect'] != null) {
    data.isSelect = json['isSelect'];
  }
  return data;
}

Map<String, dynamic> orgModelToJson(OrgModel entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['bz'] = entity.bz;
  data['children'] = entity.children?.map((v) => v!.toJson()).toList();
  data['dwlx'] = entity.dwlx;
  data['jdzh'] = entity.jdzh;
  data['jgCzhm'] = entity.jgCzhm;
  data['jgDzyx'] = entity.jgDzyx;
  data['jgYzbm'] = entity.jgYzbm;
  data['jgZzgy'] = entity.jgZzgy;
  data['jgbh'] = entity.jgbh;
  data['jgdz'] = entity.jgdz;
  data['jgjb'] = entity.jgjb;
  data['jgjc'] = entity.jgjc;
  data['jgmc'] = entity.jgmc;
  data['jgnbbh'] = entity.jgnbbh;
  data['lsgx'] = entity.lsgx;
  data['lxdh'] = entity.lxdh;
  data['lxry'] = entity.lxry;
  data['xzqhbh'] = entity.xzqhbh;
  data['xzqhmc'] = entity.xzqhmc;
  data['xzqhnbbm'] = entity.xzqhnbbm;
  data['zdbh'] = entity.zdbh;
  data['zdnbbh'] = entity.zdnbbh;
  data['next'] = entity.next;
  data['isSelect'] = entity.isSelect;
  return data;
}
