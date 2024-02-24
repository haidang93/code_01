import 'package:flutter/material.dart';
import 'package:login_flow/app_colors.dart';
import 'package:login_flow/login_flow/screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
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
