import 'package:flutter/material.dart';

/// Flutter 顶部导航栏实现：TabBar + TabBarView + TabController
/// https://www.jianshu.com/p/aa1e26bff092
/// https://www.jianshu.com/p/f0db43884a91
class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabPageState();
  }
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> titleTabs = <Tab>[
    Tab(
      text: 'Android',
    ),
    Tab(
      text: 'iOS',
    ),
    Tab(
      text: 'Web',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 0, length: titleTabs.length, vsync: this);
    // 初始化TabController
    // 参数1：初试显示的tab位置
    // 参数2：tab的个数
    // 参数3：动画效果的异步处理，默认格式

    // 添加监听器
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabController"),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          //选中的颜色
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          //选中的样式
          unselectedLabelColor: Colors.black,
          //未选中的颜色
          unselectedLabelStyle: TextStyle(fontSize: 14),
          //未选中的样式
          indicatorColor: Colors.amber,
          indicatorWeight: 5,
          //下划线颜色
          isScrollable: false,
          //是否可滑动，设置不可滑动，则是tab的宽度等长
          //tab标签
          tabs: titleTabs,
          // 设置标题
          //点击事件
          onTap: (int i) {
            print(i + 10);
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Android')),
          Center(child: Text('iOS')),
          Center(child: Text('Web')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose(); // 当整个页面dispose时，记得把控制器也dispose掉，释放内存
  }
}
