// Counter Page: responsible for provding CounterCubit for CounterView

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/state/counter_cubit.dart';
import 'package:learn_bloc/state/counter_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(0),
      child: BlocListener<CounterCubit, int>(
        listener: (context, state) {
          if (state == 100) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                content: Text('100 reached'),
              ),
            );
          }
          
        },
        child: const CounterView(),
      ),
    );
  }
}
