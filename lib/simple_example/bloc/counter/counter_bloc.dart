import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementEvent>(_addition);
    on<DecrementEvent>(_subtraction);
    on<SwitchEvent>(_changeSwitchValue);
  }
  void _addition(IncrementEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counterValue: state.counterValue + 1));
  }

  void _subtraction(DecrementEvent event, Emitter<CounterState> emit) {
    if (state.counterValue == 0) return;
    emit(state.copyWith(counterValue: state.counterValue - 1));
  }

  void _changeSwitchValue(SwitchEvent event, Emitter<CounterState> emit) {
    emit(CounterState(isSwitchOn: !state.isSwitchOn));
  }
}
