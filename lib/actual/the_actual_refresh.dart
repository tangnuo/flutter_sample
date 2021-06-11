import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/arch/log/logger.dart';

/// Flutter之RefreshIndicator下拉刷新及ScrollController上拉加载更多
/// https://blog.csdn.net/u013600907/article/details/104924719
class RefreshPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  ScrollController _scrollController = ScrollController();
  int _pageNum = 0;
  int _pageSize = 20;
  List _newList = [];
  bool flag = true;

  ///默认可以请求

  @override
  void initState() {
    super.initState();
    //初始化数据
    _getData();
    //上拉刷新监听器
    _scrollController.addListener(() {
      // if (_scrollController.position.pixels ==
      //     _scrollController.position.maxScrollExtent) {
      //   print('到达底部了');
      //   getMoreData();
      // }

      //当前距离值>最大距离值-20的时候 进行上拉加载数据并分页
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        _getData();
        setState(() {
          _pageNum = _pageNum + 20;
          _pageSize = _pageSize + 20;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下拉刷新 上拉加载"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return _newList.length > 0
        ? RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index == _newList.length - 1) {
                  return Column(
                    children: <Widget>[
                      buildListItem(index),
                      Divider(),
                      _getMoreWidget()
                    ],
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      buildListItem(index),
                      Divider(),
                    ],
                  );
                }
              },
              itemCount: _newList.length,
            ),
            onRefresh: _onRefresh,
          )
        : _getMoreWidget();
  }

  ///创建Item
  Widget buildListItem(int index) {
    return ListTile(
      title: Text(
        _newList[index]['title'],
        maxLines: 1,
      ),
      leading: Image.network(
        _newList[index]['imgsrc'],
        fit: BoxFit.cover,
        width: 80,
        height: 80,
      ),
      subtitle: Text(_newList[index]['ptime']),
    );
  }

  /// 访问接口、请求数据
  void _getData() async {
    if (flag) {
      String url =
          "http://c.m.163.com/nc/article/headline/T1348649580692/$_pageNum-$_pageSize.html";
      MyLogger.instance.info("url:$url");
      Response response = await Dio().get(url);
      List list = response.data['T1348649580692'];
      setState(() {
        _newList.addAll(list);
      });
      if (list.length < 20) {
        setState(() {
          flag = false;
        });
      }
    }
  }

  //下拉刷新->转一秒的圈 回调刷新的方法
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      _getData();
    });
  }

  //返回一个圈
  Widget _getMoreWidget() {
    if (flag) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
              CircularProgressIndicator(
                strokeWidth: 1.0,
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text("---已经到底啦---"),
      );
    }
  }
}
