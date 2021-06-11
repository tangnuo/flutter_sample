import 'package:flutter/material.dart';

/// 1、底部导航栏
/// http://liuwangshu.cn/flutter/primer/6-material-components-2.html
class LwsBottomNavigationBarApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MyWidget();
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<MyWidget> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar示例'),
      ),
      body: Center(
        child: Text("Index==>$_selectIndex"),
        // child: _widget.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "通讯录"),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "设置"),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectIndex = value;
    });
  }
}

/// 2、TabBar导航栏(水平的选项卡)
/// 使用DefaultTabController
/// http://liuwangshu.cn/flutter/primer/6-material-components-2.html

class LwsTabBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyTabController();
  }
}

class MyTabController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DefaultTabController示例'),
          bottom: TabBar(
            tabs: [
              Tab(text: '热点'),
              Tab(text: '体育'),
              Tab(text: '科技'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('热点')),
            Center(child: Text('体育')),
            Center(child: Text('科技')),
          ],
        ),
      ),
    );
  }
}

/// 3、自定义TabController
class LwsTabBarApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义TabController'),
        bottom: TabBar(
          tabs: [
            Tab(text: '热点2'),
            Tab(text: '体育2'),
            Tab(text: '科技2'),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('热点2')),
          Center(child: Text('体育2')),
          Center(child: Text('科技2')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

/// 4、Drawer就是抽屉
class LwsDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget2();
  }
}

class MyStatefulWidget2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DrawerState();
}

class _DrawerState extends State<MyStatefulWidget2> {
  get _drawer => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('唐诺'),
              accountEmail: Text('caowj1104@163.com'),
              currentAccountPicture: CircleAvatar(
                child: Text('X'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_post_office),
              title: Text('邮件'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer 例子"),
      ),
      drawer: _drawer,
    );
  }
}
