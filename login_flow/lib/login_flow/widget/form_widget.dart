import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormWidget extends StatefulWidget {
  TextEditingController? controller;
  dynamic onChangedFuntion;
  Widget? icon;
  String? hintText;
  EdgeInsetsGeometry? margin;

  FormWidget(
      {super.key,
      this.controller,
      this.hintText = "Enter your  code",
      this.icon = const Icon(
        Icons.lock,
        size: 22.0,
        color: Colors.black,
      ),
      this.margin,
      this.onChangedFuntion});

  @override
  State<StatefulWidget> createState() {
    return _FormWidget();
  }
}

class _FormWidget extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChangedFuntion,
        style: const TextStyle(fontSize: 16.0, color: Colors.black),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          icon: widget.icon,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 17.0),
        ),
        textInputAction: TextInputAction.go,
      ),
    );
  }
  /*
    const Icon(
            Icons.lock,
            size: 22.0,
            color: Colors.black,
          ),
  */
}
