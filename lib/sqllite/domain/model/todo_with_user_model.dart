import 'package:ex_project/sqllite/core/db/db_const.dart';

class TodoWithUserModel {
  final int todoId;
  final String title;
  final String description;
  final bool completed;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;
  final String userName;
  final String userEmail;

  TodoWithUserModel({
    required this.todoId,
    required this.title,
    required this.description,
    required this.completed,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.userName,
    required this.userEmail,
  });

  factory TodoWithUserModel.fromJson(Map<String, dynamic> json) {
    return TodoWithUserModel(
      todoId: json[DbConst.columnTodoId],
      title: json[DbConst.columnTitle],
      description: json[DbConst.columnDescription],
      completed: json[DbConst.columnCompleted] == 1,
      createdAt: DateTime.parse(json[DbConst.columnCreatedAt]),
      updatedAt: DateTime.parse(json[DbConst.columnUpdatedAt]),
      userId: json[DbConst.columnUserId],
      userName: json[DbConst.columnUserName],
      userEmail: json[DbConst.columnUserEmail],
    );
  }
}
