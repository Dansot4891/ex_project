// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  userId: (json['user_id'] as num).toInt(),
  userName: json['user_name'] as String,
  userEmail: json['user_email'] as String,
  userCreatedAt: DateTime.parse(json['user_created_at'] as String),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'user_id': instance.userId,
  'user_name': instance.userName,
  'user_email': instance.userEmail,
  'user_created_at': instance.userCreatedAt.toIso8601String(),
};
