import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static showToast(String content) {
    Fluttertoast.showToast(msg: content, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
  }


  static showLocationToast(BuildContext context, String s) {
    FToast().init(context);
    FToast().showToast(
      child: _locationToast(s),
      toastDuration: Duration(seconds: 1),
    );
  }
  static showErrorLocationToast(BuildContext context, String s) {
    FToast().init(context);
    FToast().showToast(
      child: _errorLocationToast(s),
      toastDuration: Duration(seconds: 2),);
  }
    static    _errorLocationToast(String s){
      return Card(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Color(0xFFFFCECC)),
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.close,
                    size: 25,
                    color: Color(0xFFFF0F19),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "$s",
                  style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
                )
              ],
            ),
          ));
    }
    static _locationToast(String s) {
      return Card(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Color(0xFFC2DEFF)),
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.check,
                    size: 25,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "$s",
                  style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
                )
              ],
            ),
          ));
    }


}
