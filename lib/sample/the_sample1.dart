import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//////////////////////////// 示例2 /////////////////////////////////

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(children: <Widget>[
        new _MyAppBar(
          title: new Text(
            "Example Title",
            style: Theme.of(context).primaryTextTheme.title,
          ),
        ),
        new Expanded(
            child: new Center(
          child: new Text("Hello World"),
        ))
      ]),
    );
  }
}

 class _MyAppBar extends StatelessWidget {
   _MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null),
          new Expanded(
            child: title,
          ),
          new IconButton(
              icon: new Icon(Icons.search), tooltip: 'Search', onPressed: null)
        ],
      ),
    );
  }
}

///////////////////////////  示例3 ///////////////////////////////

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null),
        title: new Text('Example Title'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search), tooltip: 'Search', onPressed: null),
        ],
      ),
      body: new Center(
        child: new Text('Hello World'),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'add', child: new Icon(Icons.add), onPressed: null),
    );
  }
}

///////////////////////////  示例4 ///////////////////////////////

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: new Container(
        height: 72.0,
        width: 100.0,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }
}

///////////////////////////  示例5 ///////////////////////////////

/// 显示 计数器
class _CounterDisplay extends StatelessWidget {
  _CounterDisplay({this.count = 0});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count:$count');
  }
}

/// 更改 计数器
class _CounterIncrementor extends StatelessWidget {
  _CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('Increment'),
    );
  }
}

class MyCounter extends StatefulWidget {
  @override
  State<MyCounter> createState() {
    return new _MyCounterState();
  }

// 使用了(=>)符号, 这是Dart中单行函数或方法的简写。
// _MyCounterState createState() => new _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new _CounterIncrementor(onPressed: _increment),
      new _CounterDisplay(count: _counter),
    ]);
  }
}
