// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore, deprecated_member_use, unused_local_variable

import 'package:Dentecs/controller/AdminController.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/views/Admin/Confirmed.dart';
import 'package:Dentecs/views/Admin/Unconfirmed.dart';
import 'package:Dentecs/widget/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    AdminController controller = Get.put(AdminController());
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
                'Dashboard',
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(const Confirmed());
                  },
                  child: const Text("Confirmed Appointment")),
              SizedBox(
                height: screenWidth(20),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(const Unconfirmed());
                  },
                  child: const Text("Unconfirmed Appointment")),
            ],
          ),
        ),
      ),
    );
  }
}
