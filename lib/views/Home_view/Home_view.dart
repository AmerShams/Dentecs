// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore, deprecated_member_use

import 'package:Dentecs/core/constant/routes.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/widget/WaveClipper.dart';
import 'package:Dentecs/widget/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Home_view extends StatelessWidget {
  const Home_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(196, 225, 238, 239),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: ClipPath(
                        clipper: MyWidget(),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 51, 123, 190),
                                Color.fromARGB(255, 0, 27, 58),
                              ],
                            ),
                          ),
                          height: screenHeight(4.1),
                        )),
                  ),
                  ClipPath(
                      clipper: MyWidget(),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(157, 7, 105, 112),
                              Color.fromARGB(184, 84, 127, 126),
                              Color.fromARGB(255, 178, 226, 228),
                            ],
                          ),
                        ),
                        height: screenHeight(4.23),
                      )),
                ],
              ),
              Text(
                'Reconnect with your smile',
                style: TextStyle(
                    fontFamily: "PlayfairDisplay",
                    fontSize: screenHeight(35),
                    color: const Color.fromARGB(228, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'A new approach  to dental \n comfort',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "PlayfairDisplay",
                    fontSize: screenHeight(41),
                    color: const Color.fromARGB(229, 79, 79, 79),
                    fontWeight: FontWeight.w500),
              ),
              CustomSlider(),
              SizedBox(height: screenHeight(20)),
              Container(
                width: screenWidth(2.2), // تمتد الودجة لتأخذ عرض الشاشة بالكامل
                height: screenWidth(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenHeight(55)),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(157, 7, 105, 112),
                      Color.fromARGB(255, 176, 185, 186), // لون النهاية
                    ],
                    begin: Alignment.topLeft, // ابدأ من الزاوية العلوية اليسرى
                    end: Alignment
                        .bottomRight, // انتهِ عند الزاوية السفلية اليمنى
                    stops: [0.0, 1.0], // تحديد نسبة التدرج لكل لون
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 52, 46, 72)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.book);
                  },
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      fontSize: screenHeight(40),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
