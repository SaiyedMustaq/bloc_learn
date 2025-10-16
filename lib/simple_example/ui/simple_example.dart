import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_bloc.dart';

class SampleExample extends StatefulWidget {
  const SampleExample({super.key});

  @override
  State<SampleExample> createState() => _SampleExampleState();
}

class _SampleExampleState extends State<SampleExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: CounterView());
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text("${state.counterValue}", style: TextStyle(fontSize: 50));
            },
          ),
        ),
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementEvent());
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(DecrementEvent());
              },
              child: Icon(Icons.minimize),
            ),
          ],
        ),
      ],
    );
  }
}
