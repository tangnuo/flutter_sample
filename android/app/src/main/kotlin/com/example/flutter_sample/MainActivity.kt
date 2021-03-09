package com.example.flutter_sample

import android.app.AlertDialog
import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private lateinit var methodChannel: MethodChannel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //io.flutter.app.FlutterActivity 需要代码手动注册；
//        GeneratedPluginRegistrant.registerWith(this);//1、注册插件
//        methodChannel = new MethodChannel(getFlutterView(), "com.example.flutter_demo/dialog");//2、创建一个MethodChannel

//        methodChannel = new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), "com.example.flutter_demo/dialog");//2、创建一个MethodChannel
        methodChannel = MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, "com.example.flutter_demo/text") //2、创建一个MethodChannel
        methodChannel.setMethodCallHandler(object : MethodChannel.MethodCallHandler {
            //3、监听回调的数据
            override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
                if ("dialog" == methodCall.method) {
                    if (methodCall.hasArgument("content")) {
                        showAlertDialog()
                        result.success("弹出成功") //4、向Flutter端发送数据
                    } else {
                        result.error("error", "弹出失败", "content is null")
                    }
                } else {
                    //Android端没有实现Flutter端需要的方法，会将notImplemented返回给Flutter端。
                    result.notImplemented()
                }
            }

            private fun showAlertDialog() {
                val builder = AlertDialog.Builder(this@MainActivity)
                builder.setPositiveButton("确定", null)
                builder.setTitle("Flutter调用Android")
                builder.show()
            }
        })

//        startActivity(new Intent(this, TestActivity.class));
    }


    override fun onResume() {
        super.onResume()
        val map: MutableMap<String, String> = mutableMapOf()
        map["content"] = "这是Android传递给Flutter的值"
        methodChannel.invokeMethod("showText", map, object : MethodChannel.Result {
            override fun notImplemented() {
                Log.d("caowj", "notImplemented")
            }

            override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
                Log.d("caowj", "errorCode:$errorCode errorMsg:$errorMessage errorDetail:$errorDetails")
            }

            override fun success(result: Any?) {
                Log.d("caowj", "成功：$result")
            }
        })
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        //  FlutterLogger.i("FlutterLoader configureFlutterEngine =" );
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
