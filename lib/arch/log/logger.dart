import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'my_file_output.dart';
import 'myprinter.dart';

class MyLogger {
  factory MyLogger() => _getInstance();

  static MyLogger get instance => _getInstance();
  static MyLogger _instance;

  Logger _logger;
  String _today;

  MyLogger._internal();

  static MyLogger _getInstance() {
    if (_instance == null) {
      _instance = MyLogger._internal();
      // _instance.init();
    }
    return _instance;
  }

  void init() async {
    Directory appDocDir = Platform.isAndroid ? await getExternalStorageDirectory() : await getLibraryDirectory();
    String appDocPath = appDocDir.path;
    DateTime dateTime = DateTime.now();
    _today = "${dateTime.year.toString()}_${dateTime.month.toString().padLeft(2, '0')}_${dateTime.day.toString().padLeft(2, '0')}";
    String saveLogPath = appDocPath + "/logs/" + _today + ".log";
    print("MyLogger savelog path：" + saveLogPath);
    if (!await File(saveLogPath).exists()) {
      await File(saveLogPath).create(recursive: true);
    }
    List<LogOutput> list = new List();
    list.add(MyFileOutput(file: File(saveLogPath)));
    list.add(ConsoleOutput());
    var outPut = MultiOutput(list);
    _logger = Logger(
      filter: ProductionFilter(), // Use the default LogFilter (-> only log in debug mode)
      printer: MyPrinter(printTime: true),
      // printer: PrettyPrinter(
      //     methodCount: 2,
      //     // number of method calls to be displayed
      //     errorMethodCount: 8,
      //     // number of method calls if stacktrace is provided
      //     lineLength: 120,
      //     // width of the output
      //     colors: true,
      //     // Colorful log messages
      //     printEmojis: true,
      //     // Print an emoji for each log message
      //     printTime: false // Should each log print contain a timestamp
      //     ), // Use the PrettyPrinter to format and print log
      output: outPut, // Use the default LogOutput (-> send everything to console)
    );
  }

  void info(String msg) {
    DateTime dateTime = DateTime.now();
    String today = "${dateTime.year.toString()}_${dateTime.month.toString().padLeft(2, '0')}_${dateTime.day.toString().padLeft(2, '0')}";
    if (_today != today) {
      init();
    }
    _logger.i("caowj " + msg);
  }

  void error(String msg, dynamic error) {
    DateTime dateTime = DateTime.now();
    String today = "${dateTime.year.toString()}_${dateTime.month.toString().padLeft(2, '0')}_${dateTime.day.toString().padLeft(2, '0')}";
    if (_today != today) {
      init();
    }
    _logger.e(msg, error);
  }
}
