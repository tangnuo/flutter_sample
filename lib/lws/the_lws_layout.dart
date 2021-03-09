import 'package:flutter/material.dart';

/// 1、流式布局：Wrap()、Chip()
/// http://liuwangshu.cn/flutter/primer/10-layout-widget.html
class ChipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('流式布局示例'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Wrap(
            direction: Axis.horizontal, //主轴的方向
            spacing: 8.0, // 主轴方向的间距
            runSpacing: 12.0, // 交叉轴方向的间距
            children: <Widget>[
              Chip(
                //1
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('1')),
                label: Text('Android进阶之光'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('2')),
                label: Text('Android进阶解密'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('3')),
                label: Text('Android进阶？'),
              ),
            ],
          ),
        ),
      );
  }
}

/// 2、层式布局：Stack()
class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('层式布局示例'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                child: Image.asset(
              "images/yuner2.jpg",
              width: 200,
              fit: BoxFit.cover,
            )),
            Container(
              child: Text('林允儿',
                  style: TextStyle(color: Colors.lightBlue, fontSize: 20.0)),
              height: 50.0,
              width: 100.0,
              alignment: Alignment.center,
            )
          ],
        ),
    );
  }
}

/// 弹性布局：Flex()、Expanded()
class FlexWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("弹性布局示例"),
        ),
        body: Flex(
          direction: Axis.horizontal, //1
          children: <Widget>[
            Expanded(
              flex: 1,//2
              child: Container(
                height: 60.0,
                width: 30.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 60.0,
                width: 30.0,
                color: Colors.yellow,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 60.0,
                width: 30.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
    );
  }
}
