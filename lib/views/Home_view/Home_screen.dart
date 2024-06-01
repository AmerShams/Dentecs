// ignore_for_file: file_names, prefer_const_constructors

import 'package:Dentecs/controller/Homescreen_controller.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          // floatingActionButton: FloatingActionButton(
          //   mini: true,
          //   backgroundColor: const Color.fromARGB(226, 6, 89, 156),
          //   shape: const CircleBorder(),
          //   onPressed: () {
          //     controller.changepage(0);
          //   },
          //   child: Container(
          //     height: screenHeight(11),
          //     width: screenHeight(11),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(screenHeight(20)),
          //       gradient: const LinearGradient(
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight,
          //         colors: [
          //           Color.fromARGB(255, 239, 239, 239),
          //           Color.fromARGB(133, 180, 155, 122),
          //           Color.fromARGB(167, 171, 141, 104),
          //         ],
          //       ),
          //     ),
          //     child: Icon(
          //       Icons.home,
          //       size: screenHeight(30),
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            height: screenHeight(11),
            color: Color.fromARGB(255, 79, 79, 79),
            shape: const CircularNotchedRectangle(),
            notchMargin: screenHeight(300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      controller.changepage(0);
                    },
                    child: Container(
                      height: screenWidth(5),
                      width: screenWidth(1),
                      decoration: controller.currentPage == 0
                          ? BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.symmetric(
                                  vertical: BorderSide(color: Colors.white)))
                          : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            controller.currentPage == 0
                                ? Icons.home
                                : Icons.home_outlined,
                            size: screenHeight(27.3),
                            color: Colors.white,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth(44),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      controller.changepage(2);
                    },
                    child: Container(
                      height: screenWidth(5),
                      width: screenWidth(1),
                      decoration: controller.currentPage == 2
                          ? BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.symmetric(
                                  vertical: BorderSide(color: Colors.white)))
                          : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            controller.currentPage == 2
                                ? Icons.person_pin_rounded
                                : Icons.person_pin_outlined,
                            size: screenHeight(27.3),
                            color: Colors.white,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth(44),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      controller.changepage(1);
                    },
                    child: Container(
                      height: screenWidth(5),
                      width: screenWidth(1),
                      decoration: controller.currentPage == 1
                          ? BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.symmetric(
                                  vertical: BorderSide(color: Colors.white)))
                          : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            controller.currentPage == 1
                                ? Icons.account_tree
                                : Icons.account_tree_outlined,
                            size: screenHeight(27.3),
                            color: Colors.white,
                          ),
                          Text(
                            "Services",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth(44),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      controller.changepage(3);
                    },
                    child: Container(
                      height: screenWidth(5),
                      width: screenWidth(1),
                      decoration: controller.currentPage == 3
                          ? BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.symmetric(
                                  vertical: BorderSide(color: Colors.white)))
                          : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            controller.currentPage == 3
                                ? Icons.person
                                : Icons.person_outline,
                            size: screenHeight(27.3),
                            color: Colors.white,
                          ),
                          Text(
                            "Admin",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth(44),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: controller.listPage.elementAt(controller.currentPage),
        );
      },
    );
  }
}
