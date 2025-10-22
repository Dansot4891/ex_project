import 'package:ex_project/sqllite/domain/model/user_model.dart';

class UserState {
  final List<UserModel> users;

  UserState({required this.users});

  UserState copyWith({List<UserModel>? users}) {
    return UserState(users: users ?? this.users);
  }
}
