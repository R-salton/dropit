
import 'package:dropit/features_auth/presentation/Bloc/auth_bloc/auth_bloc.dart';
import 'package:dropit/features_auth/presentation/Bloc/auth_bloc/auth_event.dart';
import 'package:dropit/features_auth/presentation/Bloc/auth_bloc/auth_state.dart';
import 'package:dropit/features_auth/presentation/widgets/auth_button.dart';
import 'package:dropit/features_auth/presentation/widgets/auth_input_field.dart';
import 'package:dropit/features_auth/presentation/widgets/login_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
   final _usernameControl = TextEditingController();
    final _passwordControl = TextEditingController();
    final _emailControl = TextEditingController();



@override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward(); // Start animation
  }

void _onRegister() {

 

  BlocProvider.of<AuthBloc>(context).add(
    RegisterEvent(
      username: _usernameControl.text,
      email: _emailControl.text,
      password: _passwordControl.text));
}

@override
  void dispose() {
    _usernameControl.dispose();
    _passwordControl.dispose();
    _emailControl.dispose();
    _controller.dispose();
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
            AuthInputField(label: "Username",icon: Icons.person,controller: _usernameControl, isPassowrd: false,),
            AuthInputField(label: "Email",icon: Icons.email,controller: _emailControl, isPassowrd: false,),
            AuthInputField(label: "Password",icon: Icons.lock,controller: _passwordControl, isPassowrd: true,),
           
           BlocConsumer<AuthBloc,AuthState>(
            builder: (context , state){
              if( state is AuthLoadingState){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } 
              return AuthButton(label: "Register", onPressed: _onRegister); 
            },
            listener: (context, state){
              if(state is AuthSuccessState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${state.message} Please login to continue"),
                  
                ));
                Navigator.pushNamed(context, "/login");
              }
              else if ( state is AuthFailureState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${state.error} Please try again"),
                 
                ));

              }
            }
            ),
            LoginPrompt(title: "Have an account?", subtitle: "Click here to login", onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            }),
          ],),
          )
        )
      ),
    );
  }


}