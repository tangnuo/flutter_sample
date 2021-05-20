import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// 1、从互联网上获取数据
class Album {
  final int userId;
  final int id;
  final String title;
  final String body;

  Album({this.userId, this.id, this.title, this.body});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

///将http.Response 转换成一个Album对象
Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class HttpApp extends StatefulWidget {
  HttpApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HttpApp> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
    futureAlbum = fetchAlbum2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

/// 2、进行认证请求

Future<Album> fetchAlbum2() async {
  final response = await http.get(
    'https://jsonplaceholder.typicode.com/albums/1',
    headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
  );
  final responseJson = jsonDecode(response.body);

  return Album.fromJson(responseJson);
}

///3、使用Websockets
class WebSocketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'WebSocket Demo';
    return MyHomePage(
      title: title,
      channel: IOWebSocketChannel.connect('ws://echo.websocket.org'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;

  MyHomePage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}

/// 4、Flutter 请求网络数据时显示加载中
/// https://blog.csdn.net/yuzhiqiang_1993/article/details/89155870

class DioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _MyHomePage(title: '新闻列表');
  }
}

class _MyHomePage extends StatefulWidget {
  final String title;

  const _MyHomePage({Key key, this.title}) : super(key: key);

  @override
  // State<_MyHomePage> createState() => _MyHomePageState2();
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _getNews().then((result) {
          print("接口返回的数据是:$result");
        }).whenComplete(() {
          print("异步任务处理完成");
        }).catchError((error) {
          print("出现异常了：$error");
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dio.Response response = snapshot.data;
            return Text('${response.data.toString()}');
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      child: CircularProgressIndicator(),
    );
  }
}

/// 请求接口获取数据
/// http://v.juhe.cn/toutiao/index?type=keji&key=4c52313fc9247e5b4176aed5ddd56ad7
Future<dio.Response> _getNews() async {
  await Future.delayed(Duration(seconds: 3), () {
    print('延时3秒后请求数据');
  });

  String url = "http://v.juhe.cn/toutiao/index";
  String key = "4c52313fc9247e5b4176aed5ddd56ad7";
  String type = "keji";

  print("开始请求数据");
  dio.Dio myDio = dio.Dio();
  myDio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);

  dio.Response response = await myDio.get(
    url,
    queryParameters: {"type": type, "key": key},
    options: buildCacheOptions(Duration(days: 7)),
  ); //GET请求

//   Response response;
  //1、GET请求：
//   response=await dio.get("/test?id=3&name=liuwangshu")
//   print(response.data.toString());
// 2、GET带参数请求：
//   response=await dio.get("/test",data:{"id":3,"name":"liuwangshu"})
//   print(response.data.toString());
  //3、POST请求
  // response=await dio.post("/test",data:{"id":3,"name":"liuwangshu"})
  //4、FormData请求
  // FormData formData = new FormData.from({
  //   "name": "liuwangshu",
  //   "age": 18,
  // });
  // response = await dio.post("/info", data: formData);

  print("请求完成：" + response.data.toString());

  return response;
}
