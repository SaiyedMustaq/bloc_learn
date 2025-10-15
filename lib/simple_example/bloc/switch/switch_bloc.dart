import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableNotification>(_changeSwitch);
    on<SliderEvent>(_sliderChange);
  }
  void _changeSwitch(EnableNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isOn: !state.isOn));
  }

  void _sliderChange(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.sliderState));
  }
}
