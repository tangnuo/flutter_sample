//聊天页面：https://segmentfault.com/a/1190000013712300
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/actual/the_actual_index.dart';
import 'package:flutter_sample/lws/the_lws_index.dart';
import 'package:flutter_sample/sample/the_sample_index.dart';

import 'arch/common/net_error_helper.dart';
import 'arch/log/logger.dart';
import 'arch/model/token_model.dart';
import 'arch/net/base_http_response.dart';
import 'arch/net/http_apis.dart';
import 'arch/net/http_manager.dart';
import 'arch/ui/car/car_list_page.dart';
import 'arch/util/preference_util.dart';
import 'arch/util/toast_util.dart';
import 'other/the_other_index.dart';

//程序入口
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(new MaterialApp(
    title: '首页',
    routes: routers, //路由列表
    home: new MainApp(),
  ));
}

void init() async {
  MyLogger.instance.init();
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() {
    return new _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    onLogin();
  }

  @override
  Widget build(BuildContext context) {
    var keyList = routers.keys.toList();
    DateTime _lastPressedAt; //上次点击的时间

    return Scaffold(
      appBar: AppBar(
        title: Text("主页面"),
      ),
      body: WillPopScope(
        child: new Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(keyList[index]);
                },
                child: Card(
                  child: new Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    child: new Text(routers.keys.toList()[index]),
                  ),
                ),
              );
            },
            itemCount: routers.length,
          ),
        ),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              (DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 2))) {
            //两次点击间隔超过1秒，重新计时
            _lastPressedAt = DateTime.now();
            print(_lastPressedAt);
            ToastUtil.showToast("2秒内连续按两次返回键退出");
            return false;
          }
          return true;
        },
      ),
    );
  }
}

Map<String, WidgetBuilder> routers = {
  "1、Flutter中文网示例": (context) => SampleIndex(),
  "2、LWS-Flutter": (context) => LwsSampleIndex(),
  "3、常用的三方插件": (context) => OtherSampleIndex(),
  "4、车辆--综合示例": (context) => CarListPage(), //应急APP
  "5、Flutter实战": (context) => ActualIndex(),
};

void onLogin() {
  // showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (ctx) => LoadingDialog("提交中...", () => {}));

  loginIn()
      .then((tokenModel) => {
            print("解析的token:" + tokenModel.jwt_token),
            PreferenceUtil.setJWTToken(tokenModel.jwt_token),
          })
      .catchError((e) => MyLogger.instance.info("登录异常：" + e.toString()));
}

Future<TokenModel> loginIn() async {
  try {
    final params = <String, dynamic>{
      'username': 'ers-app2',
      'password': 'kedacom123#'
    };
    Response response = await HttpManager.instance.dio.post(
      HttpApi.LOGIN_IN,
      queryParameters: params,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: {},
    );

    BaseHttpResponse responseData = BaseHttpResponse.fromJson(response.data);
    if (responseData.message != null) {
      ToastUtil.showToast(responseData.message);
      return null;
    } else {
      TokenModel tokenModel = TokenModel.fromJson(responseData.result);
      return tokenModel;
    }
  } on DioError catch (e) {
    ToastUtil.showToast(NetErrorHelper.getNetErrorMessage(e));
  }
}
