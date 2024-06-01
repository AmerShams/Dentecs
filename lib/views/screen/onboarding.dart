import 'package:Dentecs/controller/onboarding_controller.dart';
import 'package:Dentecs/widget/onboarding/custombutton.dart';
import 'package:Dentecs/widget/onboarding/customslider.dart';
import 'package:Dentecs/widget/onboarding/dotcpntroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingImp);
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 3,
          child: CustomSlider(),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                DotController(),
                Spacer(
                  flex: 2,
                ),
                CustomButtonOnBoarding()
              ],
            ))
      ],
    )));
  }
}
