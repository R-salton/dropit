import 'package:dropit/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final _usernameControl = TextEditingController();
    final _passwordControl = TextEditingController();
    final _emailControl = TextEditingController();


    return Scaffold(
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
        ],),
        )
      )
    );
    
  }

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
              hintText: label,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none ,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
            ),
          ),
        ),
      ],),
    );
  }

//Register Button
  Widget _buildRegisterButton(BuildContext context){

    return ElevatedButton(
      onPressed: () {
        // Handle register action
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: DefaultColors.buttonColor,
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          
        ),
        
      ),
      
      child: Text(
        "Register",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }


}