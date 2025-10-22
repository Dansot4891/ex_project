abstract class DbConst {
  // 앱 데이터베이스
  static const String appDbPath = 'app.db';

  // 데이터베이스 버전
  static const int v1 = 1;

  // Todo 테이블
  static const String tableTodo = 'todos';
  static const String columnTodoId = 'todo_id';
  static const String columnTitle = 'title';
  static const String columnDescription = 'description';
  static const String columnCompleted = 'completed';
  static const String columnCreatedAt = 'created_at';
  static const String columnUpdatedAt = 'updated_at';

  // User 테이블
  static const String tableUser = 'users';
  static const String columnUserId = 'user_id';
  static const String columnUserName = 'user_name';
  static const String columnUserEmail = 'user_email';
  static const String columnUserCreatedAt = 'user_created_at';
}
