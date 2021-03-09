import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Flutter webview 使用和交互
/// https://www.jianshu.com/p/4aabe453eb26

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
  // WebViewExampleState createState() => WebViewExampleState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController _controller;
  String _title = "gsy_flutter_demo";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("$_title"),
      ),
      child: SafeArea(
        child: WebView(
          initialUrl: "https://github.com/CarGuo/gsy_flutter_demo",
          // initialUrl: "https://www.baidu.com/",
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          onPageFinished: (url) {
            // 在页面加载完成之后，获取网页标题，并显示在导航栏上。
            _controller.evaluateJavascript("document.title").then((result){
              setState(() {
                _title = result;
              });
            }
            );
          },
        ),
      ),
    );
  }
}


class WebViewExampleState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://github.com/dengfa/gsy_flutter_demo',
    );
  }
}