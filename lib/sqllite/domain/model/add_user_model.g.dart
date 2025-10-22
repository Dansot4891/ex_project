// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserModel _$AddUserModelFromJson(Map<String, dynamic> json) => AddUserModel(
  userName: json['user_name'] as String,
  userEmail: json['user_email'] as String,
  userCreatedAt: DateTime.parse(json['user_created_at'] as String),
);

Map<String, dynamic> _$AddUserModelToJson(AddUserModel instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'user_created_at': instance.userCreatedAt.toIso8601String(),
    };
