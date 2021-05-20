


import 'package:dio/dio.dart';
import 'package:flutter_sample/arch/model/car_list_detail_model.dart';
import 'package:flutter_sample/arch/model/car_list_model.dart';
import 'package:flutter_sample/arch/model/dict_model.dart';
import 'package:flutter_sample/arch/net/base_http_response.dart';
import 'package:flutter_sample/arch/net/base_http_result.dart';
import 'package:flutter_sample/arch/net/http_apis.dart';
import 'package:flutter_sample/arch/net/http_manager.dart';



class CarRepo {

  getTestCarList() => CarListModel()
      ..content = [
        CarListDetailModel()
          ..cphm = "苏E123456"
          ..cllx = "家用汽车"
          ..clzt = "正常"
          ..clbh = "1",
        CarListDetailModel()
          ..cphm = "苏E234567"
          ..cllx = "灭活消防车"
          ..clzt = "待命"
          ..clbh = "2",
        CarListDetailModel()
          ..cphm = "苏E345678"
          ..cllx = "半挂货车"
          ..clzt = "正常"
          ..clbh = "3",
        CarListDetailModel()
          ..cphm = "苏E456789"
          ..cllx = "客车"
          ..clzt = "正常"
          ..clbh = "4",
    ]
    ..first = true
    ..last = true
    ..number = 0
    ..numberOfElements = 4
    ..size = 4
    ..totalElements = 4
    ..totalPages = 1;


  getTestFunctionTypeDict() => [
    DictModel()..codeTypeNo = "gnlb1"..codeItemName = "功能类别1",
    DictModel()..codeTypeNo = "gnlb2"..codeItemName = "功能类别2",
    DictModel()..codeTypeNo = "gnlb3"..codeItemName = "功能类别3",
    DictModel()..codeTypeNo = "gnlb4"..codeItemName = "功能类别4",
  ];

  getTestCarTypeDict() => [
    DictModel()..codeTypeNo = "cx1"..codeItemName = "汽车类型1",
    DictModel()..codeTypeNo = "cx2"..codeItemName = "汽车类型2",
    DictModel()..codeTypeNo = "cx3"..codeItemName = "汽车类型3",
    DictModel()..codeTypeNo = "cx4"..codeItemName = "汽车类型4",
  ];

  getTestOperationalFunctionDict() => [
    DictModel()..codeTypeNo = "zzgn1"..codeItemName = "作战功能1",
    DictModel()..codeTypeNo = "zzgn2"..codeItemName = "作战功能2",
    DictModel()..codeTypeNo = "zzgn3"..codeItemName = "作战功能3",
    DictModel()..codeTypeNo = "zzgn4"..codeItemName = "作战功能4",
  ];

  getTestCarLevelDict() => [
    DictModel()..codeTypeNo = "cldj1"..codeItemName = "车辆等级1",
    DictModel()..codeTypeNo = "cldj2"..codeItemName = "车辆等级2",
    DictModel()..codeTypeNo = "cldj3"..codeItemName = "车辆等级3",
    DictModel()..codeTypeNo = "cldj4"..codeItemName = "车辆等级4",
  ];

  getTestCarStatusDict() => [
    DictModel()..codeTypeNo = "zc"..codeItemName = "正常",
    DictModel()..codeTypeNo = "dm"..codeItemName = "待命",
    DictModel()..codeTypeNo = "cz"..codeItemName = "超载",
    DictModel()..codeTypeNo = "ty"..codeItemName = "停运",
  ];

  getTestDutyStatusDict() => [
    DictModel()..codeTypeNo = "qwzt1"..codeItemName = "勤务状态1",
    DictModel()..codeTypeNo = "qwzt2"..codeItemName = "勤务状态2",
    DictModel()..codeTypeNo = "qwzt3"..codeItemName = "勤务状态3",
    DictModel()..codeTypeNo = "qwzt4"..codeItemName = "勤务状态4",
  ];

  getTestInstitutionDict() => [
    DictModel()..codeTypeNo = "szjg1"..codeItemName = "所在机构1",
    DictModel()..codeTypeNo = "szjg2"..codeItemName = "所在机构2",
    DictModel()..codeTypeNo = "szjg3"..codeItemName = "所在机构3",
    DictModel()..codeTypeNo = "szjg4"..codeItemName = "所在机构4",
  ];

  getTestCarColorDict() => [
    DictModel()..codeTypeNo = "white"..codeItemName = "白色",
    DictModel()..codeTypeNo = "grey"..codeItemName = "灰色",
    DictModel()..codeTypeNo = "red"..codeItemName = "红色",
    DictModel()..codeTypeNo = "black"..codeItemName = "黑色",
  ];
  getTestZblxDict() => [
    DictModel()..codeTypeNo = "zblx1"..codeItemName = "装备类型1",
    DictModel()..codeTypeNo = "zblx2"..codeItemName = "装备类型2",
    DictModel()..codeTypeNo = "zblx3"..codeItemName = "装备类型3",
    DictModel()..codeTypeNo = "zblx4"..codeItemName = "装备类型4",
  ];
  getTestFzrDict() => [
    DictModel()..codeTypeNo = "fzr1"..codeItemName = "负责人1",
    DictModel()..codeTypeNo = "fzr2"..codeItemName = "负责人2",
    DictModel()..codeTypeNo = "fzr3"..codeItemName = "负责人3",
    DictModel()..codeTypeNo = "fzr4"..codeItemName = "负责人4",
  ];
  getTestZsDict() => [
    DictModel()..codeTypeNo = "zs1"..codeItemName = "1",
    DictModel()..codeTypeNo = "zs2"..codeItemName = "2",
    DictModel()..codeTypeNo = "zs3"..codeItemName = "3",
    DictModel()..codeTypeNo = "zs4"..codeItemName = "4",
  ];
  getTestPfbzDict() => [
    DictModel()..codeTypeNo = "g5"..codeItemName = "国五",
    DictModel()..codeTypeNo = "g6"..codeItemName = "国六",
  ];
  getTestZbmcDict() => [
    DictModel()..codeTypeNo = "zbmc1"..codeItemName = "装备名称1",
    DictModel()..codeTypeNo = "zbmc2"..codeItemName = "装备名称2",
    DictModel()..codeTypeNo = "zbmc3"..codeItemName = "装备名称3",
    DictModel()..codeTypeNo = "zbmc4"..codeItemName = "装备名称4",
  ];

  getTestCarSczbList() => [
    // CarDetailSczbModel()..zbmc="名称1"..zblx="类型1"..zbsl="5",
    // CarDetailSczbModel()..zbmc="名称2"..zblx="类型2"..zbsl="2",
    // CarDetailSczbModel()..zbmc="名称3"..zblx="类型3"..zbsl="3",
  ];

  // getTestCarDetail() => CarDetailInfoModel()..sczb = getTestCarSczbList()..cphm="苏E123456"..sccj="大众";

  Future<BaseHttpResult<List<DictModel>>>  getDictList(int typeNo,{int parentNo,bool fire}) async {

    Map<String, dynamic> queryParameters = {"typeNo": typeNo,"parentNo":parentNo,"fire": fire};
    queryParameters.removeWhere((key, value) => value == null);
    final Response<Map<String, dynamic>> _result  = await HttpManager.instance.dio.get(
      HttpApi.API_GET_CODEITEM_BY_TYPENO,
      queryParameters: queryParameters,
    );
    return new BaseHttpResult<List<DictModel>>().fromJson(_result.data);

  }

  Future<List<DictModel>> getDictModel(int typeNo,{int parentNo,bool fire}) async {
    BaseHttpResult<List<DictModel>> baseHttpResult1 =
    await CarRepo().getDictList(typeNo,parentNo: parentNo,fire:fire == null ? false:fire);
    List<DictModel> modelList = baseHttpResult1.resultT;
    return modelList;
  }


  // Future<CarDetailInfoModel> getCarDetail(String id) async {
  //
  //   Map<String, dynamic> queryParameters = {"clbh": id};
  //   queryParameters.removeWhere((key, value) => value == null);
  //   final Response<Map<String, dynamic>> _result  = await HttpManager.instance.dio.get(
  //     HttpApi.GET_CAR_DETAIL,
  //     queryParameters: queryParameters,
  //   );
  //   CarDetailInfoModel detailModel = CarDetailInfoModel.fromJson(BaseHttpResponse.fromJson(_result.data).result);
  //   return detailModel;
  //
  // }

  Future<CarListModel> getCarList(Map<String, dynamic> _headers,Map<String, dynamic> queryParameters) async {

    final Response<Map<String, dynamic>> _result =
    await HttpManager.instance.dio.request(HttpApi.GET_CAR_LIST,
       options: RequestOptions(method: 'POST', headers: _headers),
        data: queryParameters);
       CarListModel carListModel = CarListModel.fromJson(
       BaseHttpResponse.fromJson(_result.data).result);
    return carListModel;

  }

  DictModel getDicModeByCode(List<DictModel> modelList, String code) {
    if (modelList == null || (code == null || code == "")) {
      return null;
    }
    for (int i=0; i < modelList.length; i++) {
      DictModel v = modelList[i];
      if (code == v.codeTypeNo) {
        return v;
      }
    }
    return null;
  }

  DictModel getDicModeByName(List<DictModel> modelList, String name) {
    if (modelList == null || (name == null || name == "")) {
      return null;
    }
    for (int i=0; i < modelList.length; i++) {
      DictModel v = modelList[i];
      if (name == v.codeItemName) {
        return v;
      }
    }
    return null;
  }



  int getSelectedDict(List<DictModel> modelList, String name) {
    for (int i=0; i < modelList.length; i++) {
      DictModel v = modelList[i];
      if (v.codeItemName == name) {
        return i;
      }
    }
    return 0;
  }

  Future<BaseHttpResult<bool>> updateCarStatus(String clbh, String carStatus) async {
    final _headers = <String, dynamic>{};
    Map<String, dynamic> queryParameters = {'clbh': clbh,'clztid':carStatus};
    // final queryParameters = <String, dynamic>{'clbh': clbh,'clzt':carStatus};
    final Response<Map<String, dynamic>> _result =
    await HttpManager.instance.dio.request(HttpApi.UPDATE_CAR_STATUS,
        options: RequestOptions(method: 'POST', headers: _headers),
        data: queryParameters);
    final value  = new BaseHttpResult<bool>().fromJson(_result.data);
    // BaseHttpResult<bool> baseHttpResult  = new BaseHttpResult<bool>().fromJson(_result.data);
    // final value = baseHttpResult.result;
    return value;
  }

  Future<BaseHttpResult<bool>> deleteCar(String clbh) async {
    List<String> ids = [clbh];
    final _headers = <String, dynamic>{};
    Map<String, dynamic> queryParameters = {'ids': ids};
    // final queryParameters = <String, dynamic>{'clbh': clbh,'clzt':carStatus};
    final Response<Map<String, dynamic>> _result =
    await HttpManager.instance.dio.request(HttpApi.DELETE_CAR,
        options: RequestOptions(method: 'POST', headers: _headers),
        data: ids);
    final value  = new BaseHttpResult<bool>().fromJson(_result.data);
    // BaseHttpResult<bool> baseHttpResult  = new BaseHttpResult<bool>().fromJson(_result.data);
    // final value = baseHttpResult.result;
    return value;
  }

  //
  // Future<BaseHttpResult<bool>> addOrUpdateCar(CarDetailAddModel detail) async {
  //   final _headers = <String, dynamic>{};
  //   Map<String, dynamic> queryParameters = detail.toJson();
  //   final Response<Map<String, dynamic>> _result =
  //   await HttpManager.instance.dio.request(HttpApi.ADD_OR_UPDATE_CAR,
  //       options: RequestOptions(method: 'POST', headers: _headers),
  //       data: queryParameters);
  //   final value  = new BaseHttpResult<bool>().fromJson(_result.data);
  //   // BaseHttpResult<bool> baseHttpResult  = new BaseHttpResult<bool>().fromJson(_result.data);
  //   // final value = baseHttpResult.result;
  //   return value;
  // }

}