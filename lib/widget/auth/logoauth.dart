import 'package:Dentecs/core/constant/image_asset.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: const Color.fromARGB(195, 41, 41, 41),
      child: Padding(
        padding: const EdgeInsets.all(4), // تعديل حجم الحد
        child: ClipOval(
          child: Container(
            width: 120, // إضافة حجم الصورة
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(75, 155, 156, 156), // لون الحد
                width: 3, // عرض الحد
              ),
            ),
            child: Image.asset(
              AppImageAsset.logo,
            ),
          ),
        ),
      ),
    );
  }
}
