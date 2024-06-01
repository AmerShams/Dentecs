import 'package:Dentecs/core/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Dentecs/core/constant/image_asset.dart';
import 'package:Dentecs/core/constant/routes.dart';

class WavyShape extends StatelessWidget {
  const WavyShape({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeScreenController controller = Get.put(HomeScreenController());
    return CustomPaint(
      size: const Size(150, 200),
      painter: _WavyShapePainter(),
      child: Row(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.offAllNamed(AppRoute.homescreen);
                },
                child: Image.asset(
                  AppImageAsset.logo,
                  width: screenWidth(3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WavyShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFC7B090),
          Color(0xFFB89A74),
          Color(0xFFA88458),
          Color(0xFF7C6A54),
          Color(0xFF4F4F4F),
        ],
      ).createShader(rect);

    final path = Path()
      ..moveTo(0, size.height * 0.9)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.85,
          size.width * 0.5, size.height * 0.7)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.55, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
