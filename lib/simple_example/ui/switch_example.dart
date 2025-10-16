import 'package:bloc_app/simple_example/bloc/switch/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.isOn != current.isOn,
                  builder: (context, state) {
                    return Switch(
                      value: state.isOn,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(EnableNotification());
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                return Container(height: 200, color: Colors.red.withValues(alpha: state.slider));
              },
            ),
            SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvent(value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
