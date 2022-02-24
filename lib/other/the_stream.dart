import 'dart:async';

import 'package:flutter/material.dart';

/// Stream使用步骤：
/// 1、创建对象
/// 2、使用StreamBuild进行事件订阅
/// 3、事件传入（StreamSink）

class StreamOnePage extends StatefulWidget {
  @override
  _StreamOnePageState createState() => _StreamOnePageState();
}

class _StreamOnePageState extends State<StreamOnePage> {
  ///1、创建对象（先创建StreamController控制，再由控制器创造StreamSink，Stream对象）
  ///流事件控制器
  // ignore: close_sinks
  StreamController<int> _streamController = StreamController(onListen: () {
    print("onListen");
  }, onCancel: () {
    print("onCancel");
  });
  late Stream _stream;
  late StreamSink _sink;
  int _count = 0;

  /// 使用 StreamSink 向 Stream 发送事件，当 _counter 大于 9 时调用 close 方法关闭流。
  void _incrementCounter() {
    if (_count > 9) {
      _sink.close();
      return;
    }
    _count++;

    _sink.add(_count);
  }

  /// 主动关闭流
  void _closeStream() {
    _streamController.close();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
    _sink.close();
  }

  @override
  void initState() {
    super.initState();

    ///流事件
    _stream = _streamController.stream;

    ///事件入口
    _sink = _streamController.sink;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:'),

            ///2、在需要订阅的组件外层包裹StreamBuild进行事件订阅（builder是将获取的数据进行操作，再展示到组件上的目的）
            StreamBuilder(
              stream: _stream, //数据流
              initialData: _count, //初始数据
              builder: (context, AsyncSnapshot snapshot) {
                ///snapshot携带事件入口处闯进来的数据，用snapshot.data获取数据进行处理
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '结束了',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  );
                }
                int number = snapshot.data;
                return Text(
                  "$number",
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: "Increment",
            onPressed: () => _incrementCounter(),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            child: Icon(Icons.close),
            tooltip: "Close",
            onPressed: () => _closeStream,
          ),
        ],
      ),
    );
  }
}
