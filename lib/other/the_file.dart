import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sample/other/FileHelper.dart';
import 'package:path_provider/path_provider.dart';

class FileScaffoldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '存储文件'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /***
   * 获取临时目录
   */
  _getTempDirectory() async {
    Directory directory = await getTemporaryDirectory();
    print("临时目录：" + directory.path);
  }

  /***
   * 获取应用文档目录
   */
  _getAppDocDirectory() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print("应用文档目录：" + directory.path);
  }

  /***
   * 获取外部存储目录
   */
  _getSDCardDirectory() async {
    Directory directory = await getExternalStorageDirectory();
    print("外部存储目录：" + directory.path);
  }

  final TextEditingController textEditingController =
      new TextEditingController();
  String? _data;
  FileHelpers fileHelpers = new FileHelpers();

  @override
  void initState() {
    super.initState();
    fileHelpers.readFile().then((String data) {
      setState(() {
        _data = data;
      });
    });
  }

  /***
   * 存储数据
   */
  Future<File> _saveData() async {
    setState(() {
      _data = textEditingController.text;
    });
    return fileHelpers.writeFile(_data!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('获取临时目录'),
              onPressed: _getTempDirectory,
            ),
            RaisedButton(
              child: Text('获取应用文档目录'),
              onPressed: _getAppDocDirectory,
            ),
            RaisedButton(
              child: Text('获取外部存储目录'),
              onPressed: _getSDCardDirectory,
            ),
            TextField(
              controller: textEditingController,
              autofocus: true,
              decoration: new InputDecoration(hintText: '请输入备忘录保存数据'),
            ),
            RaisedButton(
              child: Text('保存备忘录数据'),
              onPressed: _saveData,
            ),
            Text(_data ?? ''),
          ],
        ),
      ),
    );
  }
}
