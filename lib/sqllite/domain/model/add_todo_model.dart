import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ex_project/sqllite/core/db/db_const.dart';

part 'add_todo_model.g.dart';

@JsonSerializable()
class AddTodoModel {
  final String title;
  final String description;
  final bool completed;

  @JsonKey(name: DbConst.columnCreatedAt)
  final DateTime createdAt;

  @JsonKey(name: DbConst.columnUpdatedAt)
  final DateTime updatedAt;

  AddTodoModel({
    required this.title,
    required this.description,
    required this.completed,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    final json = _$AddTodoModelToJson(this);
    json[DbConst.columnCompleted] = completed ? 1 : 0;
    return json;
  }
}
