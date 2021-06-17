import 'package:flutter/material.dart';
import 'package:flutter_sample/actual/the_callback_list.dart';
import 'package:flutter_sample/arch/util/toast_util.dart';

/// Flutter 接口回调callback 具体实现案例
/// https://www.cnblogs.com/xq9527/p/14097258.html
class CallbackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CallbackState();
  }
}

class _CallbackState extends State<CallbackPage> {
  // var datalist = List();
  List<String> dataList = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 20; i++) {
      dataList.add("第$i条数据");
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextList(
      dataArr: dataList,
      callback: (index, str) {
        print("接口回调：index=$index；str=$str");
        ToastUtil.showToast("接口回调：index=$index；str=$str");
      },
    );
  }
}
