import 'package:ex_project/sqllite/data/database/user_database.dart';
import 'package:ex_project/sqllite/domain/model/add_user_model.dart';
import 'package:ex_project/sqllite/domain/model/user_model.dart';
import 'package:ex_project/sqllite/domain/repo/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatabase _database;

  UserRepositoryImpl(this._database);

  @override
  Future<void> addUser(AddUserModel user) async {
    await _database.addUser(user);
  }

  @override
  Future<void> deleteUser(int userId) async {
    await _database.deleteUser(userId);
  }

  @override
  Future<void> editUser({
    required int userId,
    required AddUserModel user,
  }) async {
    await _database.editUser(userId: userId, user: user);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    return await _database.getUsers();
  }

  @override
  Future<List<UserModel>> getUsersOrderBy({
    required String orderBy,
    bool isAscending = true,
  }) async {
    return await _database.getUsersOrderBy(
      orderBy: orderBy,
      isAscending: isAscending,
    );
  }
}
