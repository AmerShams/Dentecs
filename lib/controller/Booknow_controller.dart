// ignore_for_file: file_names, non_constant_identifier_names, avoid_single_cascade_in_expression_statements, use_build_context_synchronously
import 'package:Dentecs/data/crud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BooknowController extends GetxController {
  void reset();
  onchaged(page);
}

class BooknowControllerImp extends BooknowController with Crud {
  late PageController pageController;
  int currentPage = 0;

  @override
  void onInit() {
    // print(patients[0].firstName);
    // print(patients[1].firstName);

    pageController = PageController();
    super.onInit();
  }

  @override
  onchaged(page) {
    currentPage = page;
    update();
  }

  @override
  void reset() {
    currentPage = 0;
  }
}
