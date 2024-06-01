// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height);
    var firstsatrt = Offset(size.width / 5, size.height);
    var firstend = Offset(size.width / 2.25, size.height - 50);
    path.quadraticBezierTo(
        firstsatrt.dx, firstsatrt.dy, firstend.dx, firstend.dy);

    var secondsatrt =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondend = Offset(size.width, size.height - 10);

    path.quadraticBezierTo(
        secondsatrt.dx, secondsatrt.dy, secondend.dx, secondend.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
