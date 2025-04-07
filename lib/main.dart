import 'package:dropit/chat_page.dart';
import 'package:dropit/core/theme.dart';
import 'package:dropit/message_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_page.dart';
import 'register_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
         splitScreenMode: true,
         builder: (context, child) => const Scaffold(
          body: Center(
            child: LoginPage(),
          ),
        
         ),)
    );
  }
}
