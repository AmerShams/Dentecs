// ignore_for_file: deprecated_member_use, file_names, unused_local_variable

import 'package:Dentecs/controller/auth/signup_controller.dart';
import 'package:Dentecs/core/constant/color.dart';
import 'package:Dentecs/core/constant/routes.dart';
import 'package:Dentecs/core/constant/valid.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/crud.dart';
import 'package:Dentecs/widget/auth/custombodyauth.dart';
import 'package:Dentecs/widget/auth/custombuttonauth.dart';
import 'package:Dentecs/widget/auth/customtextformauth.dart';
import 'package:Dentecs/widget/auth/customtitle_login.dart';
import 'package:Dentecs/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget with Crud {
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('17'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Get.back();
        //       },
        //       icon: Icon(Icons.arrow_back))
        // ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(16), vertical: screenHeight(30)),
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) {
              return Form(
                key: controller.formState,
                child: ListView(
                  children: [
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
                      hinttext: '23'.tr,
                      iconData: Icons.person,
                      isNumber: false,
                      labeltext: "20".tr,
                      mycontroller: controller.username,
                      valid: (val) {
                        return vaildInput(val, 2, 10);
                      },
                    ),
                    CustomTextFormAuth(
                      hinttext: '22'.tr,
                      iconData: Icons.numbers_outlined,
                      isNumber: true,
                      labeltext: "21".tr,
                      mycontroller: controller.phone,
                      valid: (val) {
                        return vaildInput(val, 2, 10);
                      },
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
                    const Text(
                      'Forget Password',
                      textAlign: TextAlign.end,
                    ),
                    CustomButtomAuth(
                      text: '17'.tr,
                      onPressed: () {
                        controller.Signup();
                      },
                    ),
                    SizedBox(
                      height: screenHeight(50),
                    ),

                    CustomTextSignUpOrSignIn(
                        onTap: () {
                          Get.offNamed(AppRoute.login);
                        },
                        textone: "25".tr,
                        texttwo: '26'.tr),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text("Don't Have An Account? "),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: const Text(
                    //         'SignUp',
                    //         style: TextStyle(
                    //             color: AppColor.primaryColor,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
