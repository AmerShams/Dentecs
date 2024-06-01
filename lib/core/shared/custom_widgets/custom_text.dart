import 'package:flutter/material.dart';
import 'package:Dentecs/core/constant/color.dart';
import 'package:Dentecs/core/enums/text_style_type.dart';
import 'package:Dentecs/core/shared/utils.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyleType? styleType;
  final Color? textColor;
  final TextAlign? alignText;

  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? overflow;
  final int? lineNum;

  const CustomText({
    super.key,
    required this.text,
    this.styleType,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.alignText,
    this.overflow,
    this.lineNum,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getStyle(),
      overflow: overflow,
      maxLines: lineNum,
      textAlign: alignText,
    );
  }

  TextStyle getStyle() {
    TextStyle result = const TextStyle();

    switch (styleType) {
      case TextStyleType.TITLE:
        result = TextStyle(
          fontSize: fontSize ?? screenWidth(20),
          fontWeight: fontWeight ?? FontWeight.bold,
          color: textColor ?? AppColor.black,
        );
        break;
      case TextStyleType.SUBTITLE:
        result = TextStyle(
          fontSize: fontSize ?? screenWidth(24),
          fontWeight: fontWeight ?? FontWeight.w800,
          color: textColor ?? AppColor.black,
        );
        break;
      case TextStyleType.BODY:
        result = TextStyle(
          fontSize: fontSize ?? screenWidth(26),
          fontWeight: fontWeight ?? FontWeight.w400,
          color: textColor ?? AppColor.black,
        );
        break;
      case TextStyleType.SMALL:
        result = TextStyle(
          fontSize: fontSize ?? screenWidth(30),
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? AppColor.black,
        );
        break;
      case TextStyleType.NAME:
        result = TextStyle(
          fontSize: fontSize ?? screenWidth(15),
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? AppColor.black,
        );
        break;
      case TextStyleType.DATE:
        result = TextStyle(
          fontSize: fontSize ?? screenWidth(26),
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? AppColor.black,
        );
        break;

      case TextStyleType.CUSTOM:
        result = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
        break;

      default:
        result = TextStyle(
          fontSize: fontSize ?? screenWidth(31.2),
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? AppColor.black,
        );
        break;
    }

    return result;
  }
}
