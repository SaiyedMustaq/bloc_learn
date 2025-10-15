import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncrementEvent) {
        emit(CounterState(state.counterValue + 1));
      } else if (event is CounterDecrementEvent) {
        if (state.counterValue == 0) return;
        emit(CounterState(state.counterValue - 1));
      }
    });
  }
}
