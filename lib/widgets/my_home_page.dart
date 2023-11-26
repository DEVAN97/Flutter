// lib/widgets/my_home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_test/blocs/app_bloc.dart';
import 'package:app_test/widgets/widget_1.dart';
import 'package:app_test/widgets/widget_2.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YourBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sample Widget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Widget1(),
              SizedBox(height: 20),
              Widget2(),
            ],
          ),
        ),
      ),
    );
  }
}
