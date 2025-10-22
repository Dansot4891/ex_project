import 'package:ex_project/sqllite/core/db/app_db.dart';
import 'package:ex_project/sqllite/data/database/todo_database_impl.dart';
import 'package:ex_project/sqllite/data/repo_impl/todo_repository_impl.dart';
import 'package:ex_project/sqllite/domain/model/add_todo_model.dart';
import 'package:ex_project/sqllite/domain/model/todo_model.dart';
import 'package:ex_project/sqllite/domain/use_case/todo/add_todo_use_case.dart';
import 'package:ex_project/sqllite/domain/use_case/todo/delete_todo_use_case.dart';
import 'package:ex_project/sqllite/domain/use_case/todo/edit_todo_use_case.dart';
import 'package:ex_project/sqllite/domain/use_case/todo/get_todos_use_case.dart';
import 'package:ex_project/sqllite/presentation/todo/controller/todo_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoProvider extends _$TodoProvider {
  @override
  Future<TodoState> build() async {
    final useCase = GetTodosUseCase(
      TodoRepositoryImpl(TodoDatabaseImpl(AppDb.instance)),
    );
    final todos = await useCase.execute();
    return TodoState(todos: todos);
  }

  Future<void> addTodo() async {
    final useCase = AddTodoUseCase(
      TodoRepositoryImpl(TodoDatabaseImpl(AppDb.instance)),
    );
    final todo = AddTodoModel(
      title: '수정된 Todo',
      description: '수정된 Todo 설명',
      completed: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await useCase.execute(todo);
    ref.invalidateSelf();
  }

  Future<void> deleteTodo(int todoId) async {
    final useCase = DeleteTodoUseCase(
      TodoRepositoryImpl(TodoDatabaseImpl(AppDb.instance)),
    );
    await useCase.execute(todoId);
    ref.invalidateSelf();
  }

  Future<void> editTodo(int todoId) async {
    final useCase = EditTodoUseCase(
      TodoRepositoryImpl(TodoDatabaseImpl(AppDb.instance)),
    );
    final todo = AddTodoModel(
      title: '수정된 Todo',
      description: '수정된 Todo 설명',
      completed: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await useCase.execute(todoId: todoId, todo: todo);
    ref.invalidateSelf();
  }
}
