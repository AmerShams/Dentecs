import 'package:Dentecs/controller/onboarding_controller.dart';
import 'package:Dentecs/core/constant/color.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotController extends StatelessWidget {
  const DotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingImp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: EdgeInsets.only(right: screenWidth(45)),
                    duration: const Duration(milliseconds: 300),
                    width: controller.currentPage == index
                        ? screenWidth(14)
                        : screenWidth(40),
                    height: screenHeight(90),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(screenWidth(20))),
                  )),
        ],
      );
    });
  }
}
