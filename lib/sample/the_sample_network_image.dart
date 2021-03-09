import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

var imageUrl =
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg";

var imageUrl2 = "http://via.placeholder.com/350x150";

/// 1、显示来自网上的图片
class ImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = "Web Images";

    return new MaterialApp(
      title: title,
      //Flutter默认主题
      theme: new ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600]),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Image.network(imageUrl),
      ),
    );
  }
}

/// 2、用占位符淡入图片
class ImageApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Fade in images";

    return new MaterialApp(
      title: title,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Stack(
          children: <Widget>[
            new Center(
              child: new CircularProgressIndicator(),
            ),
            new Center(
              child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage, image: imageUrl),
            ),
          ],
        ),
        //局部主题，扩展父主题
        floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.redAccent),
          child: new FloatingActionButton(
            onPressed: null,
            child: new Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

/// 3、使用缓存图片
class ImageApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Cached Images';
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
