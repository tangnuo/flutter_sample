///当前状态的弹框
import 'package:flutter/material.dart';
import 'package:flutter_sample/arch/common/image_helper.dart';

import 'const.dart';
import 'func.dart';

class CurStatusDialog extends StatefulWidget {
  // 名称
  String? name;

  // 部门
  String? department;

  //职位
  String? position;

  // 点击返回index 0 1
  //参战状态
  String? status;
  Function? onCancel;
  Function? onQuit;

  CurStatusDialog(
      {this.onCancel,
      this.onQuit,
      this.status,
      this.position,
      this.department,
      this.name});

  @override
  State<StatefulWidget> createState() {
    return _CurStatusDialogState();
  }
}

class _CurStatusDialogState extends State<CurStatusDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConst.Color_Clear,
      child: Center(
        // ClipRRect 创建圆角矩形 要不然发现下边button不是圆角
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: ColorConst.Color_Font_White,
            width: (320),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(
                          left: 11, top: 4, right: 11, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(17),
                              bottomRight: Radius.circular(17)),
                          // 设置正圆角
                          color: Color(0xFFF06432),
                          border:
                              Border.all(width: 2, color: Color(0xFFFFD8CA))),
                      child: Text(
                        widget.status!,
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: (14)),
                      ),
                    ),
                    (widget.name == null || widget.name!.length == 0)
                        ? Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 20),
                          )
                        : Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                widget.name!,
                                style: TextStyle(
                                    color: ColorConst.Color_Font_Black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: (18)),
                              ),
                            ),
                          ),
                    GestureDetector(
                      onTap: () {
                        FunctionUtil.pop(context);
                        if (widget.onCancel != null) {
                          widget.onCancel!();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Image(
                          width: 16,
                          height: 16,
                          image: AssetImage(
                              ImageHelper.wrapAssets('ic_close_grey.png')),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Text(
                        "部门",
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: (14),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(left: 15, right: 25),
                      child: Text(
                        widget.department!,
                        style: TextStyle(
                            color: ColorConst.Color_Font_Black,
                            fontSize: (14),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1,
                  color: Color(0xFFECECEC),
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Text(
                        "职位",
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: (14),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(left: 15, right: 25),
                      child: Text(
                        widget.position!,
                        style: TextStyle(
                            color: ColorConst.Color_Font_Black,
                            fontSize: (14),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1,
                  color: Color(0xFFECECEC),
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    FunctionUtil.pop(context);
                    if (widget.onQuit != null) {
                      widget.onQuit!();
                    }
                  },
                  child: Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                        // 设置正圆角
                        border: Border.all(
                          color: Color(0xFF0F77FE),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "退出登录",
                        style: TextStyle(
                          color: Color(0xFF0F77FE),
                          fontSize: (14),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
