import 'package:ex_project/sqllite/domain/model/todo_model.dart';
import 'package:ex_project/sqllite/domain/repo/todo_repository.dart';

class GetTodosUseCase {
  final TodoRepository _repository;

  GetTodosUseCase(this._repository);

  Future<List<TodoModel>> execute() async {
    return await _repository.getTodos();
  }
}
