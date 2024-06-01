// ignore_for_file: avoid_print

import 'package:Dentecs/data/crud.dart';
import 'package:Dentecs/views/Admin/AdminView.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey();

  login();
  goToSignUp();
  // goToForgetPassword();
}

class LoginControllerImp extends LoginController with Crud {
  @override
  login() async {
    if (formState.currentState!.validate()) {
      update();
      if (email.text == "admin" && password.text == "admin") {
        // Get.off(const AdminView());
      } else {
        update();
        print("Sign up failed");
      }
    }
  }

  @override
  goToSignUp() {
    Get.off(const AdminView());
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  // @override
  // goToForgetPassword() {
  //   Get.toNamed(AppRoute.forgetPassword);
  // }
}
