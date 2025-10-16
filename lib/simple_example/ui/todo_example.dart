import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo/todo_bloc.dart';

class TodoExample extends StatefulWidget {
  const TodoExample({super.key});

  @override
  State<TodoExample> createState() => _TodoExampleState();
}

class _TodoExampleState extends State<TodoExample> {
  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("Todo Example")),
      body: Column(
        children: [
          BlocBuilder<TodoBloc, TodoState>(
            buildWhen: (previous, current) => previous.todos != current.todos,
            builder: (context, state) {
              print("build1");
              return state.todos?.isNotEmpty ?? false
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.todos?.length ?? 0,
                      itemBuilder: (context, index) {
                        final todo = state.todos?[index];
                        return ListTile(
                          title: Text(todo!.title),
                          leading: Checkbox(
                            value: state.todos?[index].isDone,
                            onChanged: (value) {
                              todoBloc.add(UpdateTodo(todo.copyWith(isDone: value)));
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              todoBloc.add(RemoveTodo(todo));
                            },
                          ),
                        );
                      },
                    )
                  : Center(child: Text("No Todo"));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoBloc.add(AddTodo(TodoModel(id: DateTime.now().toString(), title: "Todo ${DateTime.now().microsecond.toString()}", isDone: false)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
