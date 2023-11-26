// lib/widgets/widget_1.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_test/blocs/app_bloc.dart';

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YourBloc, YourState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Column(
            children: [
              Text('Success!'),
              Text('Total success count: ${state.successCount}'),
            ],
          );
        } else if (state is TryAgainState) {
          return Text('Try again.');
        } else {
          return Container(); // Initial state or loading state
        }
      },
    );
  }
}
