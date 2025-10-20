import 'package:ex_project/sqllite/core/db/db_const.dart';
import 'package:sqflite/sqflite.dart';

class AppDb {
  static final AppDb instance = AppDb._instance();
  AppDb._instance();

  late final Database _database;

  Future<void> init() async {
    _database = await openDatabase(
      DbConst.appDbPath,
      version: DbConst.v1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE IF NOT EXISTS ${DbConst.tableTodo} (
          ${DbConst.columnTodoId} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${DbConst.columnTitle} TEXT,
          ${DbConst.columnDescription} TEXT,
          ${DbConst.columnCompleted} INTEGER,
          ${DbConst.columnCreatedAt} TEXT,
          ${DbConst.columnUpdatedAt} TEXT
        );
      ''');
      },
    );
  }

  Future<void> close() async {
    await _database.close();
  }

  Future<List<Map<String, dynamic>>> select(String table) async {
    return await _database.query(table);
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    await _database.insert(table, data);
  }

  Future<void> update({
    required String table,
    required Map<String, dynamic> data,
    required String where,
    required List<Object?> whereArgs,
  }) async {
    await _database.update(table, data, where: where, whereArgs: whereArgs);
  }

  Future<void> delete({
    required String table,
    required String where,
    required List<dynamic> whereArgs,
  }) async {
    await _database.delete(table, where: where, whereArgs: whereArgs);
  }
}
