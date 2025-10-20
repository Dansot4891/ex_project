import 'package:ex_project/sqllite/domain/model/add_todo_model.dart';
import 'package:ex_project/sqllite/domain/model/todo_model.dart';

abstract class TodoDatabase {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo(AddTodoModel todo);
  Future<void> editTodo({required int todoId, required AddTodoModel todo});
  Future<void> deleteTodo(int todoId);
}
