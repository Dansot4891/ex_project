import 'package:ex_project/sqllite/domain/model/todo_with_user_model.dart';
import 'package:ex_project/sqllite/domain/repo/user_repository.dart';

class GetTodosForUserUseCase {
  final UserRepository _repository;

  GetTodosForUserUseCase(this._repository);

  Future<List<TodoWithUserModel>> execute(int userId) async {
    return await _repository.getTodosForUser(userId);
  }
}
