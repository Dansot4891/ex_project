import 'package:ex_project/sqllite/core/db/db_const.dart';
import 'package:ex_project/sqllite/presentation/user/controller/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userProviderProvider);
    final notifier = ref.read(userProviderProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.data_object),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('테스트 데이터 생성'),
                  content: const Text(
                    '테스트 User 3명과 각각의 Todo를 생성합니다.\n\n'
                    '- 홍길동: Todo 3개\n'
                    '- 김철수: Todo 2개\n'
                    '- 이영희: Todo 1개\n\n'
                    'JOIN 기능을 테스트할 수 있습니다.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('취소'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await notifier.createTestData();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('테스트 데이터가 생성되었습니다!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      child: const Text('생성'),
                    ),
                  ],
                ),
              );
            },
            tooltip: '테스트 데이터 생성',
          ),
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('정렬 기준 선택'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('이름 오름차순'),
                        onTap: () {
                          notifier.getUsersOrderBy(
                            orderBy: DbConst.columnUserName,
                            isAscending: true,
                          );
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('이름 내림차순'),
                        onTap: () {
                          notifier.getUsersOrderBy(
                            orderBy: DbConst.columnUserName,
                            isAscending: false,
                          );
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('생성일 오름차순'),
                        onTap: () {
                          notifier.getUsersOrderBy(
                            orderBy: DbConst.columnUserCreatedAt,
                            isAscending: true,
                          );
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('생성일 내림차순'),
                        onTap: () {
                          notifier.getUsersOrderBy(
                            orderBy: DbConst.columnUserCreatedAt,
                            isAscending: false,
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: state.when(
        data: (data) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: data.users.length,
                    itemBuilder: (context, index) {
                      final user = data.users[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          title: Text(user.userName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email: ${user.userEmail}'),
                              Text('ID: ${user.userId}'),
                              Text('생성일: ${user.userCreatedAt}'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.list_alt),
                                onPressed: () {
                                  _showUserTodosDialog(
                                    context,
                                    notifier,
                                    userId: user.userId,
                                    userName: user.userName,
                                  );
                                },
                                tooltip: 'Todo 보기',
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _showEditUserDialog(
                                    context,
                                    notifier,
                                    userId: user.userId,
                                    currentName: user.userName,
                                    currentEmail: user.userEmail,
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _showDeleteConfirmDialog(
                                    context,
                                    () => notifier.deleteUser(user.userId),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showAddUserDialog(context, notifier);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add User'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          debugPrint(error.toString());
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _showAddUserDialog(BuildContext context, UserProvider notifier) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '이름',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: '이메일',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty) {
                notifier.addUser(
                  userName: nameController.text,
                  userEmail: emailController.text,
                );
                Navigator.pop(context);
              }
            },
            child: const Text('추가'),
          ),
        ],
      ),
    );
  }

  void _showEditUserDialog(
    BuildContext context,
    UserProvider notifier, {
    required int userId,
    required String currentName,
    required String currentEmail,
  }) {
    final nameController = TextEditingController(text: currentName);
    final emailController = TextEditingController(text: currentEmail);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '이름',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: '이메일',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty) {
                notifier.editUser(
                  userId: userId,
                  userName: nameController.text,
                  userEmail: emailController.text,
                );
                Navigator.pop(context);
              }
            },
            child: const Text('수정'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmDialog(BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('삭제 확인'),
        content: const Text('정말 이 사용자를 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () {
              onConfirm();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('삭제'),
          ),
        ],
      ),
    );
  }

  void _showUserTodosDialog(
    BuildContext context,
    UserProvider notifier, {
    required int userId,
    required String userName,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$userName의 Todo 목록'),
        content: FutureBuilder(
          future: notifier.getTodosForUser(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (snapshot.hasError) {
              return SizedBox(
                height: 100,
                child: Center(child: Text('오류: ${snapshot.error}')),
              );
            }

            final todos = snapshot.data ?? [];

            if (todos.isEmpty) {
              return const SizedBox(
                height: 100,
                child: Center(child: Text('할 일이 없습니다.')),
              );
            }

            return SizedBox(
              width: double.maxFinite,
              height: 400,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        todo.completed
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: todo.completed ? Colors.green : Colors.grey,
                      ),
                      title: Text(todo.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(todo.description),
                          const SizedBox(height: 4),
                          Text(
                            '생성: ${todo.createdAt.toString().split('.')[0]}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('닫기'),
          ),
        ],
      ),
    );
  }
}
