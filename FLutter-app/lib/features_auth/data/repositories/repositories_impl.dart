

import 'package:dropit/features_auth/data/datasources/auth_remote_datasource.dart';
import 'package:dropit/features_auth/domain/entities/user_entity.dart';
import 'package:dropit/features_auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImplentation implements AuthRepository{

  final AuthRemoteDataSource _authRemoteDataSource;

AuthRepositoryImplentation(this._authRemoteDataSource);


  @override
  Future<UserEntity> loginUSer(String email, String password) async{
    return await _authRemoteDataSource.login(email: email, password: password);
  }
  
  @override
  Future<UserEntity> registerUSer(String email, String username, String password) async {
    return await _authRemoteDataSource.register(email: email, username: username, password: password);
  }

}