

import 'package:dropit/features_auth/domain/usecases/login_use_case.dart';
import 'package:dropit/features_auth/domain/usecases/register_use_case.dart';
import 'package:dropit/features_auth/presentation/Bloc/auth_bloc/auth_event.dart';
import 'package:dropit/features_auth/presentation/Bloc/auth_bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

final RegisterUseCase registerUseCase;
final LoginUseCase loginUseCase;
final _storage = FlutterSecureStorage();

  // Constructor

AuthBloc({required this.registerUseCase, required this.loginUseCase}): super(AuthInitialState()) {
   
on<RegisterEvent>(_onRegisterUser);
on<LoginEvent>(_onLoginUser);



}
Future<void> _onRegisterUser(RegisterEvent event ,Emitter<AuthState> emit) async{

try {
  emit(AuthLoadingState());
  print(event.email + event.username +event.password); 

  final user =  await registerUseCase.call(event.email, event.username, event.password);
  emit(AuthSuccessState(message: "Successfully registered"));
} catch (e) {
  print(e);
  emit(AuthFailureState(error: "Failed to register.$e"));
}
}


// This method handles the login event
Future<void> _onLoginUser(LoginEvent event ,Emitter<AuthState> emit) async{
  
  try {
    emit(AuthLoadingState());

    final user = await loginUseCase.call(event.username, event.password);

    await _storage.write(key: 'token', value: "user.token");  

    emit(AuthSuccessState(message: "Successfully logged in"));
    
  } catch (e) {
    emit(AuthFailureState(error: "Failed to login"));
    
  }
}
}