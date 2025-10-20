import 'package:ex_project/sqllite/data/database/todo_database.dart';
import 'package:ex_project/sqllite/domain/model/add_todo_model.dart';
import 'package:ex_project/sqllite/domain/model/todo_model.dart';
import 'package:ex_project/sqllite/domain/repo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDatabase _database;

  TodoRepositoryImpl(this._database);

  @override
  Future<void> addTodo(AddTodoModel todo) async {
    await _database.addTodo(todo);
  }

  @override
  Future<void> deleteTodo(int todoId) async {
    await _database.deleteTodo(todoId);
  }

  @override
  Future<void> editTodo({
    required int todoId,
    required AddTodoModel todo,
  }) async {
    await _database.editTodo(todoId: todoId, todo: todo);
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    return await _database.getTodos();
  }
}
