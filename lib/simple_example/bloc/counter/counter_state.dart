part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool isSwitchOn;
  const CounterState({this.counterValue = 0, this.isSwitchOn = false});

  CounterState copyWith({int? counterValue, bool? isSwitchOn}) {
    return CounterState(counterValue: counterValue ?? this.counterValue, isSwitchOn: isSwitchOn ?? this.isSwitchOn);
  }

  @override
  List<Object?> get props => [counterValue, isSwitchOn];
}
