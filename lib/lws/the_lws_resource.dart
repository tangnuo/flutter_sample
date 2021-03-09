import 'dart:convert' show json;

import 'package:flutter/material.dart';

/// 资源与图片
/// http://liuwangshu.cn/flutter/primer/9-assets-images.html
class LwsAssetsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("加载文本示例"),
        ),
        body: JsonWidget(),
      ),
    );
  }
}

class JsonWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JsonWidgetState();
  }
}

/// 加载json文件
class _JsonWidgetState extends State<JsonWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //1
      future: DefaultAssetBundle.of(context).loadString("json/test.json"),
      //2 注意文件夹和文件名。
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //3
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<dynamic> data = json.decode(snapshot.data.toString()); //4
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 2.0,bottom: 2.0),
                      child: Text("名字: ${data[index]["name"]}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 2.0,bottom: 2.0),
                      child: Text("功夫: ${data[index]["gongfu"]}"),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
