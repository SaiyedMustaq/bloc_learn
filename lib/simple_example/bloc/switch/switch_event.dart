part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

final class EnableNotification extends SwitchEvent {
  const EnableNotification();
}

final class SliderEvent extends SwitchEvent {
  const SliderEvent(this.sliderState);
  final double sliderState;
}
