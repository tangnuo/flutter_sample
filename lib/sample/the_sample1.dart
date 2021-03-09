import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  //示例1：默认布局
  // runApp(MyApp());

  //示例2：基础 Widget 自由组合
  // runApp(new MaterialApp(
  //   title: "My APP",
  //   home: new MyScaffold(),
  // ));

  // //示例3：使用 Material 组件
  // runApp(new MaterialApp(
  //   title: 'Flutter Tutorial',
  //   home: new TutorialHome(),
  // ));

  //示例4：处理手势
  // runApp(new MaterialApp(
  //   title: 'Flutter Tutorial',
  //   home: new MyButton(),
  // ));

  //示例5：根据用户输入改变widget
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new MyCounter(),
  ));
}

//////////////////////////// 示例1 /////////////////////////////////

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key key, this.title = ""}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//////////////////////////// 示例2 /////////////////////////////////

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

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

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(children: <Widget>[
        new MyAppBar(
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
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count = 0});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count:$count');
  }
}

/// 更改 计数器
class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

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
      new CounterIncrementor(onPressed: _increment),
      new CounterDisplay(count: _counter),
    ]);
  }
}
