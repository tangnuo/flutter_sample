import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'record_dialog.dart';
import 'shared_preferences.dart';
import 'user.dart';

/// *
///
///
/// 创建人：xuqing
/// 创建时间：2020年11月6日10:49:42
/// 类说明：  存储对象
///
///
class CacheBean extends StatefulWidget {
  CacheBean({Key? key}) : super(key: key);

  @override
  _CacheBeanState createState() {
    return _CacheBeanState();
  }
}

class _CacheBeanState extends State<CacheBean> {
  String? _username, _password;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  List<User> datalsit = [];
  String? getdata;
  String? getusername, getpassword;

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
        title: Text("储存bean类"),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller1,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "请输入账号",
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  this._username = value;
                });
              },
            ),
            new Divider(
              height: 2.0,
              color: Colors.black54,
            ),
            TextField(
              controller: controller2,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "请输入密码",
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  this._password = value;
                });
              },
            ),
            new Divider(
              height: 2.0,
              color: Colors.black54,
            ),
            new Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text(
                      "登录",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      User user = new User();
                      user.username = _username;
                      user.password = _password;
                      datalsit.add(user);
                      //SharedPreferencesUtils.setSelectBean(context, user, "data");
                      String jsonStringA = jsonEncode(datalsit);
                      print("jsonStringA   --------- >" + jsonStringA);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("data", jsonStringA);
                    },
                  ),
                )),
            new Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text(
                      "查看登录历史账号信息",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      getdata = await prefs.getString("data");
                      //
                      List datalist =
                          await SharedPreferencesUtils.getSelectBean(
                              context, "data");

                      print("getdata  ---  >" + getdata.toString());
                      showCustomDialog(context, getdata!).then((value) {
                        List list = json.decode(getdata!);
                        setState(() {
                          getusername = list[value]["username"];
                          getpassword = list[value]["password"];
                          controller1.text = getusername!;
                          controller2.text = getpassword!;
                        });
                        print(list[value]["username"]);
                        print(list[value]["password"]);
                      });
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future showCustomDialog(BuildContext context, String getdata) async {
    var result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return RecordDialog(
            jsondata: getdata,
          );
        });

    return result;
  }
}
