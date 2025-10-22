import 'package:ex_project/sqllite/domain/model/add_user_model.dart';
import 'package:ex_project/sqllite/domain/repo/user_repository.dart';

class EditUserUseCase {
  final UserRepository _repository;

  EditUserUseCase(this._repository);

  Future<void> execute({
    required int userId,
    required AddUserModel user,
  }) async {
    await _repository.editUser(userId: userId, user: user);
  }
}
