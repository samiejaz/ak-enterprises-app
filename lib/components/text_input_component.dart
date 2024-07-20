import 'package:flutter/material.dart';

class TextInputComponent extends StatelessWidget {
  final TextEditingController controller;
  final double borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;
  final EdgeInsetsGeometry contentPadding;
  final String hintText;

  const TextInputComponent({
    super.key,
    required this.controller,
    this.borderRadius = 0,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.green,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 8.0,
      vertical: 4.0,
    ),
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(
            color: borderColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(
            color: borderColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(
            color: focusedBorderColor,
            width: 2.0,
          ),
        ),
        isDense: true,
        contentPadding: contentPadding,
      ),
    );
  }
}
