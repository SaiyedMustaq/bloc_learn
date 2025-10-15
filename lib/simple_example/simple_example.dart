import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class SampleExample extends StatefulWidget {
  const SampleExample({super.key});

  @override
  State<SampleExample> createState() => _SampleExampleState();
}

class _SampleExampleState extends State<SampleExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => CounterBloc(),
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            final bloc = BlocProvider.of<CounterBloc>(context);
            return Column(
              children: [
                Center(child: Text("${state.counterValue}", style: TextStyle(fontSize: 50))),
                Row(
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        bloc.add(CounterIncrementEvent());
                      },
                      child: Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        bloc.add(CounterDecrementEvent());
                      },
                      child: Icon(Icons.minimize),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
