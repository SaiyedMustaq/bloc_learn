import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            final person = Person("Mustaq", 22);
            final person2 = Person("Mustaq", 22);
            print(person == person);
            //TODO it will return true when you compare same object like person==person
            print(person == person2);
            //TODO it will return true when you compare same object like person==person
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class Person extends Equatable {
  final String name;
  final int age;

  const Person(this.name, this.age);

  @override
  // TODO: implement props
  List<Object?> get props => [name, age];
}
