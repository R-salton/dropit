import 'package:dropit/core/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

void _onSubmitted() {
  String username = _usernameControl.text;
  String email = _emailControl.text;
  String password = _passwordControl.text;
  // Perform registration logic here
  print('Username: $username');
  print('Email: $email');
  print('Password: $password');
  // Clear the text fields after submission


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
            _buildTexInput(context,"Username",Icons.person,_usernameControl),
            _buildTexInput(context,"Email",Icons.email,_emailControl),
            _buildTexInput(context,"Password",Icons.lock,_passwordControl,isPassowrd: true),
            _buildRegisterButton(context),
           _buildLoginPrompt()
          ],),
          )
        )
      ),
    );
  }


// Register Button
   Widget _buildRegisterButton(BuildContext context){

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
        "Register",
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
Widget _buildLoginPrompt(){

  return Center(
    child: RichText(
      text: TextSpan(
        text: "Already have an account? ",
        style: TextStyle(color: Colors.grey),
        children: [
          TextSpan(
            text: "Click here to login",
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = () {
              // Handle login action
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())
              );

            },
            
          ),
        ],
      ),
    ),
  );
}





}