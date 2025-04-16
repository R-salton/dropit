import 'package:dropit/core/theme.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;
  const AuthButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: DefaultColors.buttonColor,
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          
        ),
        
      ),
      
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
      ),
    ),);
  }
}