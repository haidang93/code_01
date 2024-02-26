import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flow/login_flow/screen/home_screen_proposal.dart';
import 'package:login_flow/login_flow/widget/toast_customize.dart';
import 'package:login_flow/model/user.dart';
import 'package:login_flow/utils/adapter_textField.dart';
import 'package:login_flow/utils/provider.dart';

class LoginScreenController extends GetxController {
  late TextEditingController loginUsernameTextController;
  late TextEditingController loginPasswordTextController;
  late TextEditingController signUpEmailTextController;
  late TextEditingController signUpPasswordTextController;
  late TextEditingController signUpConfirmPasswordTextController;
  late TextEditingController signUpNameTextController;
  UserProvider provider = UserProvider();
  RxBool isLogin = true.obs;

  late List<ApdaterTextField> loginForm;
  late List<ApdaterTextField> signUpFrom;

  RxBool isLoading = false.obs;

  void initController() {
    loginUsernameTextController = TextEditingController();
    loginPasswordTextController = TextEditingController();
    signUpEmailTextController = TextEditingController();
    signUpPasswordTextController = TextEditingController();
    signUpConfirmPasswordTextController = TextEditingController();
    signUpNameTextController = TextEditingController();
    initApdapterForm();
  }

  void signInFunction(context) async {
    String username = loginUsernameTextController.value.text;
    String password = loginPasswordTextController.value.text;
    isLoading.value = true;
    bool isLoginHome =
        await provider.login(username: username, password: password);
    isLoading.value = false;
    if (isLoginHome) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      ToastCustomize.showToast(
          context: context,
          title: "Failure",
          message: "Please enter your correct account!",
          isError: true);
      clearTextController();
    }
  }

  void clearTextController() {
    signUpNameTextController.clear();
    signUpEmailTextController.clear();
    signUpPasswordTextController.clear();
    signUpConfirmPasswordTextController.clear();
    loginUsernameTextController.clear();
    loginPasswordTextController.clear();
  }

  void signUpFunction(context) async {
    String username = signUpEmailTextController.value.text;
    String password = signUpPasswordTextController.value.text;
    String name = signUpNameTextController.value.text;
    String passwordConfirm = signUpConfirmPasswordTextController.value.text;
    if (passwordConfirm == password) {
      User user = User(
        username: username,
        password: password,
        firstName: name,
      );
      isLoading.value = true;
      final rs = await provider.signUp(data: user);
      isLoading.value = false;
      if (rs) {
        clearTextController();
        ToastCustomize.showToast(
            context: context,
            title: "Successful",
            message: "Sign up your account succesful",
            isError: false);
        isLogin.value = true;
      } else {
        clearTextController();
        ToastCustomize.showToast(
            context: context,
            title: "Failure",
            message: "Account already for this username",
            isError: false);
      }
    } else {
      ToastCustomize.showToast(
          context: context,
          title: "Failure",
          message: "Please enter your confirm password correct!",
          isError: false);
      clearTextController();
    }
  }

  void disposeController() {
    loginUsernameTextController.dispose();
    loginPasswordTextController.dispose();
    signUpEmailTextController.dispose();
    signUpPasswordTextController.dispose();
    signUpConfirmPasswordTextController.dispose();
    signUpNameTextController.dispose();
  }

  changeState() {
    isLogin.value = !isLogin.value;
  }

  void initApdapterForm() {
    loginForm = [
      ApdaterTextField(
          hintText: "Username",
          icon: const Icon(
            Icons.message,
            size: 22.0,
            color: Colors.black,
          ),
          textController: loginUsernameTextController),
      ApdaterTextField(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            size: 22.0,
            color: Colors.black,
          ),
          textController: loginPasswordTextController),
    ];
    signUpFrom = [
      ApdaterTextField(
          hintText: "Your name",
          icon: const Icon(
            Icons.person,
            size: 22.0,
            color: Colors.black,
          ),
          textController: signUpNameTextController),
      ApdaterTextField(
          hintText: "Username",
          icon: const Icon(
            Icons.near_me,
            size: 22.0,
            color: Colors.black,
          ),
          textController: signUpEmailTextController),
      ApdaterTextField(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            size: 22.0,
            color: Colors.black,
          ),
          textController: signUpPasswordTextController),
      ApdaterTextField(
          hintText: "Confirm password",
          icon: const Icon(
            Icons.lock,
            size: 22.0,
            color: Colors.black,
          ),
          textController: signUpConfirmPasswordTextController),
    ];
  }
}
