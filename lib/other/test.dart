import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter rolling demo'),
        ),
        body: Center(
          child: RollingButton(),
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


