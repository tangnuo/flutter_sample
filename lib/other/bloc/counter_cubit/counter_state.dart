part of 'counter_cubit.dart';

// @immutable
// abstract class CounterState {}
// int count;
//
// class CounterInitial extends CounterState {
// }

class CounterState {
  int count;

  CounterState init() {
    return CounterState()..count = 0;
  }

  CounterState clone() {
    return CounterState()..count = count;
  }
}
