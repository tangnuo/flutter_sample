import 'dart:io';

//文件操作：https://mp.weixin.qq.com/s/sNfRNDzzIcCpFWDmQ6PRXg

//异步版本
void foo() async {
  const filepath = "path to your file";
  var file = File(filepath);

  try {
    bool exists = await file.exists();
    if (!exists) {
      await file.create();
    }
  } catch (e) {
    print(e);
  }
}

//同步版本
void foo2() async {
  const filepath = "path to your file";
  var file = File(filepath);

  try {
    bool exists = await file.existsSync();
    if (!exists) {
      await file.createSync();
    }
  } catch (e) {
    print(e);
  }
}

Future testWriteFile() async {
  const filePath = "slsls";
  var file = File(filePath);
  await file.writeAsString("Hello Dart");

  List<int> toBeWritten = [1, 2, 3];
  await file.writeAsBytes(toBeWritten);
}
