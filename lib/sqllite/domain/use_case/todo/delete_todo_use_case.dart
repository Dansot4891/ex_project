import 'package:ex_project/sqllite/domain/repo/todo_repository.dart';

class DeleteTodoUseCase {
  final TodoRepository _repository;

  DeleteTodoUseCase(this._repository);

  Future<void> execute(int todoId) async {
    await _repository.deleteTodo(todoId);
  }
}
