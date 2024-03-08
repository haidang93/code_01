import 'package:flutter/material.dart';
import 'package:login_flow/app_colors.dart';

import 'package:login_flow/login_flow/screen/login_screen_version2.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
      ),
      home: const LoginScreenVersion2(),
    );
  }
}
