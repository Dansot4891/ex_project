import 'package:ex_project/sqllite/core/db/app_db.dart';
import 'package:ex_project/sqllite/core/db/db_const.dart';
import 'package:ex_project/sqllite/data/database/user_database.dart';
import 'package:ex_project/sqllite/domain/model/add_user_model.dart';
import 'package:ex_project/sqllite/domain/model/todo_with_user_model.dart';
import 'package:ex_project/sqllite/domain/model/user_model.dart';

class UserDatabaseImpl implements UserDatabase {
  final AppDb _appDb;

  UserDatabaseImpl(this._appDb);

  @override
  Future<void> addUser(AddUserModel user) async {
    await _appDb.insert(DbConst.tableUser, user.toJson());
  }

  @override
  Future<void> deleteUser(int userId) async {
    await _appDb.delete(
      table: DbConst.tableUser,
      where: '${DbConst.columnUserId} = ?',
      whereArgs: [userId],
    );
  }

  @override
  Future<void> editUser({
    required int userId,
    required AddUserModel user,
  }) async {
    await _appDb.update(
      table: DbConst.tableUser,
      data: user.toJson(),
      where: '${DbConst.columnUserId} = ?',
      whereArgs: [userId],
    );
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final users = await _appDb.select(DbConst.tableUser);
    return users.map((e) => UserModel.fromJson(e)).toList();
  }

  @override
  Future<List<UserModel>> getUsersOrderBy({
    required String orderBy,
    bool isAscending = true,
  }) async {
    final users = await _appDb.selectWithOrderBy(
      table: DbConst.tableUser,
      orderBy: orderBy,
      isAscending: isAscending,
    );
    return users.map((e) => UserModel.fromJson(e)).toList();
  }

  @override
  Future<List<TodoWithUserModel>> getTodosForUser(int userId) async {
    final results = await _appDb.selectWithJoin(
      mainTable: DbConst.tableTodo,
      joinTable: DbConst.tableUser,
      mainTableKey: DbConst.columnUserId,
      joinTableKey: DbConst.columnUserId,
    );

    // WHERE 조건 적용을 위해 필터링
    final filteredResults = results.where((row) {
      return row[DbConst.columnUserId] == userId;
    }).toList();

    return filteredResults.map((e) => TodoWithUserModel.fromJson(e)).toList();
  }
}
