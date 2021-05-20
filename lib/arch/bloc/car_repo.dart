import 'package:dio/dio.dart';
import 'package:flutter_sample/arch/model/car_list_model.dart';
import 'package:flutter_sample/arch/model/dict_model.dart';
import 'package:flutter_sample/arch/net/base_http_response.dart';
import 'package:flutter_sample/arch/net/base_http_result.dart';
import 'package:flutter_sample/arch/net/http_apis.dart';
import 'package:flutter_sample/arch/net/http_manager.dart';

class CarRepo {
  Future<BaseHttpResult<List<DictModel>>>  getDictList(int typeNo,{int parentNo,bool fire}) async {

    Map<String, dynamic> queryParameters = {"typeNo": typeNo,"parentNo":parentNo,"fire": fire};
    queryParameters.removeWhere((key, value) => value == null);
    final Response<Map<String, dynamic>> _result  = await HttpManager.instance.dio.get(
      HttpApi.API_GET_CODEITEM_BY_TYPENO,
      queryParameters: queryParameters,
    );
    return new BaseHttpResult<List<DictModel>>().fromJson(_result.data);
  }

  Future<CarListModel> getCarList(Map<String, dynamic> _headers,Map<String, dynamic> queryParameters) async {

    final Response<Map<String, dynamic>> _result =
    await HttpManager.instance.dio.request(HttpApi.GET_CAR_LIST,
       options: RequestOptions(method: 'POST', headers: _headers),
        data: queryParameters);
       CarListModel carListModel = CarListModel.fromJson(
       BaseHttpResponse.fromJson(_result.data).result);
    return carListModel;

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
}