import 'package:flutter/material.dart';

/// 用AnimatedWidget简化实现
/// https://flutterchina.club/tutorials/animation/
class AnimationPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationPage2State();
  }
}

class _AnimationPage2State extends State<AnimationPage2>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    //写法一：https://flutterchina.club/tutorials/animation/
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animation);

    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // 用于实时更新_animation.value
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // 监听动画完成的状态 The animation is stopped at the end
          _controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          // 监听动画结束的状态 The animation is stopped at the beginning
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("重构动画"),
      ),
      // 写法一（基础用法）：
      // body: Center(
      //   child: Container(
      //     margin: EdgeInsets.symmetric(vertical: 10),
      //     width: _animation.value,
      //     height: _animation.value,
      //     child: FlutterLogo(),
      //   ),
      // ),

      // 写法二(使用AnimationWidget)：
      // body: AnimatedLogo(animation: _animation),

      // 写法三（使用AnimatedBuilder）：
      body: GrowTransition(
        animation: _animation,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// 现在继承自AnimatedWidget而不是StatefulWidget。
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key nKey, Animation<double> animation})
      : super(key: nKey, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> _animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: _animation.value,
        height: _animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

/// 用AnimatedBuilder重构 (放大效果)
class GrowTransition extends StatelessWidget {
  GrowTransition({
    this.animation,
  });

  final Animation<double> animation;

  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, nChild) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: nChild,
          );
        },
        child: FlutterLogo(),
      ),
    );
  }
}
