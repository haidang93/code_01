import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_flow/app_colors.dart';
import 'package:login_flow/login_flow/controller/login_screen_controller_ver2.dart';
import 'package:login_flow/utils/helper_function.dart';

class LoginScreenVersion2 extends StatefulWidget {
  const LoginScreenVersion2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenVersion2();
  }
}

class _LoginScreenVersion2 extends State<LoginScreenVersion2> {
  final controller = Get.find<LoginScreenControllerVer2>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => removeFocus(context),
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColor.primary,
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height - 320,
              left: 50,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(45 / 360),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.primary2,
                      borderRadius: BorderRadius.circular(90)),
                  height: 600,
                  width: 400,
                ),
              ),
            ),
            Positioned(
              left: 300,
              bottom: 200,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(45 / 360),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.primary2,
                      borderRadius: BorderRadius.circular(90)),
                  height: MediaQuery.sizeOf(context).height,
                  width: 200,
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 180,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(45 / 360),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.primary2,
                      borderRadius: BorderRadius.circular(90)),
                  height: MediaQuery.sizeOf(context).height,
                  width: 150,
                ),
              ),
            ),
            Positioned(
              right: 200,
              top: -200,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(45 / 360),
                child: Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    decoration: BoxDecoration(
                        color: AppColor.background,
                        borderRadius: BorderRadius.circular(120)),
                    height: controller.goLogin.value
                        ? MediaQuery.sizeOf(context).height + 800
                        : MediaQuery.sizeOf(context).height,
                    width: controller.goLogin.value
                        ? MediaQuery.sizeOf(context).height - 300
                        : MediaQuery.sizeOf(context).height,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 170, left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 300,
                    child: TextField(
                      controller: controller.loginUsernameTextController,
                      decoration: const InputDecoration(
                          labelText: "Username/ Email",
                          labelStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.black),
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColor.primary,
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 300,
                    child: TextField(
                      controller: controller.loginPasswordTextController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(.1),
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.black),
                          prefixIcon: Icon(
                            Icons.lock_sharp,
                            color: AppColor.primary,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  controller.signInFunction(context);
                },
                child: Container(
                    margin: const EdgeInsets.only(left: 30, right: 60),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.65, color: AppColor.primary),
                        borderRadius: BorderRadius.circular(24),
                        color: AppColor.backgroundButton),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "LOG IN NOW",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColor.primary),
                        ),
                        Image.asset(
                          'assets/icon_go_right.png',
                          height: 35,
                        )
                      ],
                    )),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 200, left: 200),
              alignment: Alignment.bottomRight,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Log in via",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook_sharp,
                        size: 32,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.telegram,
                        size: 32,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.tiktok,
                        size: 32,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
