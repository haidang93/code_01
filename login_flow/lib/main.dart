import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flow/app_colors.dart';

import 'package:login_flow/login_flow/controller/login_screen_controller_ver2.dart';
import 'package:login_flow/login_flow/screen/login_screen_version2.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenControllerVer2());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
      ),

      home: const LoginScreenVersion2(), // username: 123aaa,  password:aaa
    );
  }
}
