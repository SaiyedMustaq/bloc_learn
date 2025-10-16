part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState({this.todos});
  final List<TodoModel>? todos;

  TodoState copyWith({List<TodoModel>? todos}) {
    return TodoState(todos: todos ?? this.todos);
  }

  @override
  List<Object?> get props => [todos];
}

class TodoModel {
  final String id;
  final String title;
  final bool isDone;

  const TodoModel({required this.id, required this.title, required this.isDone});
  TodoModel copyWith({String? id, String? title, bool? isDone}) {
    return TodoModel(id: id ?? this.id, title: title ?? this.title, isDone: isDone ?? this.isDone);
  }
}
