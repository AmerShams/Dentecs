// ignore_for_file: file_names, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:Dentecs/controller/Homescreen_controller.dart';
import 'package:Dentecs/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    HomeScreenController homecontroller = Get.put(HomeScreenController());
    homecontroller.currentPage = 0;
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Center(
          child: Text("تم انشاء الحساب بنجاح"),
        ),
        MaterialButton(
          onPressed: () {
            Get.offNamed(AppRoute.homescreen);
          },
          color: Colors.red,
          child: const Text('تسجيل الدخول'),
        )
      ]),
    );
  }
}
