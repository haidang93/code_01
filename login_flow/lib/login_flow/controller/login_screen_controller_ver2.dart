import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flow/login_flow/screen/home_screen_proposal.dart';
import 'package:login_flow/login_flow/widget/toast_customize.dart';
import 'package:login_flow/utils/provider.dart';

class LoginScreenControllerVer2 extends GetxController {
  TextEditingController loginUsernameTextController = TextEditingController();
  TextEditingController loginPasswordTextController = TextEditingController();
  UserProvider provider = UserProvider();
  final goLogin = false.obs;
  void signInFunction(context) async {
    String username = loginUsernameTextController.value.text;
    String password = loginPasswordTextController.value.text;

    final rs = await provider.login(username: username, password: password);
    if (rs.success) {
      goLogin.value = true;
      Future.delayed(const Duration(milliseconds: 380), () {
        Get.to(const HomeScreen(), transition: Transition.fade);
        clearTextController();
        goLogin.value = false;
      });
    } else {
      ToastCustomize.showToast(
          context: context,
          title: "Failure",
          message: rs.message,
          isError: true);
      clearTextController();
      goLogin.value = false;
    }
  }

  void clearTextController() {
    loginUsernameTextController.clear();
    loginPasswordTextController.clear();
  }
}
