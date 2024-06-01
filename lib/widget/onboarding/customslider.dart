import 'package:Dentecs/controller/onboarding_controller.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingImp con = Get.put(OnBoardingImp());
    return PageView.builder(
        controller: con.pageController,
        onPageChanged: (val) {
          con.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                SizedBox(
                  height: screenHeight(30),
                ),
                Text(
                  onBoardingList[i].title!,
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: screenHeight(30),
                ),
                Image.asset(
                  onBoardingList[i].image!,
                  width: screenWidth(1.2),
                  height: screenHeight(3.0),
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: screenHeight(20),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ));
  }
}
