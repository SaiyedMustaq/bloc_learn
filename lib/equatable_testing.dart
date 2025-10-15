import 'package:flutter/material.dart';

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
            //TODO it will return true when you compare same object like person==person2
            print(person.hashCode);
            print(person2.hashCode);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}
