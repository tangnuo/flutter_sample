import 'package:flutter/material.dart';

/// *
///
///创建人：xuqing
/// 类说明：账号历史记录弹窗  使用
/// 创建时间：2020-9-5
///
///

class RecordDialogByUtils extends Dialog {
  List list;
  RecordDialogByUtils({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center(
        //保证控件居中效果
        child: new SizedBox(
          width: 300.0,
          height: 200.0,
          child: new Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: list.length == 0 ? 0 : list.length,
                itemBuilder: (BuildContext context, int position) {
                  return itemWidget(context, position);
                }),
          ),
        ),
      ),
    );
  }

  Widget itemWidget(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
          height: 40,
          width: double.infinity,
          child: Center(
            child: Text("账号：" + list[index]["username"]),
          )),
      onTap: () {
        Navigator.pop(context, index);
      },
    );
  }
}
