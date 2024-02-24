import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_flow/app_colors.dart';
import 'package:login_flow/login_flow/widget/form_widget.dart';
import 'package:toastification/toastification.dart';

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
                toastification.show(
                  context: context,
                  type: ToastificationType.error,
                  style: ToastificationStyle.minimal,
                  autoCloseDuration: const Duration(seconds: 5),
                  title: const Text(
                    'Hello, World!',
                    style: TextStyle(color: AppColor.primary),
                  ),
                  description: RichText(
                      text: const TextSpan(
                          text: 'This is a sample toast message. ',
                          style: TextStyle(fontSize: 18, color: Colors.black))),
                  alignment: Alignment.topRight,
                  direction: TextDirection.ltr,
                  icon: const Icon(Icons.check),
                  primaryColor: AppColor.primary,
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 121, 100, 100),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(6, 86, 71, 71),
                      blurRadius: 16,
                      offset: Offset(0, 16),
                      spreadRadius: 0,
                    )
                  ],
                  showProgressBar: false,
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
