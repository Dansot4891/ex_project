import 'package:ex_project/sqllite/domain/model/add_todo_model.dart';
import 'package:ex_project/sqllite/domain/repo/todo_repository.dart';

class EditTodoUseCase {
  final TodoRepository _repository;

  EditTodoUseCase(this._repository);

  Future<void> execute({
    required int todoId,
    required AddTodoModel todo,
  }) async {
    await _repository.editTodo(todoId: todoId, todo: todo);
  }
}
