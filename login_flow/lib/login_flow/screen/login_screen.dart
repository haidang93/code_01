import 'package:flutter/material.dart';
import 'package:login_flow/app_colors.dart';
import 'package:login_flow/login_flow/controller/login_screen_controller.dart';
import 'package:login_flow/login_flow/widget/form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  bool isLoading = false;
  bool isLogin = true;

  LoginScreenController controller = LoginScreenController();

  @override
  void initState() {
    super.initState();
    controller.initController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.disposeController();
  }

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
            formWidget(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   isLoading = !isLoading;
                        // });
                        if (isLoading) {
                          controller.signInFunction(context);
                        } else {
                          controller.signUpFunction(context);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: AppColor.primary,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 9),
                        child: Text(
                          isLogin ? "Sign in" : "Sign up",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.background),
                        ),
                      ),
                    ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              child: Text(
                  isLogin ? "Sign up new account?" : "Sign in with account"),
              onTap: () {
                // ToastCusomize.showToast(
                //     context: context,
                //     title: "Test",
                //     message: "Hello Minh Hieu is sleeping ?",
                //     isError: true);
                setState(() {
                  isLogin = !isLogin;
                });
              },
            ),
          ],
        ),
      )),
    );
  }

  Widget formWidget() {
    if (isLogin) {
      return Column(
        children: controller.loginForm
            .map((e) => FormWidget(
                  adapter: e,
                ))
            .toList(),
      );
    }
    return Column(
      children: controller.signUpFrom
          .map((e) => FormWidget(
                adapter: e,
              ))
          .toList(),
    );
  }
}
