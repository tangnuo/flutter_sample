import 'package:flutter/material.dart';
import 'basic_data.dart';
import 'utils_storage.dart';
import 'cache_bean.dart';
import 'cache_bean_by_utils.dart';


/// https://gitee.com/qiuyu123/fluttercachedemo
class SpApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreferences 各种使用方法"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text("基本数据类型存储"),
              onPressed: (){

                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context){
                        return BasicData();
                      }),
                );
              },

            ),

            RaisedButton(
              child: Text("SharedPreferences 封装使用"),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context){
                        return UtilsStorage();
                      }),
                );
              },

            ),
            RaisedButton(
              child: Text("存储map数据和bean"),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context){
                        return CacheBean();
                      }),
                );
              },
            ),

            RaisedButton(
              child: Text("SharedPreferencesutils 存储map数据和bean"),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context){
                        return CacheBeanByUtils();
                      }),
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}
