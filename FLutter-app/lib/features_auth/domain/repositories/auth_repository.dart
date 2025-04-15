import 'package:dropit/features_auth/domain/entities/user_entity.dart';

abstract class AuthRepository{

  Future<UserEntity> registerUSer(String email,String username, String password);
  Future<UserEntity> loginUSer(String email, String password);
  
}