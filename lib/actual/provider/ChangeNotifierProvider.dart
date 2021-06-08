import 'package:flutter/material.dart';
import 'package:flutter_sample/actual/provider/ChangeNotifier.dart';
import 'package:flutter_sample/actual/provider/InheritedProvider.dart';

/// https://book.flutterchina.club/chapter7/provider.html#provider
/// >>>基于InheritedWidget 自定义Provider框架
/// 1、Model变化后会自动通知ChangeNotifierProvider（订阅者），
/// 2、ChangeNotifierProvider内部会重新构建InheritedWidget，
/// 3、而依赖该InheritedWidget的子孙Widget就会更新。
class ChangeNotifierProvider<T extends ChangeNotifier2> extends StatefulWidget {
  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });

  final Widget child;
  final T data;

  // //定义一个便捷方法，方便子树中的widget获取共享数据
  // static T of<T>(BuildContext context) {
  //   // final type = _typeOf<InheritedProvider<T>>();
  //   final provider =
  //       context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
  //   return provider.data;
  // }

  //添加一个listen参数，表示是否建立依赖关系
  static T of<T>(BuildContext context, {bool listen = true}) {
    // final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
            ?.widget as InheritedProvider<T>;
    return provider.data;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier2>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
