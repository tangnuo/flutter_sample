# flutter_sample

Flutter学习示例合集。

> 项目编译失败，只能作为参考。

## 注意事项：
- 1、Flutter SDK 需要使用大于2.0.0（Dart 2.12.0）的版本，要支持空安全；
- 2、先执行命令，生成编译文件： *.g.dart
  
    flutter pub run build_runner build



## 问题：

当前使用的Flutter版本是 v2.5.0 和 v2.10.2；项目编译都报错，无法生成*.g.dart文件；

原因： 

Error: Cannot run with sound null safety, because the following dependencies
don't support null safety:

