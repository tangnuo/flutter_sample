import 'package:flutter/material.dart';
import 'package:flutter_sample/lws/the_lws_basic_widget.dart';
import 'package:flutter_sample/lws/the_lws_gesture.dart';
import 'package:flutter_sample/lws/the_lws_layout.dart';
import 'package:flutter_sample/lws/the_lws_navigation.dart';
import 'package:flutter_sample/lws/the_lws_platform_channel.dart';
import 'package:flutter_sample/lws/the_lws_resource.dart';
import 'package:flutter_sample/lws/the_lws_routes.dart';
import 'package:flutter_sample/lws/the_lws_scrolling.dart';

class LwsSampleIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "LWS-Flutter";
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new ListView(
        children: [
          ListTile(
            title: new RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return LwsBasicApp();
                  return LwsScaffoldApp();
                }));
              },
              child: Text("1、Basic Widget"),
            ),
          ),
          ListTile(
            title: new RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LwsBottomNavigationBarApp();
                  // return LwsTabBarApp();
                  // return LwsTabBarApp2();
                  // return LwsDrawerApp();
                }));
              },
              child: Text("2、导航控件"),
            ),
          ),
          ListTile(
            title: new RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LwsPageView();
                }));
              },
              child: Text("3、滚动控件"),
            ),
          ),
          ListTile(
            title: new RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GestureDetectorWidget();
                }));
              },
              child: Text("4、手势相关"),
            ),
          ),
          ListTile(
              title: RaisedButton(
            child: Text('5、加载资源文件'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LwsAssetsWidget();
              }));
            },
          )),
          ListTile(
            title: RaisedButton(
              child: Text("6、布局widget"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return ChipWidget();
                  // return StackWidget();
                  return FlexWidget();
                }));
              },
            ),
          ),
          ListTile(
            title: RaisedButton(
              child: Text('7、路由'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return LwsRoutesApp();
                  // return LwsRoutesApp2();
                  return LwsRoutesApp3();
                }));
              },
            ),
          ),
          ListTile(
            title: RaisedButton(
              child: Text('8、Flutter调用Android'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LwsPlatformApp1(); // Flutter调用Android
                }));
              },
            ),
          ),
          ListTile(
            title: RaisedButton(
              child: Text('9、Android调用Flutter'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LwsPlatformApp2(); // Android调用Flutter
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
