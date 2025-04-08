import 'package:dropit/core/theme.dart';
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
            _buildTexInput(context,"Email",Icons.email,_emailControl),
            _buildTexInput(context,"Password",Icons.lock,_passwordControl,isPassowrd: true),
            _buildLoginButton(context),
           _buildRegisterPrompt()
          ],),
          )
        )
      ),
    );
  }


// Register Button
   Widget _buildLoginButton(BuildContext context){

    return ElevatedButton(
      onPressed: _onSubmitted,
      style: ElevatedButton.styleFrom(
        backgroundColor: DefaultColors.buttonColor,
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          
        ),
        
      ),
      
      child: Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
      ),
    ),);
  }



// Text Input Field
  Widget _buildTexInput(BuildContext context,String label,IconData icon,TextEditingController controller, {bool isPassowrd = false}){
    return Container(

      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 10,),
        Expanded(
          child: TextField(
            obscureText: isPassowrd,
            controller: controller,
            decoration: InputDecoration(
              focusColor: Colors.transparent,
              hintText: label,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none ,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],),
    );
  }

 
// Login Prompt
Widget _buildRegisterPrompt(){

  return Center(
    child: RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style: TextStyle(color: Colors.grey),
        children: [
          TextSpan(
            text: "Click here to register",
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = () {
              // Handle login action
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterPage()));

            },
            
          ),
        ],
      ),
    ),
  );
}

}