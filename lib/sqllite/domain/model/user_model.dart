import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ex_project/sqllite/core/db/db_const.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: DbConst.columnUserId)
  final int userId;

  @JsonKey(name: DbConst.columnUserName)
  final String userName;

  @JsonKey(name: DbConst.columnUserEmail)
  final String userEmail;

  @JsonKey(name: DbConst.columnUserCreatedAt)
  final DateTime userCreatedAt;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userCreatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json[DbConst.columnUserId],
      userName: json[DbConst.columnUserName],
      userEmail: json[DbConst.columnUserEmail],
      userCreatedAt: DateTime.parse(json[DbConst.columnUserCreatedAt]),
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
