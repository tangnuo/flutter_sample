import 'package:flutter/material.dart';

/// flutter控件Flexible和 Expanded的区别
/// https://blog.csdn.net/chunchun1230/article/details/82460257
class LayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("布局示例"),
      ),
      body: Column(
        children: [
          Container(
            child: Text("Expanded效果："),
            alignment: Alignment.centerLeft,
          ),
          Row(
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  print('点击红色按钮事件');
                },
                color: const Color(0xffcc0000),
                child: new Text('红色按钮'),
              ),
              new Expanded(
                flex: 1,
                child: new RaisedButton(
                  onPressed: () {
                    print('点击黄色按钮事件');
                  },
                  color: const Color(0xfff1c232),
                  child: new Text('黄色按钮'),
                ),
              ),
              new RaisedButton(
                onPressed: () {
                  print('点击粉色按钮事件');
                },
                color: const Color(0xffea9999),
                child: new Text('粉色按钮'),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            child: Text("Flexible效果："),
            alignment: Alignment.centerLeft,
          ),
          Row(
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  print('点击红色按钮事件');
                },
                color: const Color(0xffcc0000),
                child: new Text('红色按钮'),
              ),
              new Flexible(
                flex: 1,
                child: new RaisedButton(
                  onPressed: () {
                    print('点击黄色按钮事件');
                  },
                  color: const Color(0xfff1c232),
                  child: new Text('黄色按钮'),
                ),
              ),
              new RaisedButton(
                onPressed: () {
                  print('点击粉色按钮事件');
                },
                color: const Color(0xffea9999),
                child: new Text('粉色按钮'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
