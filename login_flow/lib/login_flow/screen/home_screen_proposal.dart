import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flow/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: AppColor.primary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 9),
            child: const Text(
              "Sign out",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColor.background),
            ),
          ),
        ),
      ),
    );
  }
}
