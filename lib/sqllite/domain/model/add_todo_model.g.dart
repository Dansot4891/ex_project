// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTodoModel _$AddTodoModelFromJson(Map<String, dynamic> json) => AddTodoModel(
  title: json['title'] as String,
  description: json['description'] as String,
  completed: json['completed'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$AddTodoModelToJson(AddTodoModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'completed': instance.completed,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
