import 'package:flutter/material.dart';
import 'package:login_flow/app_colors.dart';
import 'package:toastification/toastification.dart';

class ToastCustomize {
  static dynamic showToast({
    required context,
    bool isError = false,
    String title = "Title",
    String message = "Toast with message",
  }) {
    return toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.minimal,
      autoCloseDuration: const Duration(seconds: 5),
      title: Text(
        title,
        style: TextStyle(color: isError ? AppColor.error : AppColor.primary),
      ),
      description: RichText(
          text: TextSpan(
              text: message,
              style: const TextStyle(fontSize: 16, color: Colors.black))),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      icon: const Icon(Icons.close),
      primaryColor: isError ? AppColor.error : AppColor.primary,
      backgroundColor: Colors.white,
      foregroundColor: const Color.fromARGB(255, 121, 100, 100),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
  }
}
