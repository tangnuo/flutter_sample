import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/other/bloc/counter_cubit/counter_cubit.dart';

/// https://www.cnblogs.com/xdd666/p/13802923.html
class CounterApp extends StatelessWidget {
  CounterCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _cubit = CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterState>(builder: _counter),
    );
  }

  Widget _counter(BuildContext context, CounterState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit范例')),
      body: Center(
        child: Text('点击了 ${state.count} 次', style: TextStyle(fontSize: 30.0)),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => context.bloc<CounterCubit>().increase(),
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              // onPressed: () => context.bloc<CounterCubit>().increaseCount(),
              onPressed: () => _cubit.increaseCount(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              // onPressed: () => context.bloc<CounterCubit>().reduceCount(),
              onPressed: () => _cubit.reduceCount(),
            ),
          ),
        ],
      ),
    );
  }
}
