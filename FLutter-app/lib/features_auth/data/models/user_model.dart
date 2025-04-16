

import 'package:dropit/features_auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity{

  UserModel({
    required id,
    required email,
    required username,
    required token,
  }) : super(
    id: id,
    email: email,
    username: username,
    token: token
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      token: json['token'],
    );
  }

}