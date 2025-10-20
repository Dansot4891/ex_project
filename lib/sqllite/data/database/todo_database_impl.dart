import 'package:ex_project/sqllite/core/db/app_db.dart';
import 'package:ex_project/sqllite/core/db/db_const.dart';
import 'package:ex_project/sqllite/data/database/todo_database.dart';
import 'package:ex_project/sqllite/domain/model/add_todo_model.dart';
import 'package:ex_project/sqllite/domain/model/todo_model.dart';

class TodoDatabaseImpl implements TodoDatabase {
  final AppDb _appDb;

  TodoDatabaseImpl(this._appDb);

  @override
  Future<void> addTodo(AddTodoModel todo) async {
    await _appDb.insert(DbConst.tableTodo, todo.toJson());
  }

  @override
  Future<void> deleteTodo(int todoId) async {
    await _appDb.delete(
      table: DbConst.tableTodo,
      where: '${DbConst.columnTodoId} = ?',
      whereArgs: [todoId],
    );
  }

  @override
  Future<void> editTodo({
    required int todoId,
    required AddTodoModel todo,
  }) async {
    await _appDb.update(
      table: DbConst.tableTodo,
      data: todo.toJson(),
      where: '${DbConst.columnTodoId} = ?',
      whereArgs: [todoId],
    );
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    final todos = await _appDb.select(DbConst.tableTodo);
    return todos.map((e) => TodoModel.fromJson(e)).toList();
  }
}
