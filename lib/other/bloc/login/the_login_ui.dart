import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/other/bloc/login/the_home_page.dart';
import 'package:flutter_sample/other/bloc/login/the_login_bloc.dart';
import 'package:flutter_sample/other/bloc/login/the_login_event.dart';
import 'package:flutter_sample/other/bloc/login/the_login_state.dart';

/// https://blog.csdn.net/mubowen666/article/details/107205674/

class BlocLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoginInitialState()),
      child: MaterialApp(
        title: 'Bloc 登录示例',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameCtr = new TextEditingController();
  final pwdCtr = new TextEditingController();

  @override
  void initState() {
    super.initState();
    nameCtr.addListener(() {
      print('name输入框的实时变化::::${nameCtr.text}');
    });
    pwdCtr.addListener(() {
      print('pwd输入框的实时变化::::${pwdCtr.text}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameCtr.removeListener(() {});
    nameCtr.dispose();
    pwdCtr.removeListener(() {});
    pwdCtr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginInitialState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                nameTF(),
                pwdTF(),
                loginBtn(context, () {
                  //发送点击的event消息
                  BlocProvider.of<LoginBloc>(context).add(
                      LoginPressEvent(nameCtr.text.trim(), pwdCtr.text.trim()));
                }),
              ],
            );
          }

          if (state is LoginInProgressState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LoginSuccessState) {
            return SuccessDialog();
          }

          if (state is LoginFailureState) {
            final currentState = state;
            return Center(
              child: Text(
                currentState.errMsg,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget nameTF() {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: TextField(
        controller: nameCtr,
        decoration: InputDecoration(
            fillColor: Color(0x30cccccc),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x00FF0000)),
                borderRadius: BorderRadius.circular(100)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x00FF0000)),
                borderRadius: BorderRadius.circular(100)),
            hintText: '请输入用户名'),
      ),
    );
  }

  Widget pwdTF() {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      width: double.infinity,
      child: TextField(
        controller: pwdCtr,
        decoration: InputDecoration(
          fillColor: Color(0x30cccccc),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00FF0000)),
              borderRadius: BorderRadius.circular(100)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00FF0000)),
              borderRadius: BorderRadius.circular(100)),
          hintText: '请输入密码',
        ),
        obscureText: true,
      ),
    );
  }

  Widget loginBtn(context, onPressed) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          '登录',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class SuccessDialog extends StatefulWidget {
  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  /// 登录成功后，跳转到主页
  Future<void> waitFuture() async {
    await Future.delayed(Duration(milliseconds: 500));

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  void initState() {
    super.initState();
    waitFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '登录成功',
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
