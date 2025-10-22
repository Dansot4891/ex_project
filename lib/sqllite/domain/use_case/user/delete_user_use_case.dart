import 'package:ex_project/sqllite/domain/repo/user_repository.dart';

class DeleteUserUseCase {
  final UserRepository _repository;

  DeleteUserUseCase(this._repository);

  Future<void> execute(int userId) async {
    await _repository.deleteUser(userId);
  }
}
