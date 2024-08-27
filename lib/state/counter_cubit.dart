// CUBIT - Simplified version of Bloc for easy state management

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  // increment
  void increment() => emit(state + 1);

  // decrement
  void decrement() => emit(state - 1);

  void resetCounter() => emit(0);
}
