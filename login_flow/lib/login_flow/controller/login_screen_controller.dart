import 'package:flutter/material.dart';
import 'package:login_flow/login_flow/screen/home_screen_proposal.dart';
import 'package:login_flow/login_flow/screen/login_screen.dart';
import 'package:login_flow/utils/adapter_textField.dart';

class LoginScreenController {
  late TextEditingController loginUsernameTextController;
  late TextEditingController loginPasswordTextController;
  late TextEditingController signUpEmailTextController;
  late TextEditingController signUpPasswordTextController;
  late TextEditingController signUpConfirmPasswordTextController;
  late TextEditingController signUpNameTextController;

  late List<ApdaterTextField> loginForm;
  late List<ApdaterTextField> signUpFrom;

  void initController() {
    loginUsernameTextController = TextEditingController();
    loginPasswordTextController = TextEditingController();
    signUpEmailTextController = TextEditingController();
    signUpPasswordTextController = TextEditingController();
    signUpConfirmPasswordTextController = TextEditingController();
    signUpNameTextController = TextEditingController();
    initApdapterForm();
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

  void signInFunction(context) {
    String username = loginUsernameTextController.value.text;
    String password = loginPasswordTextController.value.text;
    if (username == "abc") {
      if (password == "matkhau") {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      }
    }
  }

  void signUpFunction(context) {
    String yourName = loginUsernameTextController.value.text;
    String password = loginPasswordTextController.value.text;
    String username = loginPasswordTextController.value.text;
    String passwordConfirm = loginPasswordTextController.value.text;
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  void disposeController() {
    loginUsernameTextController.dispose();
    loginPasswordTextController.dispose();
    signUpEmailTextController.dispose();
    signUpPasswordTextController.dispose();
    signUpConfirmPasswordTextController.dispose();
    signUpNameTextController.dispose();
  }
}
