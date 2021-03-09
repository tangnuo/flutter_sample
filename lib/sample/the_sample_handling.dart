import 'package:flutter/material.dart';

/// 1、处理Taps
class GestureDemoApp extends StatelessWidget {
  final String title = '手势处理';

  @override
  Widget build(BuildContext context) {
    return _MyHomePage(title);
  }
}

class _MyHomePage extends StatelessWidget {
  final String title;

  _MyHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: Center(child: _MyButton()),
    );
  }
}

//自定义Button
class _MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text('Tap'));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('My Button'),
      ),
    );
  }
}

/// 2、触摸水波纹效果
class InkWellDemoApp extends StatelessWidget {
  final String title = '触摸水波纹效果';

  @override
  Widget build(BuildContext context) {
    return _MyHomePage2(title);
  }
}

class _MyHomePage2 extends StatelessWidget {
  final String title;

  _MyHomePage2(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: Center(child: _MyButton2()),
    );
  }
}

//自定义Button
class _MyButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tap')));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button'),
      ),
    );
  }
}

/// 3、滑动关闭
class DismissingApp extends StatelessWidget {
  final List<String> items =
      List<String>.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    final title = '滑动关闭效果';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            onDismissed: (dir) {
              items.removeAt(index);
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            background: Container(color: Colors.red),
            child: ListTile(title: Text('$item')),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

class DismissibleWidget2 extends StatelessWidget {
  final List<String> items;

  DismissibleWidget2({@required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible示例'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              items.removeAt(index);
              print(index);
            },
            child: ListTile(
              leading: Icon(Icons.access_time),
              title: Text('${items[index]}'),
            ),
          );
        },
      ),
    );
  }
}
