import 'package:ex_project/sqllite/domain/model/user_model.dart';
import 'package:ex_project/sqllite/domain/repo/user_repository.dart';

class GetUsersOrderByUseCase {
  final UserRepository _repository;

  GetUsersOrderByUseCase(this._repository);

  Future<List<UserModel>> execute({
    required String orderBy,
    bool isAscending = true,
  }) async {
    return await _repository.getUsersOrderBy(
      orderBy: orderBy,
      isAscending: isAscending,
    );
  }
}
