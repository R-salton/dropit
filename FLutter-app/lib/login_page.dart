import 'package:dropit/core/theme.dart';
import 'package:dropit/features_auth/presentation/widgets/auth_button.dart';
import 'package:dropit/features_auth/presentation/widgets/auth_input_field.dart';
import 'package:dropit/features_auth/presentation/widgets/login_prompt.dart';
import 'package:dropit/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    final _passwordControl = TextEditingController();
    final _emailControl = TextEditingController();

void _onSubmitted() {

  String email = _emailControl.text;
  String password = _passwordControl.text;
  // Perform registration logic here

  print('Email: $email');
  print('Password: $password');
  // Clear the text fields after submission


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
            AuthButton(label: "Login", onPressed: _onSubmitted),
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