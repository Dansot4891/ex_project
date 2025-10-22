import 'package:ex_project/sqllite/domain/model/add_user_model.dart';
import 'package:ex_project/sqllite/domain/repo/user_repository.dart';

class AddUserUseCase {
  final UserRepository _repository;

  AddUserUseCase(this._repository);

  Future<void> execute(AddUserModel user) async {
    await _repository.addUser(user);
  }
}
