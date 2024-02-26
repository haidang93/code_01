import 'package:flutter/material.dart';
import 'package:login_flow/utils/adapter_textField.dart';

// ignore: must_be_immutable
class FormWidget extends StatefulWidget {
  ApdaterTextField adapter;
  dynamic onChangedFuntion;

  EdgeInsetsGeometry? margin;

  FormWidget(
      {super.key,
      required this.adapter,
      this.margin = const EdgeInsets.only(top: 8),
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
        controller: widget.adapter.textController,
        onChanged: widget.onChangedFuntion,
        style: const TextStyle(fontSize: 16.0, color: Colors.black),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          icon: widget.adapter.icon,
          hintText: widget.adapter.hintText,
          hintStyle: const TextStyle(fontSize: 17.0),
        ),
        textInputAction: TextInputAction.go,
      ),
    );
  }
}
