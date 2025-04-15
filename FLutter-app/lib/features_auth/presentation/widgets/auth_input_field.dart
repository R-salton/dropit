import 'package:dropit/core/theme.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {

  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassowrd;

  const AuthInputField({super.key, required this.label, required this.icon, required this.controller, required this.isPassowrd});

  @override
  Widget build(BuildContext context) {
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

}