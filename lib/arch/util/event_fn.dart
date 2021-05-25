// 引入 eventBus 包文件
import 'package:event_bus/event_bus.dart';

// 创建EventBus
EventBus eventBus = new EventBus();

class CarEventFn{
  // 想要接收的数据时什么类型的，就定义相同类型的变量
  dynamic obj;
  CarEventFn({this.obj});
}

///发送事件
/// eventBus.fire(CarEventFn());