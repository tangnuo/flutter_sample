import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/other/bloc/login/the_login_bloc.dart';
import 'package:flutter_sample/other/bloc/login/the_login_page.dart';
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
