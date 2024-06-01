// import 'package:ecommercecourse/core/class/statusrequest.dart';
// import 'package:ecommercecourse/core/constant/routes.dart';
// import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
// import 'package:ecommercecourse/data/datasource/remote/auth/signup.dart';
// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:Dentecs/core/constant/link_API.dart';
import 'package:Dentecs/core/constant/routes.dart';
import 'package:Dentecs/data/crud.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  late TextEditingController username;
  late TextEditingController phone;

  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey();

  goToSignIn();
  Signup();
}

class SignUpControllerImp extends SignUpController with Crud {
  @override
  Signup() async {
    if (formState.currentState!.validate()) {
      var response = await postRequest(LinkPatients, {
        "first_name": "Majd",
        "last_name": "Fandi",
        "birth_date": "2000-01-27",
        "gender": true.toString(),
        "contacts_mobile": "0996997519"
      });
      update();

      if (response.statusCode == 201) {
        update();
        Get.offAllNamed(AppRoute.success);
      } else {
        print("Sign up failed");
        update();
      }
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    username.dispose();
    password.dispose();

    super.dispose();
  }
}
