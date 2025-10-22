import 'package:ex_project/sqllite/domain/model/add_todo_model.dart';
import 'package:ex_project/sqllite/domain/repo/todo_repository.dart';

class AddTodoUseCase {
  final TodoRepository _repository;

  AddTodoUseCase(this._repository);

  Future<void> execute(AddTodoModel todo) async {
    await _repository.addTodo(todo);
  }
}
