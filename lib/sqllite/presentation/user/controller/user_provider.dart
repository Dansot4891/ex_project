import 'package:ex_project/sqllite/core/db/app_db.dart';
import 'package:ex_project/sqllite/core/db/db_const.dart';
import 'package:ex_project/sqllite/data/database/user_database_impl.dart';
import 'package:ex_project/sqllite/data/repo_impl/user_repository_impl.dart';
import 'package:ex_project/sqllite/domain/model/add_user_model.dart';
import 'package:ex_project/sqllite/domain/model/todo_with_user_model.dart';
import 'package:ex_project/sqllite/domain/use_case/user/add_user_use_case.dart';
import 'package:ex_project/sqllite/domain/use_case/user/delete_user_use_case.dart';
import 'package:ex_project/sqllite/domain/use_case/user/edit_user_use_case.dart';
import 'package:ex_project/sqllite/domain/use_case/user/get_todos_for_user_use_case.dart';
import 'package:ex_project/sqllite/domain/use_case/user/get_users_order_by_use_case.dart';
import 'package:ex_project/sqllite/domain/use_case/user/get_users_use_case.dart';
import 'package:ex_project/sqllite/presentation/user/controller/user_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class UserProvider extends _$UserProvider {
  @override
  Future<UserState> build() async {
    final useCase = GetUsersUseCase(
      UserRepositoryImpl(UserDatabaseImpl(AppDb.instance)),
    );
    final users = await useCase.execute();
    return UserState(users: users);
  }

  Future<void> addUser({
    required String userName,
    required String userEmail,
  }) async {
    final useCase = AddUserUseCase(
      UserRepositoryImpl(UserDatabaseImpl(AppDb.instance)),
    );
    final user = AddUserModel(
      userName: userName,
      userEmail: userEmail,
      userCreatedAt: DateTime.now(),
    );
    await useCase.execute(user);
    ref.invalidateSelf();
  }

  Future<void> deleteUser(int userId) async {
    final useCase = DeleteUserUseCase(
      UserRepositoryImpl(UserDatabaseImpl(AppDb.instance)),
    );
    await useCase.execute(userId);
    ref.invalidateSelf();
  }

  Future<void> editUser({
    required int userId,
    required String userName,
    required String userEmail,
  }) async {
    final useCase = EditUserUseCase(
      UserRepositoryImpl(UserDatabaseImpl(AppDb.instance)),
    );
    final user = AddUserModel(
      userName: userName,
      userEmail: userEmail,
      userCreatedAt: DateTime.now(),
    );
    await useCase.execute(userId: userId, user: user);
    ref.invalidateSelf();
  }

  Future<void> getUsersOrderBy({
    required String orderBy,
    bool isAscending = true,
  }) async {
    final useCase = GetUsersOrderByUseCase(
      UserRepositoryImpl(UserDatabaseImpl(AppDb.instance)),
    );
    final users = await useCase.execute(
      orderBy: orderBy,
      isAscending: isAscending,
    );
    state = AsyncValue.data(UserState(users: users));
  }

  Future<List<TodoWithUserModel>> getTodosForUser(int userId) async {
    final useCase = GetTodosForUserUseCase(
      UserRepositoryImpl(UserDatabaseImpl(AppDb.instance)),
    );
    return await useCase.execute(userId);
  }

  /// 테스트 데이터 생성
  Future<void> createTestData() async {
    try {
      final appDb = AppDb.instance;

      // 테스트 User 3명 생성
      final testUsers = [
        {
          DbConst.columnUserName: '홍길동',
          DbConst.columnUserEmail: 'hong@example.com',
          DbConst.columnUserCreatedAt: DateTime.now().toIso8601String(),
        },
        {
          DbConst.columnUserName: '김철수',
          DbConst.columnUserEmail: 'kim@example.com',
          DbConst.columnUserCreatedAt: DateTime.now()
              .subtract(const Duration(days: 1))
              .toIso8601String(),
        },
        {
          DbConst.columnUserName: '이영희',
          DbConst.columnUserEmail: 'lee@example.com',
          DbConst.columnUserCreatedAt: DateTime.now()
              .subtract(const Duration(days: 2))
              .toIso8601String(),
        },
      ];

      // User 삽입
      for (final user in testUsers) {
        await appDb.insert(DbConst.tableUser, user);
      }

      // 생성된 User ID 조회
      final users = await appDb.select(DbConst.tableUser);

      // 각 User에게 Todo 할당
      if (users.isNotEmpty) {
        // 첫 번째 User에게 3개의 Todo
        final user1Id = users[0][DbConst.columnUserId];
        await appDb.insert(DbConst.tableTodo, {
          DbConst.columnTitle: '프로젝트 기획서 작성',
          DbConst.columnDescription: '새 프로젝트 기획서를 작성해야 합니다',
          DbConst.columnCompleted: 0,
          DbConst.columnUserId: user1Id,
          DbConst.columnCreatedAt: DateTime.now().toIso8601String(),
          DbConst.columnUpdatedAt: DateTime.now().toIso8601String(),
        });
        await appDb.insert(DbConst.tableTodo, {
          DbConst.columnTitle: '회의 참석',
          DbConst.columnDescription: '오후 3시 팀 회의',
          DbConst.columnCompleted: 1,
          DbConst.columnUserId: user1Id,
          DbConst.columnCreatedAt: DateTime.now().toIso8601String(),
          DbConst.columnUpdatedAt: DateTime.now().toIso8601String(),
        });
        await appDb.insert(DbConst.tableTodo, {
          DbConst.columnTitle: '코드 리뷰',
          DbConst.columnDescription: 'PR 코드 리뷰 진행',
          DbConst.columnCompleted: 0,
          DbConst.columnUserId: user1Id,
          DbConst.columnCreatedAt: DateTime.now().toIso8601String(),
          DbConst.columnUpdatedAt: DateTime.now().toIso8601String(),
        });

        // 두 번째 User에게 2개의 Todo
        if (users.length > 1) {
          final user2Id = users[1][DbConst.columnUserId];
          await appDb.insert(DbConst.tableTodo, {
            DbConst.columnTitle: '데이터베이스 설계',
            DbConst.columnDescription: 'ERD 작성 및 테이블 설계',
            DbConst.columnCompleted: 1,
            DbConst.columnUserId: user2Id,
            DbConst.columnCreatedAt: DateTime.now().toIso8601String(),
            DbConst.columnUpdatedAt: DateTime.now().toIso8601String(),
          });
          await appDb.insert(DbConst.tableTodo, {
            DbConst.columnTitle: '문서 작성',
            DbConst.columnDescription: 'API 문서 작성',
            DbConst.columnCompleted: 0,
            DbConst.columnUserId: user2Id,
            DbConst.columnCreatedAt: DateTime.now().toIso8601String(),
            DbConst.columnUpdatedAt: DateTime.now().toIso8601String(),
          });
        }

        // 세 번째 User에게 1개의 Todo
        if (users.length > 2) {
          final user3Id = users[2][DbConst.columnUserId];
          await appDb.insert(DbConst.tableTodo, {
            DbConst.columnTitle: '테스트 코드 작성',
            DbConst.columnDescription: '단위 테스트 및 통합 테스트',
            DbConst.columnCompleted: 0,
            DbConst.columnUserId: user3Id,
            DbConst.columnCreatedAt: DateTime.now().toIso8601String(),
            DbConst.columnUpdatedAt: DateTime.now().toIso8601String(),
          });
        }
      }

      // 데이터 새로고침
      ref.invalidateSelf();
    } catch (e) {
      print('테스트 데이터 생성 오류: $e');
      rethrow;
    }
  }
}
