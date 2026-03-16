part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterStateUpdated extends CounterState {
  final int count;

  CounterStateUpdated({required this.count});
}

final class CounterUpdateInProgress extends CounterState {}
