import 'package:flutter/material.dart';
import 'package:flutter_sample/arch/util/toast_util.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

/// https://pub.flutter-io.cn/packages/permission_handler
/// v3.2.0，旧版本，使用 PermissionGroup 和 PermissionHandler；
/// v5.1.0 简化了请求，使用Permission，支持support包；
/// v8.1.0 最新版本，需要支持AndroidX，兼容性不强；
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
          ToastUtil.showToast("flutter toast");
        },
      ),
    );
  }
}

void _requestPermissions() async {
//  申请权限
  Map<Permission, PermissionStatus> permissions = await [
    Permission.storage,
    Permission.camera,
    Permission.location,
  ].request();

//  申请结果
  PermissionStatus status = await Permission.camera.status;
  if (status.isGranted) {
    print('申请成功');
  } else {
    print('申请被拒绝');
    bool isShow = status.isRestricted;
    if (!isShow) {
      print('当前权限已被禁用申请，请在设置中手动开启后退出重新进入程序');
      openAppSettings();
    } else {
      if (status == PermissionStatus.granted) {
        print('登录成功！');
      } else {
        _requestPermissions();
      }
    }
  }
}

// request() async {
//   // 检查并请求权限
//   PermissionStatus status = await Permission.storage.status;
//   if (PermissionStatus.granted != status) {
//     Permission.storage.request();
//   }
// }
