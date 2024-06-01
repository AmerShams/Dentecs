// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore, deprecated_member_use, unused_local_variable

import 'package:Dentecs/controller/AdminController.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:Dentecs/widget/CustomCardAppointment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Unconfirmed extends StatelessWidget {
  const Unconfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    AdminController controller = Get.put(AdminController());
    return Scaffold(
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
        // leading: Padding(
        //   padding: const EdgeInsets.only(bottom: 5),
        //   child: IconButton(
        //       onPressed: () {
        //         controller.scaffoldKey.currentState!
        //             .openDrawer(); // فتح الـ Drawer عند الضغط على الأيقونة
        //       },
        //       icon: const Icon(Icons.menu)),
        // ),
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

              // SizedBox(
              //   height: screenWidth(3),
              // ),

              GetBuilder<AdminController>(builder: (controller) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                  width: 320.0,
                  height: screenHeight(1.19),
                  child: ListView.builder(
                      itemCount: allbooked.length,
                      itemBuilder: (ctx, index) {
                        if (allbooked[index]['confirmed'] == false) {
                          return CustomCardAppointment(
                            deleteFunc: (i) {
                              controller.deleteappointment(index);
                            },
                            id: allbooked[index]['id'],
                            date: '${allbooked[index]['date']}',
                            starttime: '${allbooked[index]['start_time']}',
                            confirmed: '${allbooked[index]['confirmed']}',
                            patient: '${allbooked[index]['patient']}',
                            service: '${allbooked[index]['service']}',
                            doctor: '${allbooked[index]['doctor']}',
                          );
                        } else {
                          return const SizedBox();
                        }
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
