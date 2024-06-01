import 'package:Dentecs/core/constant/routes.dart';
import 'package:Dentecs/core/localization/changelocal.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/widget/language/custombutton_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.all(screenWidth(4.5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: screenWidth(13)),
              CustomButtonLang(
                textButton: "AR",
                onPressed: () {
                  // controller.changeLang('ar');

                  Get.toNamed(AppRoute.mainView);
                },
              ),
              SizedBox(height: screenWidth(15)),
              CustomButtonLang(
                textButton: "EN",
                onPressed: () {
                  // controller.changeLang('en');

                  Get.toNamed(AppRoute.mainView);
                },
              ),
            ],
          )),
    );
  }
}
