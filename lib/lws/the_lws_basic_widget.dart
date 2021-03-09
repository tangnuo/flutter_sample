import 'package:flutter/material.dart';

//程序入口
// void main() => runApp(LwsBasicApp());

/// 1、基本控件的使用
/// http://liuwangshu.cn/flutter/primer/4-basics-widget.html
class LwsBasicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Basic Widget'),
          ),
          backgroundColor: Colors.blueGrey,
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.access_alarm),
                  Icon(Icons.add_a_photo),
                  Icon(Icons.add_call),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: const FlutterLogo(),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text("占剩余部分的三分之二"),
                    flex: 2,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '文本样式',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.indigo,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.brown,
                  ),
                ),
              ),
              Container(
                child: Image.network(
                  "https://upload-images.jianshu.io/upload_images/1417629-53f7d0902457cbe6.jpg",
                  width: 260,
                  height: 100,
                  // fit: BoxFit.fill,
                  fit: BoxFit.contain,
                ),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              ),
              RaisedButton(
                onPressed: () => print('onPressed'),
                color: Colors.lightBlueAccent,
                child: Text(
                  'RaisedButton',
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.lightGreen),
                child: Text('Container'),
                padding: EdgeInsets.all(36.0),
                margin: EdgeInsets.all(10.0),
              ),
            ],
          ));
  }
}

/// 2、Scaffold属性
/// http://liuwangshu.cn/flutter/primer/5-material-components.html
class LwsScaffoldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scaffold示例'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                print('添加按钮');
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Text('Scaffold'),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            color: Colors.lightGreen,
            child: Center(child: Text('用于设置Scaffold的底部导航栏')),
          ),
        ),
        drawer: Drawer(
          child: Center(
            child: Text('用于设置抽屉效果'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      );
  }
}
