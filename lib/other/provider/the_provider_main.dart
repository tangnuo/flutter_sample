import 'package:flutter/material.dart';
import 'package:flutter_sample/other/provider/the_provider_first.dart';
import 'package:flutter_sample/other/provider/the_provider_model.dart';
import 'package:provider/provider.dart';

/// https://juejin.cn/post/6844903864852807694
void main() {
  final counter = CounterModel();
  final textSize = 48;

  runApp(
    Provider<int>.value(
      value: textSize,
      child: ChangeNotifierProvider.value(
        value: counter,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FirstScreen(),
    );
  }
}
