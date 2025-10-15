import 'package:bloc_app/simple_example/ui/simple_example.dart';
import 'package:bloc_app/simple_example/ui/switch_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'equatable_testing.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const SwitchExample(),
    );
  }
}
