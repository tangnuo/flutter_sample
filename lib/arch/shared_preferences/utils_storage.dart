import 'package:flutter/material.dart';

import 'shared_preferences.dart';

/// 创建人：xuqing
/// 创建时间：2020年11月8日11:19:44
/// 类说明：SharedPreferencesUtils  存储和取值调用测试类
///
///
///
class UtilsStorage extends StatefulWidget {
  UtilsStorage({Key? key}) : super(key: key);

  @override
  _UtilsStorageState createState() {
    return _UtilsStorageState();
  }
}

class _UtilsStorageState extends State<UtilsStorage> {
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
            ElevatedButton(
              child: Text("存储 "),
              onPressed: () {
                String counter = "1";
                SharedPreferencesUtils.savePreference(
                    context, "counter", counter);
              },
            ),
            ElevatedButton(
              child: Text("取值 "),
              onPressed: () async {
                String counter = await (SharedPreferencesUtils.getPreference(
                    context, "counter", "1")) as String;
                print("counter  -- > " + counter);
                SharedPreferencesUtils.getPreference(context, "counter", "1")
                    .then((value) {
                  print("value   --->" + value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
