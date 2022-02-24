import 'package:flutter/material.dart';

/// http://liuwangshu.cn/flutter/primer/7-scrolling-widget.html

class LwsListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView示例'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('第1行'),
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('第2行'),
          ),
        ],
      ),
    );
  }
}

class LwsListViewApp2 extends StatelessWidget {
  final List<String> items;

  LwsListViewApp2({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView示例'),
      ),
      body: ListView.builder(
        //2
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.access_time),
            title: Text('${items[index]}'),
          );
        },
      ),
    );
  }
}

class LwsListViewApp3 extends StatelessWidget {
  final List<String> items;

  LwsListViewApp3({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView示例'),
      ),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.access_time),
            title: Text('${items[index]}'),
          );
        },
        separatorBuilder: (context, index) {
          //1
          return Container(
            constraints: BoxConstraints.tightFor(height: 1),
            color: Colors.black45,
          );
        },
      ),
    );
  }
}

/// GridView 使用
class LwsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('GridView示例'),
      ),
      body: GridView.count(
        crossAxisCount: 3, //1
        children: <Widget>[
          ListTile(
            title: Text('item1'),
          ),
          ListTile(
            title: Text('item2'),
          ),
          ListTile(
            title: Text('item3'),
          ),
          ListTile(
            title: Text('item4'),
          ),
          ListTile(
            title: Text('item5'),
          ),
          ListTile(
            title: Text('item6'),
          ),
          ListTile(
            title: Text('item7'),
          ),
          ListTile(
            title: Text('item8'),
          ),
          ListTile(
            title: Text('item9'),
          ),
        ],
      ),
    );
  }
}

class LwsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView示例'),
      ),
      body: PageView(
        onPageChanged: (index) {
          //1
          print('当前为第 $index 页');
        },
        children: <Widget>[
          ListTile(
            title: Text('第0页'),
          ),
          ListTile(
            title: Text('第1页'),
          ),
          ListTile(
            title: Text('第2页'),
          ),
        ],
      ),
    );
  }
}
