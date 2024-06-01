// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore, deprecated_member_use, unused_local_variable

import 'package:Dentecs/controller/ServicesController.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:Dentecs/widget/CustomCard.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PatientsView extends StatelessWidget {
  const PatientsView({super.key});

  @override
  Widget build(BuildContext context) {
    ServicesController controller = Get.put(ServicesController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'All Patients',
                style: TextStyle(
                    fontFamily: "roboto",
                    fontSize: screenWidth(15),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(196, 225, 238, 239),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: screenWidth(5),
              // ),

              SizedBox(
                height: screenWidth(10),
              ),

              GetBuilder<ServicesController>(builder: (controller) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  width: 320.0,
                  height: screenHeight(1.3), // ارتفاع ثابت بدلاً من Infinity
                  child: ListView.builder(
                      itemCount: patients.length,
                      itemBuilder: (ctx, index) {
                        return CustomCard(
                          date: patients[index][2],
                          category: " ${patients[index][0]}",
                          important: true,
                          onPressedImporntant: () {},
                          deleteFunc: (i) {
                            controller.deletepaatient(index);
                          },
                          firstname: patients[index][1],
                          lastname: patients[index][6],
                        );
                      }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
