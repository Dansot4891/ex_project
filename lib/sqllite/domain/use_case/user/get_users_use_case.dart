import 'package:ex_project/sqllite/domain/model/user_model.dart';
import 'package:ex_project/sqllite/domain/repo/user_repository.dart';

class GetUsersUseCase {
  final UserRepository _repository;

  GetUsersUseCase(this._repository);

  Future<List<UserModel>> execute() async {
    return await _repository.getUsers();
  }
}
