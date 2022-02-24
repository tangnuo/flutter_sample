import 'package:flutter/material.dart';
import 'package:flutter_sample/actual/widget/GradientCircularProgressIndicator.dart';

class GradientCircularProgressRoute extends StatefulWidget {
  const GradientCircularProgressRoute({Key? key}) : super(key: key);

  @override
  _GradientCircularProgressRouteState createState() =>
      _GradientCircularProgressRouteState();
}

class _GradientCircularProgressRouteState
    extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // AnimatedBuilder(
            //   animation: _animationController,
            //   builder: (BuildContext context, Widget child) {
            //     return Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 16.0),
            //       child: Column(
            //         children: _children(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  List<Widget> _children() {
    return <Widget>[
      Wrap(
        spacing: 10.0,
        runSpacing: 16.0,
        children: <Widget>[
          GradientCircularProgressIndicator(
            // No gradient
            colors: [Colors.blue, Colors.blue],
            radius: 50.0,
            strokeWidth: 3.0,
            value: _animationController.value,
          ),
          GradientCircularProgressIndicator(
            colors: [Colors.red, Colors.orange],
            radius: 50.0,
            strokeWidth: 3.0,
            value: _animationController.value,
          ),
          GradientCircularProgressIndicator(
            colors: [Colors.red, Colors.orange, Colors.red],
            radius: 50.0,
            strokeWidth: 5.0,
            value: _animationController.value,
          ),
          GradientCircularProgressIndicator(
            colors: [Colors.teal, Colors.cyan],
            radius: 50.0,
            strokeWidth: 5.0,
            strokeCapRound: true,
            value: CurvedAnimation(
                    parent: _animationController, curve: Curves.decelerate)
                .value,
          ),
          RotatedBox(
            quarterTurns: 1,
            child: GradientCircularProgressIndicator(
                colors: [Colors.blue[700]!, Colors.blue[200]!],
                radius: 50.0,
                strokeWidth: 3.0,
                strokeCapRound: true,
                backgroundColor: Colors.transparent,
                value: _animationController.value),
          ),
          GradientCircularProgressIndicator(
            colors: [
              Colors.red,
              Colors.amber,
              Colors.cyan,
              Colors.green[200]!,
              Colors.blue,
              Colors.red
            ],
            radius: 50.0,
            strokeWidth: 5.0,
            strokeCapRound: true,
            value: _animationController.value,
          ),
        ],
      ),
      GradientCircularProgressIndicator(
        colors: [Colors.blue[700]!, Colors.blue[200]!],
        radius: 100.0,
        strokeWidth: 20.0,
        value: _animationController.value,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: GradientCircularProgressIndicator(
          colors: [Colors.blue[700]!, Colors.blue[300]!],
          radius: 100.0,
          strokeWidth: 20.0,
          value: _animationController.value,
          strokeCapRound: true,
        ),
      ),
    ];
  }
}
