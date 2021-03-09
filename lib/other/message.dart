/**
 * 定义消息实体类
 */
class Message {
  final int timestamp;
  final String msg;

  Message(this.timestamp, this.msg);

  Message.create(String msg)
      : msg = msg,
        timestamp = DateTime.now().millisecondsSinceEpoch;

  Message.fromJson(Map<String, dynamic> json)
      : msg = json['msg'],
        timestamp = json['timestamp'];

  Map<String, dynamic> toJson() => {"msg": "$msg", "timestamp": timestamp};

  @override
  String toString() {
    return 'Message{timestamp: $timestamp, msg: $msg}';
  }
}
