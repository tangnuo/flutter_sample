import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/arch/bloc/car_repo.dart';
import 'package:flutter_sample/arch/common/Colors.dart';
import 'package:flutter_sample/arch/common/image_helper.dart';
import 'package:flutter_sample/arch/common/net_error_helper.dart';
import 'package:flutter_sample/arch/model/car_list_detail_model.dart';
import 'package:flutter_sample/arch/model/car_list_model.dart';
import 'package:flutter_sample/arch/model/car_search_filter_model.dart';
import 'package:flutter_sample/arch/model/dict_model.dart';
import 'package:flutter_sample/arch/net/base_http_response.dart';
import 'package:flutter_sample/arch/net/base_http_result.dart';
import 'package:flutter_sample/arch/net/http_apis.dart';
import 'package:flutter_sample/arch/net/http_manager.dart';
import 'package:flutter_sample/arch/ui/dialog/simple_list_dialog.dart';
import 'package:flutter_sample/arch/util/event_fn.dart';
import 'package:flutter_sample/arch/util/toast_util.dart';

class CarListPage extends StatefulWidget {
  CarListPage();

  // final UserInfoModel userInfo;

  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  List<CarListDetailModel> list = new List<CarListDetailModel>();
  List<DictModel> carStatusList = new List<DictModel>();
  ScrollController listScrollController = ScrollController();
  StreamSubscription eventBusFn;
  int page = 0;
  bool isLoading = false;
  bool noData = false;
  int totalPage = 0;
  CarSearchFilterModel _carSearchFilterModel = CarSearchFilterModel();
  // final ButtonStyle _buttonStyle = ButtonStyle(
  //   textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)),
  //   padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 9)),
  //   foregroundColor: MaterialStateProperty.all(Colors.black),
  //   backgroundColor: MaterialStateProperty.all(Colors.white),
  //   shape: MaterialStateProperty.all(
  //     StadiumBorder(
  //       side:
  //           BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid),
  //     ),
  //   ),
  // );

  @override
  void initState() {
    super.initState();
    eventBusFn = eventBus.on<CarEventFn>().listen((event) {
      Future.delayed(Duration(milliseconds: 1000), () {
        getinitData();
      });
    });
    getinitData();
    getRealUrl();//可以注释掉
    listScrollController.addListener(() {
      if (listScrollController.position.pixels ==
          listScrollController.position.maxScrollExtent) {
        print('到达底部了');
        getMoreData();
      }
    });
  }

  @override
  void dispose() {
    listScrollController.dispose();
    eventBusFn.cancel();
    super.dispose();
  }

  ///初始化数据
  Future getinitData() async {
    print('初始化数据');
    page = 0;
    carStatusList = await getDictModel(20099);
    getCarList(page)
        .then((value) => {
              setState(() {
                list = value.content;
                totalPage = value.totalPages;
                if (page + 1 >= totalPage) noData = true;
              }),
            })
        .catchError((error) {
      print('error = $error');
    });
  }

  /// 下拉刷新
  Future<Null> listRefresh() async {
    print('刷新数据');
    page = 0;
    noData = false;
    getCarList(page).then((value) => {
          setState(() {
            list = value.content;
            totalPage = value.totalPages;
            if (page + 1 >= totalPage) noData = true;
          }),
        });
  }

  ///上拉加载
  Future getMoreData() async {
    if (!isLoading) {
      page++;
      isLoading = true;
      getCarList(page).then((value) => {
            setState(() {
              isLoading = false;
              list..addAll(value.content);
              totalPage = value.totalPages;
              if (page + 1 >= totalPage) noData = true;
            }),
          });
      print('加载更多数据');
    }
  }

  ///加载
  Future getRealUrl() async {
    try {
      Response response =
          await HttpManager.instance.dio.get(HttpApi.GET_URL_TRANSFORM,
              options: Options(headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }));
      BaseHttpResponse resp = BaseHttpResponse.fromJson(response.data);
      if (resp.status == 200) {
        String source = resp.result["source"];
        String target = resp.result["target"];

        // Constant.TARGET_URL = target;
      }
    } catch (e) {
      ToastUtil.showToast(NetErrorHelper.getNetErrorMessage(e));
    }
  }

  Future<List<DictModel>> getDictModel(int typeNo) async {
    BaseHttpResult<List<DictModel>> baseHttpResult1 = await CarRepo()
        .getDictList(typeNo, parentNo: typeNo == 20026 ? 0 : null);
    List<DictModel> modelList1 = baseHttpResult1.resultT;

    return modelList1;
  }

  /// AppBar
  AppBar buildBar() {
    return AppBar(
      toolbarHeight: 71,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        "车辆信息",
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),
      ),
      centerTitle: true,
      leading: Container(
        margin: EdgeInsets.only(left: 12),
        width: 32,
        height: 32,
        child: IconButton(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(0),
          iconSize: 28,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: ImageIcon(
              AssetImage(ImageHelper.wrapAssets("ic_back_white.png"))),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        filterHeader(),
      ],
    );
  }

  Widget buildBody() {
    return Container(
        margin: EdgeInsets.only(left: 11, right: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Container(
              height: 0,
            );
          },
          itemCount: list.length + 1,
          // itemBuilder: (context, index) =>
          //     _buildItem(context, index),
          itemBuilder: renderRow,
          controller: listScrollController,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF3F3F3),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 175,
            child: Image(
              image: AssetImage(
                ImageHelper.wrapAssets('bg_user_center_bar.png'),
              ),
              fit: BoxFit.cover,
            ),
          ),
          RefreshIndicator(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: buildBar(),
                body: buildBody(),
              ),
              onRefresh: listRefresh),
          Align(
            child: GestureDetector(
              // onTap: () => _openEditPage(context),
              child:
                  Image.asset(ImageHelper.wrapAssets("ic_person_info_add.png")),
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }

  Widget renderRow(BuildContext context, int index) {
    if (index < list.length) {
      CarListDetailModel carListDetailModel = list[index];

      return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: index == 0
                  ? BorderRadius.all(Radius.circular(8.0))
                  : BorderRadius.all(Radius.circular(0.0))),
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 14, left: 19),
              child: Row(
                children: [
                  Image.asset(
                    ImageHelper.wrapAssets("car.png"),
                    width: 16,
                    height: 12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      carListDetailModel.cphm,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 13),
                      child: TextButton(
                          child: Row(
                            children: [
                              Text(carListDetailModel.clzt,
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF333333))),
                              Image.asset(
                                ImageHelper.wrapAssets("juxing.png"),
                                width: 16,
                                height: 16,
                              )
                            ],
                          ),
                          onPressed: () => {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      int initSelected = CarRepo()
                                          .getSelectedDict(carStatusList,
                                              carListDetailModel.clzt);
                                      return SimpleListDialog(
                                          "请选择车辆状态", carStatusList,
                                          initSelected: initSelected);
                                    }).then((value) {
                                  if (value != null && value > -1) {
                                    // _updateCarStatus(carListDetailModel,carStatusList,value);

                                    print("方法注释了：" + value);
                                  }
                                })
                              },
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 14, color: Color(0xFF333333))),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 12)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFF3F5FC)),
                            side: MaterialStateProperty.all(BorderSide(
                                color: Color(0xFFFFF4F6FD), width: 1)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(11))),
                            ),
                          )))
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 19),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageHelper.wrapAssets("car.png"),
                        width: 16,
                        height: 16,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new Text(
                        carListDetailModel.cllx ?? "",
                        style: TextStyle(
                            fontSize: 16, color: CustomColors.cl_666666),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 010),
              child: Divider(
                height: 1,
                color: Color(0xFFECECEC),
                indent: 20,
                endIndent: 20,
              ),
            ),
          ]),
        ),
        // onTap: () => _listItemClick(carListDetailModel),
      );
    } else {
      return getMoreWidget();
    }
  }

  Widget getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              noData ? '已显示全部内容' : '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            !noData
                ? CircularProgressIndicator(
                    strokeWidth: 1.0,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget filterHeader() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
          margin: EdgeInsets.only(right: 11),
          child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                // onPressed: () => _openFilter(),
                padding: const EdgeInsets.all(0.0),
                icon: Image.asset(
                  ImageHelper.wrapAssets("car.png"),
                  width: 32,
                  height: 32,
                ),
              ))),
    );
  }

  Widget backHeader() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
          margin: EdgeInsets.only(left: 11),
          child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                padding: const EdgeInsets.all(0.0),
                icon: Image.asset(
                  ImageHelper.wrapAssets("ic_back_white.png"),
                  width: 32,
                  height: 32,
                ),
              ))),
    );
  }

  Future<CarListModel> getCarList(int page) async {
    try {
      final _headers = <String, dynamic>{};
      final queryParameters = <String, dynamic>{
        "dir": "",
        "orderBy": "",
        "pageNo": page,
        "pageSize": 30,
        "start": 0,
        "gnlb": _carSearchFilterModel?.functionType?.no,
        "cllx": _carSearchFilterModel?.carType?.no,
        "zzgn": _carSearchFilterModel?.operationalFunction?.no,
        "cldj": _carSearchFilterModel?.carLevel?.no,
        "clzt": _carSearchFilterModel?.carStatus?.no,
        "qwzt": _carSearchFilterModel?.dutyStatus?.no,
        "jgbh": _carSearchFilterModel?.institution?.jgbh,
        "keyword": _carSearchFilterModel?.plateNumber,
      };

      CarListModel carListModel =
          await CarRepo().getCarList(_headers, queryParameters);
      return carListModel;
    } on DioError catch (e) {
      ToastUtil.showToast(NetErrorHelper.getNetErrorMessage(e));
    } catch (e1) {
      print(e1);
    }
  }

// _openFilter() {
//   Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   CarListFilterPage(carFilterModel: _carSearchFilterModel)))
//       .then((value) {
//     if (value is CarSearchFilterModel) {
//       setState(() {
//         _carSearchFilterModel = value;
//       });
//     }
//
//     listRefresh();
//   });
// }

// _openEditPage(context) {
//   Navigator.of(context).push(new MaterialPageRoute(builder: (_){
//     return  CarDetailInfoPage(id : "");
//   }));
// }

// _listItemClick(CarListDetailModel carListDetailModel) {
//   Navigator.of(context).push(new MaterialPageRoute(builder: (_){
//     return  CarDetailViewPage(id : carListDetailModel.clbh);
//   }));
// }
//
// _updateCarStatus(CarListDetailModel carListDetailModel,List<DictModel> carStatusList, int value) async {
//   showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (ctx) =>
//           LoadingDialog("数据提交中...", () => {}));
//   try {
//     BaseHttpResult<bool> baseHttpResult = await CarRepo().updateCarStatus(carListDetailModel.clbh,carStatusList[value].no);
//     bool result = baseHttpResult.result;
//     if(result??false) {
//       Navigator.pop(context);
//       setState(() {
//         carListDetailModel.clzt=carStatusList[value].codeItemName;
//       });
//     } else {
//       ToastUtil.showToast("状态更新失败");
//       Navigator.pop(context);
//     }
//   } catch (e) {
//     ToastUtil.showToast('更新状态失败');
//     Navigator.pop(context);
//     MyLogger.instance.error('joinin', e);
//
//   }
// }
}
