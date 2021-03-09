import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(LwsPlatformApp1());

/// 1、Flutter 调用Android
/// http://liuwangshu.cn/flutter/primer/13-platform-channel.html
class LwsPlatformApp1 extends StatelessWidget {
  static const platformChannel =
      const MethodChannel('com.example.flutter_demo/dialog'); //1

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter调用Android"),
        ),
        body: Padding(
          padding: EdgeInsets.all(40.0),
          child: RaisedButton(
            child: Text("调用Dialog"),
            onPressed: () {
              showDialog("Flutter调用AlertDialog");
            },
          ),
        ),
      ),
    );
  }

  void showDialog(String content) async {
    var arguments = Map();
    arguments['content'] = content;
    try {
      String result =
          await platformChannel.invokeMethod('dialog', arguments); //2
      print('showDialog ' + result);
    } on PlatformException catch (e) {
      print('showDialog ' + e.code + e.message + e.details);
    } on MissingPluginException catch (e) {
      print('showDialog ' + e.message);
    }
  }
}

/// 2、Android调用Flutter(需要同步修改Activity中的MethodName)
class LwsPlatformApp2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<LwsPlatformApp2> {
  static const platformChannel =
      const MethodChannel('com.example.flutter_demo/text');

  String textContent = 'Flutter端初始文字';

  @override
  void initState() {
    super.initState();

    platformChannel.setMethodCallHandler((methodCall) async {
      switch (methodCall.method) {
        case 'showText':
          String content = await methodCall.arguments['content'];
          if (content != null && content.isNotEmpty) {
            setState(() {
              textContent = content;
            });
            return 'success';
          } else {
            throw PlatformException(
                code: 'error', message: '失败', details: 'content is null');
          }
          break;
        default:
          throw MissingPluginException();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Android调用Flutter'),
        ),
        body: Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(textContent),
        ),
      ),
    );
  }
}
