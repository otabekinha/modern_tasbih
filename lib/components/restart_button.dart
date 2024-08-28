import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_bloc/state/counter_cubit.dart';

class RestartIconButton extends StatelessWidget {
  const RestartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
    );
  }
}
