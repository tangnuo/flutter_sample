import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/***
 * 创建人：xuqing
 * 创建时间：2020年11月5日11:54:16
 * 类说明： shared_preferences  存储基本数据类型
 */
class BasicData extends StatefulWidget {
  BasicData({Key? key}) : super(key: key);

  @override
  _BasicDataState createState() {
    return _BasicDataState();
  }
}

class _BasicDataState extends State<BasicData> {
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
        title: Text("基本数据类型存储"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text("储存 int类型数据 "),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                int counter = 1;
                await prefs.setInt('counter', counter);
              },
            ),
            RaisedButton(
              child: Text("储存 String类型数据 "),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String counter = "1";
                await prefs.setString('counter', counter);
              },
            ),
            RaisedButton(
              child: Text("储存 bool类型数据 "),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                bool counter = false;
                await prefs.setBool('counter', counter);
              },
            ),
            RaisedButton(
              child: Text("储存 double类型数据 "),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                double counter = 0.01;
                await prefs.setDouble('counter', counter);
              },
            ),
            RaisedButton(
              child: Text("储存 list<String>data类型数据 "),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                List<String> counter = ["1", "2"];
                await prefs.setStringList('counter', counter);
              },
            ),
            RaisedButton(
              child: Text("取值 "),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                int counterint = prefs.getInt("counter");
                String counter = prefs.getString("counter");
                bool counterbool = prefs.getBool("counter");
                double counterdouble = prefs.getDouble("counter");
                List counterlist = prefs.getStringList("counter");
              },
            ),
          ],
        ),
      ),
    );
  }
}
