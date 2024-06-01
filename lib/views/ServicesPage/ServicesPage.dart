// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore, deprecated_member_use, unused_local_variable

import 'package:Dentecs/controller/ServicesController.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:Dentecs/views/patients/BookedAppointment.dart';
import 'package:Dentecs/views/patients/PatientsView.dart';
import 'package:Dentecs/widget/Custom-Categroy-card.dart';

import 'package:Dentecs/widget/CustomDrawer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    ServicesController controller = Get.put(ServicesController());
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const CustomDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Booked appointments',
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
                controller.scaffoldKey.currentState!
                    .openDrawer(); // فتح الـ Drawer عند الضغط على الأيقونة
              },
              icon: const Icon(Icons.menu)),
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
                height: screenWidth(3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth(18),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(const PatientsView());
                      },
                      child: CustomCategoryCard(
                        count: "${patients.length}",
                        title: categories1[0],
                        iconcard: categoryIcon[0],
                        colors: grad[0],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(const BookedAppointment());
                      },
                      child: GetBuilder<ServicesController>(
                        builder: (controller) {
                          return CustomCategoryCard(
                            count: "${booked.length}",
                            title: categories1[1],
                            iconcard: categoryIcon[2],
                            colors: grad[2],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
