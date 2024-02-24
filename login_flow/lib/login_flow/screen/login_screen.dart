
import 'package:flutter/material.dart';
import 'package:login_flow/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
        child: Column(
          children: [
            Expanded(child: Container()),
            TextField(
              onChanged: (passwordText) {},
              style: const TextStyle(fontSize: 16.0, color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                icon: const Icon(
                  Icons.message,
                  size: 22.0,
                  color: Colors.black,
                ),
                hintText: 'Login',
                hintStyle: const TextStyle(fontSize: 17.0),
              ),
              textInputAction: TextInputAction.go,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                onChanged: (passwordText) {},
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  icon: const Icon(
                    Icons.lock,
                    size: 22.0,
                    color: Colors.black,
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(fontSize: 17.0),
                ),
                textInputAction: TextInputAction.go,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: AppColor.primary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 9),
              child: const Text(
                "Login",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.background),
              ),
            ),
            Expanded(child: Container()),
            const Text("forgot password?"),
          ],
        ),
      )),
    );
  }
}
