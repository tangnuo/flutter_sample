import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

import 'MyToast.dart';

class PermissionScaffoldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('权限申请'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // print('删除文件');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: ElevatedButton(
          child: Text("申请权限"),
          onPressed: _requestPermissions,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Toast原生写法：
          Fluttertoast.showToast(
              msg: "flutter toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 16.0);

          //Toast简单封装：
          MyToast.show("flutter toast");
        },
      ),
    );
  }
}

Future<bool> _requestPermissions() async {
//  申请权限
  Map<PermissionGroup, PermissionStatus> permissions =
      await PermissionHandler().requestPermissions([
    PermissionGroup.storage,
    PermissionGroup.camera,
    PermissionGroup.location,
  ]);


//  申请结果
  PermissionStatus permissionStatus =
      await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
  if (permissionStatus == PermissionStatus.granted) {
    print('申请成功');
  } else {
    print('申请被拒绝');
    bool isShow = await PermissionHandler()
        .shouldShowRequestPermissionRationale(PermissionGroup.camera);
    if (!isShow) {
      print('当前权限已被禁用申请，请在设置中手动开启后退出重新进入程序');
      await PermissionHandler().openAppSettings();
    } else {
      PermissionStatus ps = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.camera);
      if (ps == PermissionStatus.granted) {
        print('登录成功！');
      } else {
        _requestPermissions();
      }
    }
  }
}


request() async{
  // 检查并请求权限
  PermissionStatus status = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
  if (PermissionStatus.granted != status) {
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage,
    ]);
  }
}
