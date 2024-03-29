import 'package:flutter/material.dart';

/// Form表单验证：https://book.flutterchina.club/chapter3/input_and_form.html#_3-5-2-%E8%A1%A8%E5%8D%95form
class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Test"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidateMode: AutovalidateMode.onUserInteraction, //开启自动校验
            child: Column(
              children: <Widget>[
                TextFormField(
                    autofocus: true,
                    controller: _unameController,
                    decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        icon: Icon(Icons.person)),
                    // 校验用户名
                    validator: (v) {
                      return v.trim().length > 0 ? null : "用户名不能为空";
                    }),
                TextFormField(
                    controller: _pwdController,
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        icon: Icon(Icons.lock)),
                    obscureText: true, //是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。
                    //校验密码
                    validator: (v) {
                      return v.trim().length > 5 ? null : "密码不能少于6位";
                    }),
                // 登录按钮
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("登录"),
                          ),
                          onPressed: () {
                            //在这里不能通过此方式获取FormState，context不对
                            //print(Form.of(context));

                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              //验证通过提交数据
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
