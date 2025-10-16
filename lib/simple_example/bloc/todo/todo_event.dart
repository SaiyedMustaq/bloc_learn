part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object?> get props => [];
}

class AddTodo extends TodoEvent {
  const AddTodo(this.todo);
  final TodoModel todo;
  @override
  List<Object?> get props => [todo];
}

class RemoveTodo extends TodoEvent {
  const RemoveTodo(this.todo);
  final TodoModel todo;
  @override
  List<Object?> get props => [todo];
}

class UpdateTodo extends TodoEvent {
  const UpdateTodo(this.todo);
  final TodoModel todo;
  @override
  List<Object?> get props => [todo];
}
