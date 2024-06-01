// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:Dentecs/core/constant/color.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:flutter/material.dart';

class BookForm extends StatelessWidget {
  final String hinttext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const BookForm(
      {super.key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth(35)),
      child: Container(
        child: TextFormField(
          cursorColor: Colors.black,
          cursorWidth: 1.2,
          keyboardType: isNumber
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          validator: valid,
          controller: mycontroller,
          obscureText:
              obscureText == null || obscureText == false ? false : true,
          decoration: InputDecoration(
              filled: true,
              hintText: hinttext,
              hintStyle: const TextStyle(fontSize: 14, color: AppColor.grey),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight(55), horizontal: screenWidth(20)),
              suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 205, 211, 210), width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black12, width: 1),
              ),
              fillColor: Colors.white),
        ),
      ),
    );
  }
}
