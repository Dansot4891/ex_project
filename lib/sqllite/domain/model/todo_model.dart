import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ex_project/sqllite/core/db/db_const.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  @JsonKey(name: DbConst.columnTodoId)
  final int todoId;
  final String title;
  final String description;
  final bool completed;

  @JsonKey(name: DbConst.columnCreatedAt)
  final DateTime createdAt;

  @JsonKey(name: DbConst.columnUpdatedAt)
  final DateTime updatedAt;

  TodoModel({
    required this.todoId,
    required this.title,
    required this.description,
    required this.completed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      todoId: json[DbConst.columnTodoId],
      title: json[DbConst.columnTitle],
      description: json[DbConst.columnDescription],
      completed: json[DbConst.columnCompleted] == 1 ? true : false,
      createdAt: DateTime.parse(json[DbConst.columnCreatedAt]),
      updatedAt: DateTime.parse(json[DbConst.columnUpdatedAt]),
    );
  }

  Map<String, dynamic> toJson() {
    final json = _$TodoModelToJson(this);
    json[DbConst.columnCompleted] = completed ? 1 : 0;
    return json;
  }
}
