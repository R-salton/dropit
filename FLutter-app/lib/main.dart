import 'package:dropit/core/theme.dart';
import 'package:dropit/features_auth/data/datasources/auth_remote_datasource.dart';
import 'package:dropit/features_auth/data/repositories/repositories_impl.dart';
import 'package:dropit/features_auth/domain/usecases/login_use_case.dart';
import 'package:dropit/features_auth/domain/usecases/register_use_case.dart';
import 'package:dropit/features_auth/presentation/Bloc/auth_bloc/auth_bloc.dart';
import 'package:dropit/features_auth/presentation/pages/login_page.dart';
import 'package:dropit/features_auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  final authRepository = AuthRepositoryImplentation(AuthRemoteDataSource());
  runApp(MainApp(authRepository: authRepository,));
}
 
class MainApp extends StatelessWidget {
  
  final AuthRepositoryImplentation authRepository;
  MainApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_)=> AuthBloc(registerUseCase: RegisterUseCase(authRepository: authRepository),
          loginUseCase: LoginUseCase(authRepository: authRepository)),
        ),
        
      ],
     
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
             splitScreenMode: true,
             builder: (context, child) => const Scaffold(
              body: Center(
                child: RegisterPage(),
              ),
            
             ),)
        
        ,routes: {
          '/register': (context) => const RegisterPage(),
          '/login': (context) => const LoginPage(),
        },
        ),
    );
    

  }
}
