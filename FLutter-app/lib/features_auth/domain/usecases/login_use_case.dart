import 'package:dropit/features_auth/domain/entities/user_entity.dart';
import 'package:dropit/features_auth/domain/repositories/auth_repository.dart';

class LoginUseCase{
final AuthRepository authRepository;

LoginUseCase({ required this.authRepository});

Future<UserEntity> call(String email, String password) async {
  return await authRepository.loginUSer(email, password);
}
}