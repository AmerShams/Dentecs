import 'package:flutter/material.dart';
import 'package:Dentecs/core/constant/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String keyLabel;
  final String keyHint;
  final Color? fillColor;
  final TextEditingController controller;
  const CustomTextFormField({
    super.key,
    required this.keyLabel,
    required this.keyHint,
    this.fillColor,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: fillColor == null ? false : true,
        fillColor: fillColor ?? AppColor.backgroundcolor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: keyLabel,
        hintText: keyHint,
        hintStyle: const TextStyle(
          color: AppColor.grey2,
        ),
      ),
    );
  }
}
