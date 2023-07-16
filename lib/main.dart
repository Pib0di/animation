import 'package:animation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const App());
}

class CounterObserver extends BlocObserver {
  const CounterObserver();

  // @override
  // void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
  //   super.onChange(bloc, change);
  //   // ignore: avoid_print
  //   print('${bloc.runtimeType} $change');
  // }
}
