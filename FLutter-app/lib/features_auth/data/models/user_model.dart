

import 'package:dropit/features_auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity{

  UserModel({
    required id,
    required email,
    required username
  }) : super(
    id: id,
    email: email,
    username: username
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username']
    );
  }

}