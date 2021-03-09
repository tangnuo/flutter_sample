//聊天页面：https://segmentfault.com/a/1190000013712300
import 'package:flutter/material.dart';
import 'package:flutter_sample/lws/the_lws_index.dart';
import 'package:flutter_sample/other/chatPage.dart';
import 'package:flutter_sample/other/the_webview.dart';
import 'package:flutter_sample/sample/the_sample_index.dart';

//程序入口
void main() {
  runApp(new MaterialApp(
    title: '首页',
    routes: routers, //关键点
    home: new MainApp(),
  ));
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
                // Navigator.pushNamed(context, keyList[index]);
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
  "1、聊天": (context) => FriendlychatApp(),
  "2、Flutter中文网示例": (context) => SampleIndex(),
  "3、LWS-Flutter": (context) => LwsSampleIndex(),
  "4、GSY_flutter_demo": (context) => WebViewPage(),
};
