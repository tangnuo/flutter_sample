import 'package:flutter/material.dart';

/// Flutter 接口回调callback 具体实现案例
/// https://www.cnblogs.com/xq9527/p/14097258.html

/// 定义回调函数
typedef _CallBack = void Function(int selectIndex, String selectStr);

class TextList extends StatefulWidget {
  final List dataArr;
  final _CallBack callback;

  TextList({Key? key, required this.dataArr, required this.callback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextListState();
  }
}

class _TextListState extends State<TextList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("接口回调列表"),
      ),
      body: ListView.builder(
        itemCount: widget.dataArr.length,
        itemBuilder: (context, position) {
          return _itemWidget(context, position);
        },
      ),
    );
  }

  Widget _itemWidget(BuildContext context, int index) {
    return GestureDetector(
      child: Center(
          child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(widget.dataArr[index]),
      )),
      onTap: () {
        widget.callback(index, widget.dataArr[index]);
      },
    );
  }
}
