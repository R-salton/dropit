
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPrompt extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  const LoginPrompt({super.key, required this.title, required this.subtitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return 
   Center(
    child: RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(color: Colors.grey),
        children: [
          TextSpan(
            text: subtitle,
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = onPressed,
            
            
          ),
        ],
      ),
    ),
  );
  }
}