import 'package:flutter/material.dart';
import 'package:flutter_sample/sample/the_layout_flexible_expanded.dart';
import 'package:flutter_sample/sample/the_sample1.dart';
import 'package:flutter_sample/sample/the_sample_chatPage.dart';
import 'package:flutter_sample/sample/the_sample_dialog.dart';
import 'package:flutter_sample/sample/the_sample_handling.dart' as handling;
import 'package:flutter_sample/sample/the_sample_layout.dart';
import 'package:flutter_sample/sample/the_sample_list.dart';
import 'package:flutter_sample/sample/the_sample_namer.dart';
import 'package:flutter_sample/sample/the_sample_navigation.dart';
import 'package:flutter_sample/sample/the_sample_network.dart';
import 'package:flutter_sample/sample/the_sample_network_image.dart';
import 'package:flutter_sample/sample/the_sample_shopping.dart';
import 'package:flutter_sample/sample/the_sample_webview.dart';

class SampleIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Flutter中文网示例";
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: routers.values.toList()[index]));
              },
              child: Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: new Text(routers.keys.toList()[index]),
                ),
              ),
            );
          },
          itemCount: routers.length,
        ),
      ),
    );
  }
}

Map<String, WidgetBuilder> routers = {
  // "1、基础 Widget 自由组合": (context) {
  //   return new MyScaffold();
  // },
  "1、基础 Widget 自由组合": (context) => MyScaffold(),

  "2、使用 Material 组件": (context) {
    return new TutorialHome();
  },
  "3、处理tap手势": (context) {
    return new MyButton();
  },
  "4、根据用户输入改变widget": (context) {
    return new MyCounter();
  },
  "5、页面跳转": (context) {
    // return new FirstScreen();
    // return new PassingDataApp();
    return new NavigationApp();
  },
  "6、列表显示、收藏": (context) {
    return new StartupNamerApp();
  },
  "7、ShoppingList": (context) {
    return ShoppingList(
      products: <Product>[
        new Product(name: 'Eggs'),
        new Product(name: 'Flour'),
        new Product(name: 'Chocolate chips'),
      ],
    );
  },
  "8、显示网络图片": (context) {
    //跳转图片加载
    // return ImageApp();
    // return ImageApp2();
    return ImageApp3();
  },
  "9、List示例": (context) {
    //跳转List示例
    // return BasicListApp();
    // return HorizontalListApp();

    // List<String> items = new List<String>.generate(
    //     100, (index) => "Item $index");
    // return LongListApp(items: items);

    // List<ListItem> items = new List<ListItem>.generate(
    //   100,
    //   (i) => i % 6 == 0
    //       ? new HeadingItem("Heading $i")
    //       : new MessageItem("Sender $i", "Message body $i"),
    // );
    // return MixListApp(items: items);

    return GridListApp();
  },
  "10、手势处理": (context) {
    // return handling.GestureDemoApp();
    // return handling.InkWellDemoApp();
    return handling.DismissingApp();
  },
  "11、Http 网络请求": (context) {
    // return new HttpApp();
    // return new WebSocketApp();
    return new DioApp();
  },
  "12、构建布局": (context) => MyLayoutApp(),
  "13、Flexible和 Expanded": (context) => LayoutApp(),
  "14、Flutter Dialog使用": (context) => DialogPage(),
  "15、聊天案例": (context) => FriendlychatApp(),
  "16、GSY_flutter_demo": (context) => WebViewPage(),
};
