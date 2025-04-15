

import 'package:dropit/features_auth/domain/entities/user_entity.dart';
import 'package:dropit/features_auth/domain/repositories/auth_repository.dart';

/// Use case for registering a user.
class RegisterUseCase{

  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<UserEntity> call(String email, String username, String password) async {
    return await _authRepository.registerUSer(email, username, password);
  }

  
}


