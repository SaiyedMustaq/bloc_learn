import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todos: [])) {
    on<AddTodo>(todoAdded);
    on<RemoveTodo>(todoDelete);
    on<UpdateTodo>(todoUpdate);
  }

  void todoAdded(AddTodo event, Emitter<TodoState> emit) {
    emit(state.copyWith(todos: [...state.todos ?? [], event.todo]));
  }

  void todoDelete(RemoveTodo event, Emitter<TodoState> emit) {
    //remove todo from list
    emit(state.copyWith(todos: state.todos?.where((todo) => todo.id != event.todo.id).toList()));
  }

  //update todo
  void todoUpdate(UpdateTodo event, Emitter<TodoState> emit) {
    emit(state.copyWith(todos: state.todos?.map((todo) => todo.id == event.todo.id ? event.todo : todo).toList()));
  }
}
