import 'package:intl/intl.dart';

class DateTimeUtil{
  static String format(int time){
    return  DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.fromMillisecondsSinceEpoch(time??0));
  }
  static String formatTime(DateTime time){
    return  DateFormat("yyyy-MM-dd HH:mm:ss").format(time);
  }

  static String formatDate(DateTime time){
    return  DateFormat("yyyy-MM-dd").format(time);
  }
  static String formatDateMinute(DateTime time){
    return  DateFormat("yyyy-MM-dd HH:mm").format(time);
  }

  static String formatSubmitTime(DateTime time){
    return  DateFormat("yyyy-MM-dd HH:mm:00").format(time);
  }
}