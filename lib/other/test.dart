import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // 我们想使用 material 风格的应用，所以这里用 MaterialApp
//    return MaterialApp(
//      // 移动设备使用这个 title 来表示我们的应用。具体一点说，在 Android 设备里，我们点击
//      // recent 按钮打开最近应用列表的时候，显示的就是这个 title。
//      title: 'Our first Flutter app',
//
//      // 应用的“主页”
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Flutter rolling demo'),
//        ),
//        // 我们知道，Flutter 里所有的东西都是 widget。为了把按钮放在屏幕的中间，
//        // 这里使用了 Center（它是一个 widget）。
//        body: Center(
//          child: RaisedButton(
//            // 用户点击时候调用
//            onPressed: _onPressed,
//            child: Text('roll'),
//          ),
//        ),
//      ),
//    );
//  }
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our first Flutter app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter rolling demo'),
        ),
        body: Center(
          child: RollingButton(),
        ),
      ),
    );
  }
}

class RollingButton extends StatefulWidget {
  // StatefulWidget 需要实现这个方法，返回一个 State
  @override
  State createState() {
    return _RollingState();
  }
}

//// 可能看起来有点恶心，这里的泛型参数居然是 RollingButton
//class _RollingState extends State<RollingButton> {
//
//  @override
//  Widget build(BuildContext context) {
//    return RaisedButton(
//      child: Text('Roll'),
//      onPressed: _onPressed,
//    );
//  }
//
//  void _onPressed() {
//    debugPrint('_RollingState._onPressed');
//    showDialog(
//      // 第一个 context 是参数名，第二个 context 是 State 的成员变量
//        context: context,
//        builder: (_) {
//          return AlertDialog(
//            content: Text('AlertDialog'),
//          );
//        }
//    );
//  }
//}

// 可能看起来有点恶心，这里的泛型参数居然是 RollingButton
class _RollingState extends State<RollingButton> {
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Roll'),
      onPressed: _onPressed,
    );
  }

  List<int> _roll() {
    final roll1 = _random.nextInt(6) + 1;
    final roll2 = _random.nextInt(6) + 1;
    return [roll1, roll2];
  }

  void _onPressed() {
    debugPrint('_RollingState._onPressed');
    final rollResults = _roll();
    showDialog(
        // 第一个 context 是参数名，第二个 context 是 State 的成员变量
        context: context,
        builder: (_) {
          return AlertDialog(
            content:
                Text('Roll result: (${rollResults[0]}, ${rollResults[1]})'),
          );
        });
  }
}


