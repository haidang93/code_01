import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormWidget();
  }
}

class _FormWidget extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
