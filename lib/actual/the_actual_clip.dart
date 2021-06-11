import 'package:flutter/material.dart';

class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("裁剪Clip"),
      ),
      body: buildBody(),
    );
  }

  Center buildBody() {
    // 头像
    /// 本地图片加载的三种方式：
    Widget avatar = Image.asset("images/yuner1.jpg", width: 160.0);
    Widget avatar2 = Image(
      image: AssetImage("images/yuner1.jpg"),
      width: 160.0,
    ); //AssetImage没有scale属性

    Widget avatar3 = Image(
      image: ExactAssetImage("images/yuner1.jpg", scale: 1),
      width: 160.0,
    ); //scale属性默认值为1

    return Center(
      child: Column(
        children: <Widget>[
          avatar, //不剪裁
          ClipOval(child: avatar2), //剪裁为圆形
          ClipRRect(
            //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                child: avatar,
              ),
              Text(
                "你好世界",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                //将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, //宽度设为原来宽度一半
                  child: avatar,
                ),
              ),
              Text("你好世界", style: TextStyle(color: Colors.green))
            ],
          ),
        ],
      ),
    );
  }
}
