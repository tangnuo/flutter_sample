part of 'counter_cubit.dart';

// @immutable
// abstract class CounterState {}
// int count;
//
// class CounterInitial extends CounterState {
// }

class CounterState {
  late int count;

  ///初始化方法
  CounterState init() {
    return CounterState()..count = 0;
  }

  ///克隆方法,针对于刷新界面数据
  CounterState clone() {
    return CounterState()..count = count;
  }
}
