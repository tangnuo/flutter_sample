// 这是一个便捷类，会获得当前context和指定数据类型的Provider
import 'package:flutter/material.dart';
import 'package:flutter_sample/actual/provider/ChangeNotifierProvider2.dart';

class Consumer<T> extends StatelessWidget {
  Consumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider2.of<T>(context), //自动获取Model
    );
  }
}
