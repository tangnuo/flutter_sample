//聊天页面：https://segmentfault.com/a/1190000013712300
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/lws/the_lws_index.dart';
import 'package:flutter_sample/other/chatPage.dart';
import 'package:flutter_sample/other/the_webview.dart';
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
  onLogin();
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var keyList = routers.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("主页面"),
      ),
      body: new Container(
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
    );
  }
}

Map<String, WidgetBuilder> routers = {
  "1、聊天案例": (context) => FriendlychatApp(),
  "2、Flutter中文网示例": (context) => SampleIndex(),
  "3、LWS-Flutter": (context) => LwsSampleIndex(),
  "4、GSY_flutter_demo": (context) => WebViewPage(),
  "5、常用的三方插件": (context) => OtherSampleIndex(),
  "6、车辆--综合示例": (context) => CarListPage(),
};

void onLogin()   {
  // showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (ctx) => LoadingDialog("提交中...", () => {}));

  loginIn().then((tokenModel) => {

    print("token:"+tokenModel.jwt_token),
    PreferenceUtil.setJWTToken(tokenModel.jwt_token),
    // getUserInfo().then(
    //       (userinfo)  {
    //     Navigator.of(context).maybePop().then((_) {
    //
    //       if (rememberPassword)
    //       {
    //         PreferenceUtil.setUserName(_accountController.text);
    //         PreferenceUtil.setPassword(_passwordController.text);
    //         PreferenceUtil.setRememberPassword(rememberPassword);
    //       }
    //       Navigator.pushAndRemoveUntil(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) =>
    //               // DisasterList(userInfo: userinfo)
    //               DisasterMain()
    //           ),
    //               (route)=>false);
    //     });
    //
    //   },
    // ).catchError((e)=>Navigator.of(context).maybePop()),
    //
    // PreferenceUtil.setAutoLogin(autoLogin)
  }).catchError((e)=>
  MyLogger.instance.info("登录异常："+e.toString()));
}

Future<TokenModel> loginIn() async {
  try {
    final params = <String, dynamic>{
      'username': 'ers-app2',
      'password': 'kedacom123#'
      // 'username': _accountController.text,
      // 'password': _passwordController.text
    };
    Response response = await HttpManager.instance.dio.post(HttpApi.LOGIN_IN,
        queryParameters: params,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: {});

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
