
import 'package:dropit/features_auth/presentation/Bloc/auth_bloc/auth_bloc.dart';
import 'package:dropit/features_auth/presentation/Bloc/auth_bloc/auth_event.dart';
import 'package:dropit/features_auth/presentation/Bloc/auth_bloc/auth_state.dart';
import 'package:dropit/features_auth/presentation/widgets/auth_button.dart';
import 'package:dropit/features_auth/presentation/widgets/auth_input_field.dart';
import 'package:dropit/features_auth/presentation/widgets/login_prompt.dart';
import 'package:dropit/features_auth/presentation/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropit/features_auth/presentation/Bloc/auth_bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    final _passwordControl = TextEditingController();
    final _emailControl = TextEditingController();

void _onLogin() {

BlocProvider.of<AuthBloc>(context).add(
  LoginEvent(
    email: _emailControl.text,
    password: _passwordControl.text
    ),
    );


}

@override
  void dispose() {
    _passwordControl.dispose();
    _emailControl.dispose();
    super.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
 

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Padding(padding: const EdgeInsets.all(20,
          ),
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            AuthInputField(label: "Email",icon: Icons.email,controller: _emailControl, isPassowrd: false,),
            AuthInputField(label: "Password",icon: Icons.lock,controller: _passwordControl, isPassowrd: true,),
            
            BlocConsumer<AuthBloc,AuthState>(
              builder: (context,state){
                if(state is AuthLoadingState){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return AuthButton(
                  label: "Login",
                  onPressed: () {
                    _onLogin();
                  },
                );
              },
              listener: (context, state) {
                if( state is AuthSuccessState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.green,
                    )
                  );
                  Navigator.pushNamed(context, "/chatPage");

                }
                else if( state is AuthFailureState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.red,
                    )
                  );
                }
              }
              ),
            
            // Login Prompt
            LoginPrompt(title: "Don't have an account?", subtitle: "Click here to register", onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
            }),
          ],),
          )
        )
      ),
    );
  }

}