import 'package:hive/hive.dart';

part 'counter.g.dart';// This file is generated

@HiveType(typeId: 0)
class CounterModel extends HiveObject {
  @HiveField(0)
  int count;

  CounterModel({required this.count});
}
