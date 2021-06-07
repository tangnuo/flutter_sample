import 'package:flutter/material.dart';

/// https://book.flutterchina.club/chapter4/alignment.html
/// https://book.flutterchina.club/chapter4/stack.html

class BasicWidget extends StatefulWidget {
  @override
  _BasicWidgetState createState() => new _BasicWidgetState();
}

class _BasicWidgetState extends State<BasicWidget> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础组件"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text("1、单选开关和复选框："),
            ),
            Switch(
              value: _switchSelected, //当前状态
              onChanged: (value) {
                //重新构建页面
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            ),
            Container(
              child: Text("2、输入框："),
              margin: EdgeInsets.only(top: 20),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
            Container(
              child: Text("3、层叠布局 Stack、Positioned："),
              margin: EdgeInsets.only(top: 20),
            ),
            Container(
              color: Color(0xff73b69c),
              height: 200,
              width: 300,
              child: Stack(
                alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                children: <Widget>[
                  Container(
                    child: Text("Hello world",
                        style: TextStyle(color: Colors.green)),
                    color: Colors.red,
                  ),
                  Positioned(
                    left: 18.0,
                    child: Text("I am Jack"),
                  ),
                  Positioned(
                    top: 18.0,
                    child: Text("Your friend"),
                  )
                ],
              ),
            ),
            Container(
              child: Text("4、对齐与相对定位（Align）："),
              margin: EdgeInsets.only(top: 20),
            ),
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: Align(
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            Container(
              child:
                  Text("5、装饰容器DecoratedBox：\n可以在其子组件绘制前(或后)绘制一些装饰，如背景、边框、渐变等。"),
              margin: EdgeInsets.only(top: 20),
            ),
            DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange[700]]), //背景渐变
                    borderRadius: BorderRadius.circular(3.0), //3像素圆角
                    boxShadow: [
                      //阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            Container(
              child: Text("6、尺寸限制类容器ConstrainedBox："),
              margin: EdgeInsets.only(top: 20),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  minHeight: 50.0 //最小高度为50像素
                  ),
              child: Container(
                height: 5.0, //虽然写的是5，但是最新限制是50.
                child: redBox,
              ),
            ),
            SizedBox(width: 80.0, height: 80.0, child: redBox), //固定宽高
            ConstrainedBox(
                //多重限制
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                  child: redBox,
                )),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Container是一个组合类容器，它本身不对应具体的RenderObject，它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器，所以我们只需通过一个Container组件可以实现同时需要装饰、变换、限制的场景。",
                style: TextStyle(
                  color: Colors.black12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);
