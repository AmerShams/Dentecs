// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore, deprecated_member_use, unused_local_variable

import 'package:Dentecs/controller/ProfileController.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/widget/CustomDrawer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const CustomDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: screenWidth(50.0),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Profile',
                style: TextStyle(
                    fontFamily: "roboto", fontWeight: FontWeight.w500),
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
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
