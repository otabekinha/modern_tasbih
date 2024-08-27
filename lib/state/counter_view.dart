import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_bloc/state/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Tasbih',
          style: GoogleFonts.abel(
            textStyle: const TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final shouldReset = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    textAlign: TextAlign.center,
                    'Are you sure you would like to reset?',
                    style: GoogleFonts.abel(
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  actions: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey.shade500,
                      ),
                      onPressed: () => Navigator.of(context).pop(false), // No
                      child: Text(
                        'No',
                        style: GoogleFonts.abel(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green,
                      ),
                      onPressed: () => Navigator.of(context).pop(true), // Yes
                      child: Text(
                        'Yes',
                        style: GoogleFonts.abel(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );

              // Check the user response
              if (shouldReset == true) {
                // Update state via cubit
                context.read<CounterCubit>().resetCounter();
              }
            },
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
          ),
        ],
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
                        'Tasbih Counter',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '/33',
                            style: GoogleFonts.abel(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.border_color_outlined,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
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
