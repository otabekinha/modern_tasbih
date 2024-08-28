import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_bloc/components/restart_button.dart';
import 'package:learn_bloc/state/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Tasbeh',
          style: GoogleFonts.abel(
            textStyle: const TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ),
        actions: const [RestartIconButton()],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backrground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tasbeh',
                        style: GoogleFonts.abel(
                          textStyle: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            height: 1.0,
                          ),
                        ),
                      ),
                      BlocBuilder<CounterCubit, int>(
                        builder: (context, state) {
                          String formattedState = state
                              .toString()
                              .padLeft(2, '0'); // Ensures two digits
                          return Text(
                            formattedState,
                            style: GoogleFonts.abel(
                              textStyle: const TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                                height: 1.0,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          context.read<CounterCubit>().increment();
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 15,
                                blurRadius: 15,
                                color: Colors.orange.withOpacity(0.3),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
