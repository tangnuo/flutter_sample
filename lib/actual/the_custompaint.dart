import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Flutter重绘控件 -- CustomPaint
/// https://www.jianshu.com/p/686d8f84555a
class TestCustomPaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: "重绘学习"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width - 100, 500),
            painter: MyPainter(),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class MyPainter extends CustomPainter {
  Paint _paint = Paint()
    ..isAntiAlias = true
    ..color = Colors.red
    ..strokeWidth = 5;

  @override
  void paint(Canvas canvas, Size size) {
    //绘制背景
    _paint
      ..style = PaintingStyle.fill
      ..color = Colors.black.withOpacity(0.1);
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), _paint);

    _paint.color = Colors.red;

    ///画点
    var points = [
      Offset(10, 10),
      Offset(size.width / 3, 10),
      Offset(size.width / 2, 10)
    ];
    canvas.drawPoints(PointMode.points, points, _paint);

    ///画线
    _paint.strokeWidth = 1;
    canvas.drawLine(Offset(10, 30), Offset(size.width / 2, 30), _paint);

    ///画圆形
    _paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(50, 80), 25, _paint);

    _paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(120, 80), 25, _paint);

    ///画椭圆
    _paint.style = PaintingStyle.stroke;
    canvas.drawOval(Rect.fromLTRB(10, 120, 100, 180), _paint);

    _paint.style = PaintingStyle.fill;
    canvas.drawOval(Rect.fromLTRB(120, 120, 210, 180), _paint);

    ///画矩形
    _paint.style = PaintingStyle.stroke;
    canvas.drawRect(Rect.fromLTRB(10, 190, 100, 250), _paint);

    _paint.style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTRB(120, 190, 210, 250), _paint);

    ///画圆角矩形
    _paint.style = PaintingStyle.stroke;
    canvas.drawRRect(
        RRect.fromLTRBR(10, 270, 100, 330, Radius.circular(10)), _paint);

    _paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromLTRBR(120, 270, 210, 330, Radius.circular(10)), _paint);

    ///画狐形
    _paint.style = PaintingStyle.stroke;
    canvas.drawArc(Rect.fromLTRB(10, 330, 100, 390), 0, pi / 2, true, _paint);

    _paint.style = PaintingStyle.fill;
    canvas.drawArc(Rect.fromLTRB(120, 330, 210, 390), 0, pi / 2, true, _paint);

    //画路径
    _paint.style = PaintingStyle.stroke;
    var path = Path()
      ..moveTo(10, 410)
      ..lineTo(size.width / 2 - 50, 410)
      ..lineTo(10, 470)
      ..close();
    canvas.drawPath(path, _paint);

    _paint.style = PaintingStyle.fill;
    path = Path()
      ..moveTo(size.width / 2, 410)
      ..lineTo(size.width - 50, 410)
      ..lineTo(size.width / 2, 470)
      ..close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;
}
