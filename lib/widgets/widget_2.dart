// lib/widgets/widget_2.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_test/blocs/app_bloc.dart';

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dispatch the event to generate a random number
        BlocProvider.of<YourBloc>(context).add(GenerateRandomNumberEvent());

        // Get the current seconds part of the timestamp
        int timestampSeconds = DateTime.now().second;

        // Dispatch the event to check for success
        BlocProvider.of<YourBloc>(context).add(CheckSuccessEvent(timestampSeconds: timestampSeconds));
      },
      child: Container(
        // Implement Widget 2 UI here
        width: 100.0,
        height: 50.0,
        color: Colors.blue, // Replace with your desired color
        child: Center(
          child: Text(
            'Tap me!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
