import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

class MyFileOutput extends LogOutput {
  final File file;
  final bool overrideExisting;
  final Encoding encoding;
  IOSink _sink;

  MyFileOutput({
    this.file,
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  @override
  void init() {
    _sink = file.openWrite(
      mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
      encoding: encoding,
    );
  }

  @override
  void output(OutputEvent event) {
    _sink.writeAll(event.lines, '\n');
  }

  @override
  void destroy() async {
    await _sink.flush();
    await _sink.close();
  }
}
