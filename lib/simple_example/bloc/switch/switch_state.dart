part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool isOn;
  final double slider;
  const SwitchState({this.isOn = false, this.slider = 0});

  SwitchState copyWith({bool? isOn, double? slider}) {
    return SwitchState(isOn: isOn ?? this.isOn, slider: slider ?? this.slider);
  }

  @override
  List<Object?> get props => [isOn, slider];
}
