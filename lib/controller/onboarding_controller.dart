import 'package:Dentecs/core/constant/routes.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.mainView);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
