import 'package:Dentecs/core/constant/color.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(50)),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textButton,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'PlayfairDisplay')),
      ),
    );
  }
}
