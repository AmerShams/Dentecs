// ignore_for_file: file_names, unused_local_variable

import 'package:Dentecs/controller/auth/login_controller.dart';
import 'package:Dentecs/core/constant/color.dart';
import 'package:Dentecs/core/constant/valid.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/widget/auth/custombodyauth.dart';
import 'package:Dentecs/widget/auth/custombuttonauth.dart';
import 'package:Dentecs/widget/auth/customtextformauth.dart';
import 'package:Dentecs/widget/auth/customtitle_login.dart';
import 'package:Dentecs/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "15".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(16), vertical: screenHeight(50)),
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) {
              return Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    SizedBox(
                      height: screenWidth(30),
                    ),
                    CustomtextTitleLog(
                      text: '10'.tr,
                    ),
                    SizedBox(
                      height: screenHeight(40),
                    ),
                    CustomBodyAuth(text: '11'.tr),
                    SizedBox(
                      height: screenHeight(30),
                    ),
                    CustomTextFormAuth(
                      hinttext: '12'.tr,
                      iconData: Icons.email_outlined,
                      isNumber: false,
                      labeltext: "Email",
                      mycontroller: controller.email,
                      valid: (val) {
                        return vaildInput(val, 2, 10);
                      },
                    ),
                    CustomTextFormAuth(
                      hinttext: '13'.tr,
                      iconData: Icons.lock_outline,
                      isNumber: false,
                      labeltext: "Password",
                      mycontroller: controller.password,
                      obscureText: true,
                      valid: (val) {
                        return vaildInput(val, 2, 10);
                      },
                    ),
                    Text(
                      '14'.tr,
                      textAlign: TextAlign.end,
                    ),
                    CustomButtomAuth(
                      text: '15'.tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
