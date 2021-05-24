import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

// class CounterCubit extends Cubit<CounterState> {
//   CounterCubit() : super(CounterInitial());
// }


class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState().init());

  ///自增
  void increaseCount() => emit(state.clone()..count = ++state.count);
  ///自减
  void reduceCount() => emit(state.clone()..count = --state.count);
}
