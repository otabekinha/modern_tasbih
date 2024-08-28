import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:learn_bloc/models/counter.dart';

class CounterCubit extends Cubit<int> {
  late Box<CounterModel> _counterBox;

  CounterCubit() : super(0) {
    _initializeBox();
  }

  Future<void> _initializeBox() async {
    _counterBox = Hive.box<CounterModel>('counterBox');
    _loadCounter();
  }

  void _loadCounter() {
    final counter = _counterBox.get(0);
    if (counter != null) {
      emit(counter.count);
    } else {
      emit(0);
    }
  }

  void increment() {
    final newCount = state + 1;
    emit(newCount);
    _saveCounter(newCount);
  }

  void resetCounter() {
    emit(0);
    _saveCounter(0);
  }

  void _saveCounter(int count) {
    final counter = CounterModel(count: count);
    _counterBox.put(0, counter);
  }
}
