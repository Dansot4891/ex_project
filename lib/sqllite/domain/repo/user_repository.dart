import 'package:ex_project/sqllite/domain/model/add_user_model.dart';
import 'package:ex_project/sqllite/domain/model/user_model.dart';

abstract interface class UserRepository {
  Future<List<UserModel>> getUsers();
  Future<List<UserModel>> getUsersOrderBy({
    required String orderBy,
    bool isAscending = true,
  });
  Future<void> addUser(AddUserModel user);
  Future<void> editUser({required int userId, required AddUserModel user});
  Future<void> deleteUser(int userId);
}
