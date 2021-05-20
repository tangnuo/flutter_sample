import 'package:flutter/material.dart';
import 'package:flutter_sample/other/the_permission.dart';
import 'package:flutter_sample/other/the_photo_view.dart';
import 'package:flutter_sample/other/the_pick_image.dart';
import 'package:flutter_sample/other/the_shared_preferences.dart';

import 'the_file.dart';

/// 常用的三方库使用示例
class OtherSampleIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "常用的三方库使用示例";
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new ListView(
        children: [
          ListTile(
            title: new ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PermissionScaffoldApp();
                }));
              },
              child: Text("1、权限申请"),
            ),
          ),
          ListTile(
            title: new ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FileScaffoldApp();
                }));
              },
              child: Text("2、File Io操作"),
            ),
          ),
          ListTile(
            title: new ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SpApp();
                }));
              },
              child: Text("3、Shared Preferences操作"),
            ),
          ),
          ListTile(
            title: new ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ImagePickerWidget();
                }));
              },
              child: Text("4、选择相册图片或拍照"),
            ),
          ),    ListTile(
            title: new ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PhotoViewApp();
                }));
              },
              child: Text("5、图片缩放"),
            ),
          ),
        ],
      ),
    );
  }
}
