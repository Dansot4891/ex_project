import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ex_project/sqllite/core/db/db_const.dart';

part 'add_user_model.g.dart';

@JsonSerializable()
class AddUserModel {
  @JsonKey(name: DbConst.columnUserName)
  final String userName;

  @JsonKey(name: DbConst.columnUserEmail)
  final String userEmail;

  @JsonKey(name: DbConst.columnUserCreatedAt)
  final DateTime userCreatedAt;

  AddUserModel({
    required this.userName,
    required this.userEmail,
    required this.userCreatedAt,
  });

  Map<String, dynamic> toJson() => _$AddUserModelToJson(this);
}
