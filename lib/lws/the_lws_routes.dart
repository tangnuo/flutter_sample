import 'package:flutter/material.dart';

/// http://liuwangshu.cn/flutter/primer/12-route.html
/// 1、新建路由
class LwsRoutesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirstPage();
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一页"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("跳转到第二页"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
                maintainState: false,
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("返回到第二页"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

/// 2、注册路由（多页面都跳转到了同一个页面）
class LwsRoutesApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      initialRoute: '/First', //1
      routes: {
        '/First': (context) => FirstPage2(),
        "/Second": (context) => SecondPage()
      },
      home: FirstPage(),
    );
  }
}

class FirstPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一页"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("跳转到第二页"),
          onPressed: () {
            Navigator.pushNamed(context, '/Second'); //2
          },
        ),
      ),
    );
  }
}

/// 3、路由间传递数据
class LwsRoutesApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      initialRoute: '/First', //1
      routes: {
        '/First': (context) => FirstPage3(),
        "/Second": (context) => SecondPage3()
      },
      home: FirstPage(),
    );
  }
}

class FirstPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一页"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("跳转到第二页"),
          onPressed: () {
            _navigateToSecondPage(context);
          },
        ),
      ),
    );
  }

  _navigateToSecondPage(BuildContext context) async {
    dynamic customArgumnets = await Navigator.pushNamed(
      context,
      '/Second',
      arguments: CustomArgumnets('Android进阶之光'),
    ); // 传参

    print("页面回参：" + customArgumnets.content);
  }
}

class SecondPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CustomArgumnets customArgumnets =
        ModalRoute.of(context)!.settings.arguments as CustomArgumnets; // 取参数

    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('第一页的数据为：'),
            Text(customArgumnets.content),
            ElevatedButton(
              onPressed: () {
                // 当我们点击返回第一页，在控制台中会打印出 Android进阶解密。
                Navigator.pop(context, CustomArgumnets('Android进阶解密')); //返回时传参
              },
              child: Text('返回第一页'),
            ),
          ],
        ),
      ),
    );
  }
}

///定义实体类
class CustomArgumnets {
  String content;

  CustomArgumnets(this.content);
}
