import 'package:ex_project/sqllite/domain/model/todo_model.dart';

class TodoState {
  final List<TodoModel> todos;

  TodoState({required this.todos});

  TodoState copyWith({List<TodoModel>? todos}) {
    return TodoState(todos: todos ?? this.todos);
  }
}
