import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片缩放'),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: AssetImage("images/yuner1.jpg"),
        ),
      ),
    );
  }
}
