import 'package:flutter/material.dart';

/// 消息通知
/// https://book.flutterchina.club/chapter8/notification.html
class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() {
    return new NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    //监听通知
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + "  ";
        });
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("消息通知"),
        ),
        body: buildBody(),
      ),
    );
  }

  Center buildBody() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Builder(
            builder: (context) {
              return RaisedButton(
                //按钮点击时分发通知
                onPressed: () => MyNotification("Hi").dispatch(context),
                child: Text("Send Notification"),
              );
            },
          ),
          Text(_msg)
        ],
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
