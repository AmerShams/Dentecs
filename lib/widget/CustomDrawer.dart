// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:Dentecs/core/constant/color.dart';
import 'package:Dentecs/core/constant/routes.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:Dentecs/widget/custom_curved_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        width: screenWidth(4 / 3),
        backgroundColor: const Color.fromARGB(229, 79, 79, 79),
        elevation: 11,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight(25.5),
              ),
              SizedBox(
                height: screenWidth(3),
                child: const Center(
                  child: WavyShape(),
                ),
              ),
              SizedBox(
                height: screenHeight(40),
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth(40),
                  ),
                  SizedBox(
                    height: screenHeight(6.5),
                    width: screenWidth(3.2),
                    child: Stack(
                      children: [
                        Positioned(
                          left: screenWidth(31),
                          child: InkWell(
                            onTap: () {
                              Get.offAllNamed(
                                AppRoute.role,
                              );
                            },
                            child: Card(
                              elevation: 5,
                              shape: const CircleBorder(),
                              child: CircleAvatar(
                                radius: screenWidth(10.0),
                                backgroundColor: AppColor.backgroundcolor,
                                child: Icon(
                                  FontAwesomeIcons.userDoctor,
                                  size: screenWidth(10),
                                  color: const Color.fromARGB(255, 44, 48, 64),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight(9.1),
                          left: screenWidth(39),
                          child: Column(
                            children: [
                              Text(
                                drawerModel[4].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(6.5),
                    width: screenWidth(3.2),
                    child: Stack(
                      children: [
                        Positioned(
                          left: screenWidth(31),
                          child: InkWell(
                            onTap: () {
                              Get.offAllNamed(
                                AppRoute.organization,
                              );
                            },
                            child: Card(
                              elevation: 5,
                              shape: const CircleBorder(),
                              child: CircleAvatar(
                                radius: screenWidth(10.0),
                                backgroundColor: AppColor.backgroundcolor,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: screenWidth(66),
                                      bottom: screenWidth(300)),
                                  child: Icon(
                                    FontAwesomeIcons.sitemap,
                                    size: screenWidth(10),
                                    color:
                                        const Color.fromARGB(255, 44, 48, 64),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight(9.1),
                          left: screenWidth(39),
                          child: Container(
                              child: Column(
                            children: [
                              Text(
                                drawerModel[1].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight(40),
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth(40),
                  ),
                  SizedBox(
                    height: screenHeight(6.5),
                    width: screenWidth(3.2),
                    child: Stack(
                      children: [
                        Positioned(
                          left: screenWidth(31),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.language);
                            },
                            child: Card(
                              elevation: 5,
                              shape: const CircleBorder(),
                              child: CircleAvatar(
                                radius: screenWidth(10.0),
                                backgroundColor: AppColor.backgroundcolor,
                                child: Icon(
                                  FontAwesomeIcons.gear,
                                  size: screenWidth(10),
                                  color: const Color.fromARGB(255, 44, 48, 64),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight(9.1),
                          left: screenWidth(20),
                          child: Container(
                              child: const Column(
                            children: [
                              Text(
                                "Settings",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(6.5),
                    width: screenWidth(3.2),
                    child: Stack(
                      children: [
                        Positioned(
                          left: screenWidth(31),
                          child: InkWell(
                            onTap: () {
                              Get.offAllNamed(
                                AppRoute.aboutSyn,
                              );
                            },
                            child: Card(
                              elevation: 5,
                              shape: const CircleBorder(),
                              child: CircleAvatar(
                                radius: screenWidth(10.0),
                                backgroundColor: AppColor.backgroundcolor,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Icon(
                                    FontAwesomeIcons.circleH,
                                    size: screenWidth(10),
                                    color:
                                        const Color.fromARGB(255, 44, 48, 64),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight(9.1),
                          left: screenWidth(23),
                          child: Container(
                              child: Column(
                            children: [
                              Text(
                                drawerModel[2].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight(40),
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth(40),
                  ),
                  SizedBox(
                    height: screenHeight(6.5),
                    width: screenWidth(3.2),
                    child: Stack(
                      children: [
                        Positioned(
                          left: screenWidth(31),
                          child: InkWell(
                            onTap: () {
                              Get.offAllNamed(
                                AppRoute.contactUs,
                              );
                            },
                            child: Card(
                              elevation: 5,
                              shape: const CircleBorder(),
                              child: CircleAvatar(
                                radius: screenWidth(10.0),
                                backgroundColor: AppColor.backgroundcolor,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Icon(
                                    FontAwesomeIcons.phone,
                                    size: screenWidth(10),
                                    color:
                                        const Color.fromARGB(255, 44, 48, 64),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight(9.1),
                          left: screenWidth(39),
                          child: Container(
                              child: Column(
                            children: [
                              Text(
                                drawerModel[3].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(6.5),
                    width: screenWidth(3.2),
                    child: Stack(
                      children: [
                        Positioned(
                          left: screenWidth(31),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.login);
                            },
                            child: Card(
                              elevation: 5,
                              shape: const CircleBorder(),
                              child: CircleAvatar(
                                radius: screenWidth(10.0),
                                backgroundColor: AppColor.backgroundcolor,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Icon(
                                    FontAwesomeIcons.userTie,
                                    size: screenWidth(10),
                                    color:
                                        const Color.fromARGB(255, 44, 48, 64),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight(9.1),
                          left: screenWidth(200),
                          child: Container(
                              child: Column(
                            children: [
                              Text(
                                drawerModel[5].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
