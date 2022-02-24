import 'package:flutter/material.dart';

/// Animation简单示例
///
/// https://flutterchina.club/tutorials/animation/
class AnimationPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationPage1State();
  }
}

class _AnimationPage1State extends State<AnimationPage1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

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

    // //写法二：https://www.jianshu.com/p/81d88b39287e
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 2000),
    // )
    //   ..addListener(() {
    //     // 用于实时更新_animation.value
    //     setState(() {
    //       print("value:${_animation.value}");
    //     });
    //   })
    //   ..addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       // 监听动画完成的状态 The animation is stopped at the end
    //       _controller.reverse();
    //     }
    //     if (status == AnimationStatus.dismissed) {
    //       // 监听动画结束的状态 The animation is stopped at the beginning
    //       _controller.forward();
    //     }
    //   });
    // _animation =
    //     CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    // _animation = Tween(begin: 0.0, end: 300.0).animate(_animation);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("简单动画"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: _animation.value,
          height: _animation.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
