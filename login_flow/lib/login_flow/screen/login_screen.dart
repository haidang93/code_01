import 'package:flutter/material.dart';
import 'package:login_flow/app_colors.dart';
import 'package:login_flow/login_flow/screen/home_screen_proposal.dart';
import 'package:login_flow/login_flow/widget/form_widget.dart';
import 'package:login_flow/login_flow/widget/toast_customize.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  bool isLoadingLogin = false;

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
            FormWidget(
              hintText: 'Login',
              icon: const Icon(
                Icons.message,
                size: 22.0,
                color: Colors.black,
              ),
              onChangedFuntion: null,
            ),
            FormWidget(
              hintText: 'Password',
              icon: const Icon(
                Icons.lock,
                size: 22.0,
                color: Colors.black,
              ),
              onChangedFuntion: null,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: isLoadingLogin
                  ? const CircularProgressIndicator()
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoadingLogin = !isLoadingLogin;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: AppColor.primary,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 9),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.background),
                        ),
                      ),
                    ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              child: const Text("Sign up new account?"),
              onTap: () {
                ToastCusomize.showToast(
                    context: context,
                    title: "Test",
                    message: "Hello Minh Hieu is sleeping ?",
                    isError: true);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
            ),
          ],
        ),
      )),
    );
  }
}
