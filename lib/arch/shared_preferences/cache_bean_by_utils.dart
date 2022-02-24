import 'package:flutter/material.dart';

import 'record_dialog_by_utils.dart';
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
class CacheBeanByUtils extends StatefulWidget {
  CacheBeanByUtils({Key? key}) : super(key: key);

  @override
  _CacheBeanByUtilsState createState() {
    return _CacheBeanByUtilsState();
  }
}

class _CacheBeanByUtilsState extends State<CacheBeanByUtils> {
  String? _username, _password;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  List<User> _userlsit = [];
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
        title: Text("使用工具类储存bean类"),
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    child: Text(
                      "登录",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      User user = new User();
                      user.username = _username;
                      user.password = _password;
                      _userlsit.add(user);
                      SharedPreferencesUtils.setSelectBeanList(
                          context, _userlsit, "data");
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    child: Text(
                      "查看登录历史账号信息",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      List datalist =
                          await SharedPreferencesUtils.getSelectBean(
                              context, "data");
                      showCustomDialog(context, datalist).then((value) {
                        setState(() {
                          getusername = datalist[value]["username"];
                          getpassword = datalist[value]["password"];
                          controller1.text = getusername!;
                          controller2.text = getpassword!;
                        });
                        print(datalist[value]["username"]);
                        print(datalist[value]["password"]);
                      });
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future showCustomDialog(BuildContext context, List list) async {
    var result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return RecordDialogByUtils(
            list: list,
          );
        });
    return result;
  }
}
