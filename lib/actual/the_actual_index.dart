import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/actual/the_actual_clip.dart';
import 'package:flutter_sample/actual/the_actual_flex.dart';
import 'package:flutter_sample/actual/the_actual_form.dart';
import 'package:flutter_sample/actual/the_actual_scaffold.dart';
import 'package:flutter_sample/actual/the_actual_scroll.dart';
import 'package:flutter_sample/actual/the_actual_switch_checkbox.dart';
import 'package:flutter_sample/actual/the_actual_wrap_flow.dart';

/// 《Flutter实战》：https://book.flutterchina.club/
class ActualIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter实战"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Text(routers.keys.toList()[index]),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: routers.values.toList()[index]));
              },
            );
          },
          itemCount: routers.length,
        ),
      ),
    );
  }
}

Map<String, WidgetBuilder> routers = {
  "1、基础组件示例": (context) => BasicWidget(),
  "2、Form表单": (context) => FormTestRoute(),
  "3、Flex 弹性布局": (context) => FlexApp(),
  "4、Wrap_Flow流式布局": (context) => FlowApp(),
  "5、Scaffold示例": (context) => ScaffoldRoute(),
  "6、Clip 裁剪": (context) => ClipTestRoute(),
  "6、滚动监听 及控制": (context) => ScrollNotificationTestRoute(),
};
