// lib/blocs/your_bloc.dart

import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';

// Define events and states as needed
abstract class YourEvent {}

abstract class YourState {}

class YourBloc extends Bloc<YourEvent, YourState> {
  int _randomNumber = 0;
  int _successCount = 0;

  int get randomNumber => _randomNumber;
  int get successCount => _successCount;

  // Explicitly call the constructor of the Bloc class
  YourBloc() : super(YourInitialState());

  @override
  Stream<YourState> mapEventToState(YourEvent event) async* {
    if (event is GenerateRandomNumberEvent) {
      _generateRandomNumber();
      yield RandomNumberGeneratedState(randomNumber: _randomNumber);
    } else if (event is CheckSuccessEvent) {
      yield* _checkSuccess(event.timestampSeconds);
    }
  }

  void _generateRandomNumber() {
    // Generate a random number between 0 and 59
    _randomNumber = Random().nextInt(60);
  }

  Stream<YourState> _checkSuccess(int timestampSeconds) async* {
    if (_randomNumber == timestampSeconds) {
      _successCount++;
      yield SuccessState(successCount: _successCount);
    } else {
      yield TryAgainState();
    }
  }
}

// Define events and states as needed
class GenerateRandomNumberEvent extends YourEvent {}

class CheckSuccessEvent extends YourEvent {
  final int timestampSeconds;

  CheckSuccessEvent({required this.timestampSeconds});
}

class YourInitialState extends YourState {}

class RandomNumberGeneratedState extends YourState {
  final int randomNumber;

  RandomNumberGeneratedState({required this.randomNumber});
}

class SuccessState extends YourState {
  final int successCount;

  SuccessState({required this.successCount});
}

class TryAgainState extends YourState {}
