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
        // User 테이블 생성
        await db.execute('''
        CREATE TABLE IF NOT EXISTS ${DbConst.tableUser} (
          ${DbConst.columnUserId} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${DbConst.columnUserName} TEXT NOT NULL,
          ${DbConst.columnUserEmail} TEXT NOT NULL,
          ${DbConst.columnUserCreatedAt} TEXT NOT NULL
        );
      ''');

        // Todo 테이블 생성 (user_id 포함)
        await db.execute('''
        CREATE TABLE IF NOT EXISTS ${DbConst.tableTodo} (
          ${DbConst.columnTodoId} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${DbConst.columnTitle} TEXT,
          ${DbConst.columnDescription} TEXT,
          ${DbConst.columnCompleted} INTEGER,
          ${DbConst.columnUserId} INTEGER,
          ${DbConst.columnCreatedAt} TEXT,
          ${DbConst.columnUpdatedAt} TEXT,
          FOREIGN KEY (${DbConst.columnUserId}) REFERENCES ${DbConst.tableUser}(${DbConst.columnUserId})
        );
      ''');
      },
    );
  }

  /// 트랜잭션 함수
  /// 여러 함수 실행 중, 하나라도 실패시, 모두 되돌리는 기능
  Future<void> transaction(Future<void> Function(Transaction txn) func) async {
    // Insert some records in a transaction
    await _database.transaction(func);
  }

  /// 데이터베이스 닫기
  Future<void> close() async {
    await _database.close();
  }

  /// 데이터베이스 조회
  Future<List<Map<String, dynamic>>> select(String table) async {
    return await _database.query(table);
  }

  /// 데이터베이스 조회 (orderBy 지원)
  Future<List<Map<String, dynamic>>> selectWithOrderBy({
    required String table,
    required String orderBy,
    bool isAscending = true,
  }) async {
    return await _database.query(
      table,
      orderBy: '$orderBy ${isAscending ? 'ASC' : 'DESC'}',
    );
  }

  /// 데이터베이스 JOIN 조회
  Future<List<Map<String, dynamic>>> selectWithJoin({
    required String mainTable,
    required String joinTable,
    required String mainTableKey,
    required String joinTableKey,
  }) async {
    return await _database.rawQuery('''
    SELECT * FROM $mainTable
    INNER JOIN $joinTable 
    ON $mainTable.$mainTableKey = $joinTable.$joinTableKey
  ''');
  }

  /// 데이터베이스 삽입
  Future<void> insert(String table, Map<String, dynamic> data) async {
    await _database.insert(table, data);
  }

  /// 데이터베이스 업데이트
  Future<void> update({
    required String table,
    required Map<String, dynamic> data,
    required String where,
    required List<Object?> whereArgs,
  }) async {
    await _database.update(table, data, where: where, whereArgs: whereArgs);
  }

  /// 데이터베이스 삭제
  Future<void> delete({
    required String table,
    required String where,
    required List<dynamic> whereArgs,
  }) async {
    await _database.delete(table, where: where, whereArgs: whereArgs);
  }
}
