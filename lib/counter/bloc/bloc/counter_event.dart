part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class IncrementCounterEvent extends CounterEvent {}

final class ChangeScreenColorEvent extends CounterEvent {}
